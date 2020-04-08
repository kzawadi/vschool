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
      name: 'create_post',
      parameters: {'has_image': hasImage},
    );
  }
}
