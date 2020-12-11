import 'package:ourESchool/core/enums/bottom_sheet_type.dart';
import 'package:ourESchool/core/enums/dialog_type.dart';
import 'package:ourESchool/core/services/analytics_service.dart';
import 'package:ourESchool/core/services/feed_services/feed_services.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ourESchool/UI/resources/utility.dart';

class FeedViewModel extends StreamViewModel {
  final FeedServices _feedServices = locator<FeedServices>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _diologService = locator<DialogService>();

  String get counter => _feedServices.counter;

  // final String stdDivGlobal;

  // FeedViewModel({this.stdDivGlobal});
  void changeFeedType({String cls}) {
    _feedServices.changeFeedType(type: cls);
  }

  void requestMoreData() {
    _feedServices.requestMoreData(stdDivGlobal: counter);
  }

  /// this will clear the feed and pass a parameter of a specific class standard
  /// for filtering the class fee only and when complited the dialog will have a default
  /// [Gloabl] which is the default feed collection parameter
  void filteredFeed({String std}) {
    setBusy(true);
    changeFeedType(cls: std);
    _feedServices.filteredFeed();
    setBusy(false);
  }

  /// this takes in an id and standard for reference in firestore so to delete a
  /// specific feed identified by its Id
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
      _feedServices.listenToPostsRealTime(stdDivGlobal: counter);

  Future showCustomBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.floating,
      title: 'This is a floating sheet',
      description: "paymentDesc",
      mainButtonTitle: 'Awesome!',
      secondaryButtonTitle: 'This is cool',
    );

    // Remember the null check, if you don't and the user dismisses the dialog without selecting an option
    // it will be null.
    print('response: ${response?.confirmed}');
  }

  Future showCustomDialog() async {
    await _diologService
        .showCustomDialog(
      variant: DialogType.Form,
      // title: 'This is a floating sheet',
      customData: DialogType.Form,
      // mainButtonTitle: 'Submit',
      barrierDismissible: true,
      // description: "paymentDesc",
      // mainButtonTitle: 'Awesome!',
      // secondaryButtonTitle: 'This is cool',
    )
        .then((value) {
      filteredFeed(std: value.responseData ?? "Global");
    }, onError: (e) => cprint("No value was found in feedDialog---" + e));

    // Remember the null check, if you don't and the user dismisses the dialog without selecting an option
    // it will be null.
    // print('response data: ${response?.responseData}');
  }
}
