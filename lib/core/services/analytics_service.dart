import 'package:ourESchool/core/services/Services.dart';

import '../../imports.dart';

class AnalyticsService extends Services {
  // final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: analytics);

  Future setUserProperties({@required String userId, String userRole}) async {
    await analytics.setUserId(userId);
    await analytics.setUserProperty(name: 'user_role', value: userRole);
  }

  Future logLogin() async {
    await analytics.logLogin(loginMethod: 'email');
  }

  Future logSignUp() async {
    await analytics.logSignUp(signUpMethod: 'email');
  }

  Future logPostCreated({bool hasImage}) async {
    await analytics.logEvent(
      name: 'Announcemt_Created',
      parameters: {'has_image': hasImage},
    );
  }

  Future logWallCreated({bool hasImage}) async {
    await analytics.logEvent(
      name: 'Wall_Created',
      parameters: {'has_image': hasImage},
    );
  }

  Future logScreen({String screenName}) async {
    await analytics.setCurrentScreen(screenName: 'screenName');
  }
}
