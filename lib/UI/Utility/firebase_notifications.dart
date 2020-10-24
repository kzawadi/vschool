import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/helpers/shared_preferences_helper.dart';

import '../../locator.dart';

// class FirebaseNotifications with Services {
SharedPreferencesHelper _sharedPreferencesHelper =
    locator<SharedPreferencesHelper>();
StreamSubscription iosSubscription;
final FirebaseMessaging _cloudmesaging = FirebaseMessaging();
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final _localNotifications = new FlutterLocalNotificationsPlugin();

void _saveDeviceToken() async {
  String fcmToken = await _cloudmesaging.getToken();
  String id = await _sharedPreferencesHelper.getLoggedInUserId();

  // cprint('curent user id is $firebaseUser'.toString());

  // Save it to Firestore
  if (fcmToken != null) {
    DocumentReference tokens = _firestore
        .collection('users')
        .doc(id)
        .collection('tokens')
        .doc(fcmToken);

    await tokens.set({
      'token': fcmToken,
      'createdAt': FieldValue.serverTimestamp(), // optional
      'platform': Platform.operatingSystem // optional
    });
  }
  cprint('the token is $fcmToken'.toString());
}

void configLocalNotification() {
  var settingsAndroid = new AndroidInitializationSettings('app_icon');
  var settingsIOS = new IOSInitializationSettings();

  var initializationSettings =
      new InitializationSettings(android: settingsAndroid, iOS: settingsIOS);
  _localNotifications.initialize(initializationSettings,
      onSelectNotification: onSelect);
}

Future<String> onSelect(String data) async {
  cprint("onSelectNotification $data");
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
    // sound: ,
    enableVibration: true,
    importance: Importance.max,
    priority: Priority.high,
  );
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  cprint(message);
//    cprint(message['body'].toString());
//    cprint(json.encode(message));

  await _localNotifications.show(0, message['title'].toString(),
      message['body'].toString(), platformChannelSpecifics,
      payload: json.encode(message));

//    await flutterLocalNotificationsPlugin.show(
//        0, 'plain title', 'plain body', platformChannelSpecifics,
//        payload: 'item x');
}

void firebaseNotificationServices() {
  if (Platform.isIOS) {
    iosSubscription = _cloudmesaging.onIosSettingsRegistered.listen((data) {
      cprint(data);
      _saveDeviceToken();
    });

    _cloudmesaging.requestNotificationPermissions(IosNotificationSettings(
        sound: true, badge: true, alert: true, provisional: true));
  } else {
    _saveDeviceToken();
  }

  _cloudmesaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      cprint('onMessage: $message');
      Platform.isAndroid
          ? showNotification(message['notification'])
          : showNotification(message['aps']['alert']);
      return;
    },
    onResume: (Map<String, dynamic> message) async {
      cprint("onResume: $message");
      // TODO optional
    },
    onBackgroundMessage: myBackgroundMessageHandler,
    onLaunch: (Map<String, dynamic> message) async {
      // this will never called, but it's ok
      cprint("onLaunch: $message");
    },
  );
}

var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  cprint("myBackgroundMessageHandler message: $message");
  int msgId = int.tryParse(message["data"]["msgId"].toString()) ?? 0;
  cprint("msgId $msgId");
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    '01',
    'vschool',
    'for when an sms is receieved',
    color: Colors.orangeAccent[100],
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    enableVibration: true,
    playSound: true,
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  flutterLocalNotificationsPlugin.show(msgId, message["data"]["msgTitle"],
      message["data"]["msgBody"], platformChannelSpecifics,
      payload: message["data"]["data"]);
  return Future<void>.value();
}
