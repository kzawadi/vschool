import 'package:ourESchool/core/services/feed_services/feed_services.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class FeedViewModel extends BaseViewModel {
  final FeedServices _feedServices = locator<FeedServices>();

  List<Announcement> _feeds;
  List<Announcement> get feed => _feeds;

  void listenToPosts({String stdDivGlobal}) {
    setBusy(true);
    _feedServices.listenToPostsRealTime(stdDivGlobal: stdDivGlobal).listen(
      (postsData) {
        List<Announcement> updatedPosts = postsData;
        if (updatedPosts != null && updatedPosts.length > 0) {
          _feeds = updatedPosts;
          notifyListeners();
        }
        setBusy(false);
      },
    );
  }

  void requestMoreData({String stdDivGlobal}) {
    _feedServices.requestMoreData(stdDivGlobal: stdDivGlobal);
  }

  void filteredFeed({String std}) {
    setBusy(true);
    _feedServices.filteredFeed(std: std);
    notifyListeners();
    setBusy(false);
  }
}
