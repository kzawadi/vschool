import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/Models/Announcement.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/core/services/StorageServices.dart';
import 'package:ourESchool/locator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ourESchool/UI/Utility/constants.dart';
import 'package:path/path.dart' as p;
import 'package:stacked/stacked.dart';

class FeedServices extends Services with ReactiveServiceMixin {
  RxValue<String> _counter = RxValue<String>(initial: "Global");
  String get counter => _counter.value;

  FeedServices() {
    listenToReactiveValues([_counter]);
  }

  void changeFeedType({String type}) {
    _counter.value = type;
  }
  // final CollectionReference _postsCollectionReference =
  //     Firestore.instance.collection('feed');

  StorageServices _storageServices = locator<StorageServices>();

  final PublishSubject<List<Announcement>> postsController =
      PublishSubject<List<Announcement>>();
  // final PublishSubject<List<Announcement>> profileDataController =
  // PublishSubject<List<Announcement>>();

  // #6: Create a list that will keep the paged results
  List<List<Announcement>> _allPagedResults = List<List<Announcement>>();
  List<Announcement> _feed = List<Announcement>();

  static const int PostsLimit = 6;

  DocumentSnapshot _lastDocument;
  // bool _hasMorePosts = true;
  List<Announcement> allPosts = List<Announcement>();
  // CollectionReference schoolRefs;

  Stream<List<Announcement>> listenToPostsRealTime({String stdDivGlobal}) {
    _requestPosts(stdDivGlobal: stdDivGlobal);
    return postsController.stream;
  }

  // #1: Move the request feed into it's own function
  void _requestPosts({
    String stdDivGlobal,
  }) async {
    var _postRef =
        (await schoolRefwithCode()).doc('Posts').collection(stdDivGlobal);
    // #2: split the query from the actual subscription
    var doc = await _postRef.get();
    if (doc.docs.isNotEmpty) {
      var pagePostsQuery = _postRef
          .orderBy('timeStamp', descending: true)
          // #3: Limit the amount of results
          .limit(PostsLimit);

      // #5: If we have a doc start the query after it
      if (_lastDocument != null) {
        pagePostsQuery = pagePostsQuery.startAfterDocument(_lastDocument);
      }

      // if (!_hasMorePosts) return;

      // #7: Get and store the page index that the results belong to
      var currentRequestIndex = _allPagedResults.length;

      pagePostsQuery.snapshots().listen(
        (postsSnapshot) {
          if (postsSnapshot.docs.isNotEmpty) {
            _feed = postsSnapshot.docs
                .map((snapshot) => Announcement.fromSnapshot(snapshot))
                // .where((mappedItem) => mappedItem.caption != null)
                .toList();
            // #8: Check if the page exists or not
            var pageExists = currentRequestIndex < _allPagedResults.length;

            // #9: If the page exists update the feed for that page
            if (pageExists) {
              _allPagedResults[currentRequestIndex] = _feed;
            }
            // #10: If the page doesn't exist add the page data
            else {
              _allPagedResults.add(_feed);
              cprint('the last feed fetched ' + _feed.last.caption.toString(),
                  event: 'Last feed fetched and entered into stream',
                  warningIn: 'This is the last available feed localy');
            }

            // #11: Concatenate the full list to be shown
            allPosts = _allPagedResults.fold<List<Announcement>>(
                List<Announcement>(),
                (initialValue, pageItems) => initialValue..addAll(pageItems));

            // #12: Broadcase all feed
            postsController.add(UnmodifiableListView(allPosts));

            // #13: Save the last doc from the results only if it's the current last page
            if (currentRequestIndex == _allPagedResults.length - 1) {
              _lastDocument = postsSnapshot.docs.last;
            }

            // #14: Determine if there's more feed to request
            // _hasMorePosts = feed.length == PostsLimit;
          }
        },
      );
    } else
      cprint('No Class with this name yet', errorIn: 'No Data');
  }

  void requestMoreData({String stdDivGlobal}) =>
      _requestPosts(stdDivGlobal: stdDivGlobal);

  ///this will clear the already fetched data and pass in [std] and be fetched again
  void filteredFeed() {
    _allPagedResults.clear();
    _lastDocument = null;
    allPosts.clear();
    requestMoreData(stdDivGlobal: counter);
  }

  /// this will delete in firestore a given feed by its Id
  Future deletefeed(String id, String stdDivGlobal) async {
    // Map feedMap = feed.toJson();

    var _postRef = (await schoolRefwithCode())
        .doc('Posts')
        .collection(stdDivGlobal)
        .doc(id);
    cprint('Feed with Id $id' + 'has been deleted succeful',
        event: 'deleted Feed');
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
    String standard;

    if (feed.photoUrl != '') {
      fileName = createCryptoRandomString(8) +
          createCryptoRandomString(8) +
          p.extension(feed.photoUrl);

      feed.photoUrl = await _storageServices.uploadAnnouncemantPhoto(
          feed.photoUrl, fileName);

      filePath = '${Services.country}/$schoolCode/Posts/$fileName';
    }
    feed.photoPath = filePath;

    if (feed.forClass == 'Global') {
      standard = 'Global';
    } else
      standard = feed.forClass + feed.forDiv;

    var _postRef =
        (await schoolRefwithCode()).doc('Posts').collection(standard);

    await _postRef.add(feed.toJson());
    cprint('feed posted succeful ${feed.toJson()}',
        event: 'adding a feed in firestore');
    cprint(standard);
  }

  /// Add/Remove like on a feed
  /// [postId] is feed id, [userId] is user's id who like/unlike feed
  addLikeToTweet({Announcement feed, String firebaseUserId}) async {
    String standard;
    try {
      if (feed.likeList != null &&
          feed.likeList.length > 0 &&
          feed.likeList.any((userId) => userId == firebaseUserId)) {
        // If user wants to undo/remove his like on feed
        feed.likeList.removeWhere((id) => id == firebaseUserId);
        feed.likeCount -= 1;
      } else {
        // If user like feed
        if (feed.likeList == null) {
          feed.likeList = [];
        }
        feed.likeList.add(firebaseUserId);
        feed.likeCount += 1;
      }

      if (feed.forClass == 'Global') {
        standard = 'Global';
      } else
        standard = feed.forClass + feed.forDiv;

      var _postRefs =
          (await schoolRefwithCode()).doc('Posts').collection(standard);
      // update likelist of a feed
      _postRefs
          .doc(feed.id)
          .update({"likeCount": feed.likeCount, "likeList": feed.likeList});
    } catch (error) {
      cprint(error, errorIn: 'addLikeToTweet');
    }
  }
}
