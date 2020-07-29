import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/Models/feed/feed.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/imports.dart';
import 'package:rxdart/rxdart.dart';

class FeedServices extends Services {
  // final CollectionReference _postsCollectionReference =
  //     Firestore.instance.collection('feed');

  final BehaviorSubject<List<Announcement>> postsController =
      BehaviorSubject<List<Announcement>>();

  // #6: Create a list that will keep the paged results
  List<List<Announcement>> allPagedResults = List<List<Announcement>>();

  static const int PostsLimit = 6;

  DocumentSnapshot lastDocument;
  bool _hasMorePosts = true;
  List<Announcement> allPosts = List<Announcement>();
  // CollectionReference schoolRefs;

  Observable listenToPostsRealTime({String stdDivGlobal}) {
    _requestPosts(stdDivGlobal: stdDivGlobal);
    return postsController.stream;
  }

  // #1: Move the request feed into it's own function
  void _requestPosts({
    String stdDivGlobal,
  }) async {
    var _postRef =
        (await schoolRefwithCode()).document('Posts').collection(stdDivGlobal);
    // #2: split the query from the actual subscription
    var pagePostsQuery = _postRef
        .orderBy('timeStamp', descending: true)
        // #3: Limit the amount of results
        .limit(PostsLimit);

    // #5: If we have a document start the query after it
    if (lastDocument != null) {
      pagePostsQuery = pagePostsQuery.startAfterDocument(lastDocument);
    }

    if (!_hasMorePosts) return;

    // #7: Get and store the page index that the results belong to
    var currentRequestIndex = allPagedResults.length;

    pagePostsQuery.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        List<Announcement> feed = postsSnapshot.documents
            .map((snapshot) => Announcement.fromSnapshot(snapshot))
            // .where((mappedItem) => mappedItem.caption != null)
            .toList();
        // #8: Check if the page exists or not
        var pageExists = currentRequestIndex < allPagedResults.length;

        // #9: If the page exists update the feed for that page
        if (pageExists) {
          allPagedResults[currentRequestIndex] = feed;
        }
        // #10: If the page doesn't exist add the page data
        else {
          allPagedResults.add(feed);
        }

        // #11: Concatenate the full list to be shown
        allPosts = allPagedResults.fold<List<Announcement>>(
            List<Announcement>(),
            (initialValue, pageItems) => initialValue..addAll(pageItems));

        // #12: Broadcase all feed
        postsController.add(allPosts);

        // #13: Save the last document from the results only if it's the current last page
        if (currentRequestIndex == allPagedResults.length - 1) {
          lastDocument = postsSnapshot.documents.last;
        }

        // #14: Determine if there's more feed to request
        _hasMorePosts = feed.length == PostsLimit;
      }
    });
  }

  void requestMoreData({String stdDivGlobal}) =>
      _requestPosts(stdDivGlobal: stdDivGlobal);
}
