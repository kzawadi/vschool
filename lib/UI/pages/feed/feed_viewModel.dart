import 'package:ourESchool/core/services/analytics_service.dart';
import 'package:ourESchool/core/services/feed_services/feed_services.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class FeedViewModel extends BaseViewModel {
  final FeedServices _feedServices = locator<FeedServices>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

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

  /// this will clear the feed and pass a parameter of a specific class standard
  /// for filtering the class fee only and when complited the dialog will have a default
  /// [Gloabl] which is the default feed collection parameter
  void filteredFeed({String std}) {
    setBusy(true);
    _feedServices.filteredFeed(std: std);
    notifyListeners();
    setBusy(false);
  }

  /// this takes in an id and standard for reference in firestore so to delete a
  /// specific fee identified by its Id
  void deleteFeed(String id, String stdDivGlobal) async {
    setBusy(true);
    await _feedServices.deletefeed(id, stdDivGlobal);
    notifyListeners();
    setBusy(false);
  }

  Future postFeed({Announcement feed}) async {
    setBusy(true);
    await _feedServices.postFeed(feed: feed);
    await _analyticsService.logPostCreated(hasImage: feed.photoPath != null);
    setBusy(false);
  }
}
