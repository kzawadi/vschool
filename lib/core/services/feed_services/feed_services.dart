import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/imports.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:path/path.dart' as p;

class FeedServices extends Services {
  // final CollectionReference _postsCollectionReference =
  //     Firestore.instance.collection('feed');

  StorageServices _storageServices = locator<StorageServices>();

  final PublishSubject<List<Announcement>> postsController =
      PublishSubject<List<Announcement>>();

  // #6: Create a list that will keep the paged results
  List<List<Announcement>> _allPagedResults = List<List<Announcement>>();
  List<Announcement> feed = List<Announcement>();

  static const int PostsLimit = 6;

  DocumentSnapshot _lastDocument;
  // bool _hasMorePosts = true;
  List<Announcement> allPosts = List<Announcement>();
  // CollectionReference schoolRefs;

  Stream listenToPostsRealTime({String stdDivGlobal}) {
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
    if (_lastDocument != null) {
      pagePostsQuery = pagePostsQuery.startAfterDocument(_lastDocument);
    }

    // if (!_hasMorePosts) return;

    // #7: Get and store the page index that the results belong to
    var currentRequestIndex = _allPagedResults.length;

    pagePostsQuery.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        feed = postsSnapshot.documents
            .map((snapshot) => Announcement.fromSnapshot(snapshot))
            // .where((mappedItem) => mappedItem.caption != null)
            .toList();
        // #8: Check if the page exists or not
        var pageExists = currentRequestIndex < _allPagedResults.length;

        // #9: If the page exists update the feed for that page
        if (pageExists) {
          _allPagedResults[currentRequestIndex] = feed;
        }
        // #10: If the page doesn't exist add the page data
        else {
          _allPagedResults.add(feed);
          print('the last feed fetched ' + feed.last.caption.toString());
        }

        // #11: Concatenate the full list to be shown
        allPosts = _allPagedResults.fold<List<Announcement>>(
            List<Announcement>(),
            (initialValue, pageItems) => initialValue..addAll(pageItems));

        // #12: Broadcase all feed
        postsController.add(allPosts);

        // #13: Save the last document from the results only if it's the current last page
        if (currentRequestIndex == _allPagedResults.length - 1) {
          _lastDocument = postsSnapshot.documents.last;
        }

        // #14: Determine if there's more feed to request
        // _hasMorePosts = feed.length == PostsLimit;
      }
    });
  }

  void requestMoreData({String stdDivGlobal}) =>
      _requestPosts(stdDivGlobal: stdDivGlobal);

  ///this will clear the already fetched data and pass in [std] and be fetched again
  void filteredFeed({String std}) {
    _allPagedResults.clear();
    _lastDocument = null;
    requestMoreData(stdDivGlobal: std);
  }

  /// this will delete in firestore a given feed by its Id
  Future deletefeed(String id, String stdDivGlobal) async {
    // Map feedMap = feed.toJson();

    var _postRef = (await schoolRefwithCode())
        .document('Posts')
        .collection(stdDivGlobal)
        .document(id);
    print('Feed with Id $id' + 'has been deleted succeful');
    await _postRef.delete();
  }

  /// This function post the post either global or class
  /// oriented it uses a cloud function to do so
  Future postFeed({Announcement feed}) async {
    // if (firebaseUser == null) await getFirebaseUser();
    if (schoolCode == null) await getSchoolCode();

    //Timestmap will be directly set by Firebase Functions(througn REST Api)
    // feed.timestamp = Timestamp.now();

    String fileName = "";
    String filePath = "";

    if (feed.photoUrl != '') {
      fileName = createCryptoRandomString(8) +
          createCryptoRandomString(8) +
          p.extension(feed.photoUrl);

      feed.photoUrl = await _storageServices.uploadAnnouncemantPhoto(
          feed.photoUrl, fileName);

      filePath = '${Services.country}/$schoolCode/Posts/$fileName';
    }
    feed.photoPath = filePath;
    Map feedMap = feed.toJson();

    var body = json.encode({
      "schoolCode": schoolCode.toUpperCase(),
      "country": Services.country,
      "feed": feedMap
    });

    print(body.toString());

    final response =
        await http.post(postAnnouncemnetUrl, body: body, headers: headers);

    if (response.statusCode == 200) {
      print("Post posted Succesfully");
      print(json.decode(response.body).toString());
    } else {
      print("Post posting failed");
    }
  }
}
