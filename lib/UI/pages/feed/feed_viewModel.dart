import 'package:ourESchool/core/services/analytics_service.dart';
import 'package:ourESchool/core/services/feed_services/feed_services.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';

class FeedViewModel extends StreamViewModel {
  final FeedServices _feedServices = locator<FeedServices>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  final String stdDivGlobal;

  FeedViewModel({this.stdDivGlobal});

  void requestMoreData({String stdDivGlobal}) {
    _feedServices.requestMoreData(stdDivGlobal: stdDivGlobal);
  }

  /// this will clear the feed and pass a parameter of a specific class standard
  /// for filtering the class fee only and when complited the dialog will have a default
  /// [Gloabl] which is the default feed collection parameter
  void filteredFeed({String std}) {
    setBusy(true);
    _feedServices.filteredFeed(std: std);
    setBusy(false);
  }

  /// this takes in an id and standard for reference in firestore so to delete a
  /// specific fee identified by its Id
  Future deleteFeed(String id, String stdDivGlobal) async {
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

  void addLikeToTweet({Announcement feed, String firebaseUserId}) async {
    setBusy(true);
    await _feedServices.addLikeToTweet(
        feed: feed, firebaseUserId: firebaseUserId);
    setBusy(false);
  }

  @override
  Stream get stream =>
      _feedServices.listenToPostsRealTime(stdDivGlobal: stdDivGlobal);
}
