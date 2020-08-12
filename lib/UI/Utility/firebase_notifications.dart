import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ourESchool/core/helpers/shared_preferences_helper.dart';
import 'package:ourESchool/core/services/Services.dart';

import '../../locator.dart';

class FirebaseNotifications with Services {
  SharedPreferencesHelper _sharedPreferencesHelper =
      locator<SharedPreferencesHelper>();
  StreamSubscription iosSubscription;

  void _saveDeviceToken() async {
    String fcmToken = await cloudmesaging.getToken();
    String id = await _sharedPreferencesHelper.getLoggedInUserId();

    print('curent user id is $firebaseUser'.toString());

    // Save it to Firestore
    if (fcmToken != null) {
      DocumentReference tokens = firestore
          .collection('users')
          .document(id)
          .collection('tokens')
          .document(fcmToken);

      await tokens.setData({
        'token': fcmToken,
        'createdAt': FieldValue.serverTimestamp(), // optional
        'platform': Platform.operatingSystem // optional
      });
    }
    print('the token is $fcmToken'.toString());
  }

  void configLocalNotification() {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    localNotifications.initialize(initializationSettings);
  }

  void showNotification(message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      Platform.isAndroid
          ? 'com.mappdeveloper.usa.our_e_school'
          // todo be replaced by ios project id
          : 'com.mappdeveloper.usa.our_e_school',
      'e school chat demo',
      'General notifications channel descriptions',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    print(message);
//    print(message['body'].toString());
//    print(json.encode(message));

    await localNotifications.show(0, message['title'].toString(),
        message['body'].toString(), platformChannelSpecifics,
        payload: json.encode(message));

//    await flutterLocalNotificationsPlugin.show(
//        0, 'plain title', 'plain body', platformChannelSpecifics,
//        payload: 'item x');
  }

  void firebaseNotificationServices() {
    if (Platform.isIOS) {
      iosSubscription = cloudmesaging.onIosSettingsRegistered.listen((data) {
        print(data);
        _saveDeviceToken();
      });

      cloudmesaging.requestNotificationPermissions(IosNotificationSettings(
          sound: true, badge: true, alert: true, provisional: true));
    } else {
      _saveDeviceToken();
    }

    cloudmesaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        // print("onMessage: $message");
        // _scaffoldKey.currentState.showSnackBar(
        //   ksnackBar(context, message['notification']['title']),
        // );

        // print('RECIEVED NOTIFICATION IS $message'.toString());
        print('onMessage: $message');
        Platform.isAndroid
            ? showNotification(message['notification'])
            : showNotification(message['aps']['alert']);
        return;
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );
  }
}
