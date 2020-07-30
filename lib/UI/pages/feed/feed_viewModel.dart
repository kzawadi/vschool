import 'package:ourESchool/core/services/feed_services/feed_services.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';

class FeedViewModel extends BaseViewModel {
  final FeedServices _feedServices = locator<FeedServices>();

  List<Announcement> _feeds;
  List<Announcement> get feed => _feeds;

  void listenToPosts({String stdDivGlobal}) {
    setBusy(true);
    // final subscription = _feedServices.listenToPostsRealTime().connect();
    final source =
        _feedServices.listenToPostsRealTime(stdDivGlobal: stdDivGlobal).listen(
      (postsData) {
        List<Announcement> updatedPosts = postsData;
        if (updatedPosts != null && updatedPosts.length > 0) {
          _feeds = updatedPosts;
          notifyListeners();
        }
        String f = updatedPosts.last.caption.toString();
        // print('the feed fetched is $f');
        setBusy(false);
      },
    );
    // final subscription = source.cancel();
  }

  void requestMoreData({String stdDivGlobal}) {
    _feedServices.requestMoreData(stdDivGlobal: stdDivGlobal);
  }

  // void listenToPostss({String stdDivGlobal}) {
  //   setBusy(true);
  //   _feedServices.allPagedResults.clear();
  //   _feedServices.lastDocument = null;
  //   _feedServices.listenToPostsRealTime(stdDivGlobal: stdDivGlobal).listen(
  //     (postsDatas) {
  //       List<Announcement> updatedPosts = postsDatas;
  //       if (updatedPosts != null && updatedPosts.length > 0) {
  //         _feeds = updatedPosts;
  //         notifyListeners();
  //       }
  //       String f = updatedPosts.last.caption.toString();
  //       print('the feed fetched is $f');

  //       setBusy(false);
  //     },
  //   );
  // }

  void clear({String std}) {
    setBusy(true);
    // _feedServices.listenToPostsRealTime();
    // _feedServices.listenToPosts();
    // final source = _feedServices.listenToPostsRealTime();
    // final subscription = source.listen((_) {})?.cancel();
    // _feedServices.postsController?.drain();
    _feedServices.allPagedResults.clear();
    // _feedServices.feed.clear();
    _feedServices.lastDocument = null;
    _feedServices.requestMoreData(stdDivGlobal: std);
    notifyListeners();
    setBusy(false);
  }
}
