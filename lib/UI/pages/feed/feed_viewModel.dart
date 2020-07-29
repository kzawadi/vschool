import 'package:ourESchool/core/services/feed_services/feed_services.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class FeedViewModel extends BaseViewModel {
  final FeedServices _feedServices = locator<FeedServices>();

  List<Announcement> _feeds;
  List<Announcement> get feed => _feeds;

  void listenToPosts({String stdDivGlobal}) {
    setBusy(true);

    _feedServices
        .listenToPostsRealTime(stdDivGlobal: stdDivGlobal)
        .listen((postsData) {
      List<Announcement> updatedPosts = postsData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _feeds = updatedPosts;
        notifyListeners();
      }
      String f = updatedPosts.last.caption.toString();
      print('the feed fetched is $f');

      setBusy(false);
    });
  }

  void requestMoreData({String stdDivGlobal}) {
    _feedServices.requestMoreData(stdDivGlobal: stdDivGlobal);
  }

  void listenToPostss({String stdDivGlobal}) {
    setBusy(true);

    _feedServices.postsController.drain();
    _feedServices.allPagedResults.clear();
    _feedServices.lastDocument = null;
    _feedServices.listenToPostsRealTime(stdDivGlobal: stdDivGlobal).listen(
      (postsDatas) {
        List<Announcement> updatedPosts = postsDatas;
        if (updatedPosts != null && updatedPosts.length > 0) {
          _feeds = updatedPosts;
          notifyListeners();
        }
        String f = updatedPosts.last.caption.toString();
        print('the feed fetched is $f');

        setBusy(false);
      },
    );
  }

  // void clear({String std}) {
  //   // _feedServices.postsController.close();
  //   _feedServices.lastDocument = null;
  //   // _feeds.clear();
  //   // _feedServices.allPagedResults.clear();
  //   // _feedServices.allPosts.clear();
  //   Future.delayed(Duration(seconds: 1));
  //   listenToPosts(stdDivGlobal: std);
  //   notifyListeners();
  // }
}
