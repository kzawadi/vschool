import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ourESchool/UI/resources/utility.dart';

StreamSubscription iosSubscription;
final FirebaseMessaging _cloudmesaging = FirebaseMessaging();
var _flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

void configLocalNotification() {
  var settingsAndroid = new AndroidInitializationSettings('app_icon');
  var settingsIOS = new IOSInitializationSettings();

  var initializationSettings =
      new InitializationSettings(android: settingsAndroid, iOS: settingsIOS);
  _flutterLocalNotificationsPlugin.initialize(initializationSettings,
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
    'FLUTTER_NOTIFICATION_CLICK',
    'General notifications channel descriptions',
    playSound: true,
    color: Colors.red,

    // sound: ,
    enableVibration: true,
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    ledOnMs: 1000,
    ledOffMs: 500,
    sound: RawResourceAndroidNotificationSound('vschool_sound'),
  );
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  cprint(message.toString());
//    cprint(message['body'].toString());
//    cprint(json.encode(message));

  await _flutterLocalNotificationsPlugin.show(0, message['title'].toString(),
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
      // _saveDeviceToken();
    });

    _cloudmesaging.requestNotificationPermissions(IosNotificationSettings(
        sound: true, badge: true, alert: true, provisional: true));
  } else {
    // _saveDeviceToken();
  }

  _cloudmesaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      cprint('onMessage: $message');
      Platform.isAndroid
          ? showNotification(message['notification'])
          : showNotification(message['aps']['alert']); //this is for Ios setup
      return;
    },
    onResume: (Map<String, dynamic> message) async {
      cprint("onResume: $message");
    },
    onBackgroundMessage: myBackgroundMessageHandler,
    onLaunch: (Map<String, dynamic> message) async {
      // this will never called, but it's ok
      cprint("onLaunch: $message");
    },
  );
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  cprint("myBackgroundMessageHandler message: $message");
  int msgId = int.tryParse(message["data"]["msgId"].toString()) ?? 0;
  cprint("msgId $msgId");
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    '01',
    'FLUTTER_NOTIFICATION_CLICK',
    'for when an sms is receieved',
    color: Colors.orangeAccent[100],
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    enableVibration: true,
    playSound: true,
    ledOnMs: 1000,
    ledOffMs: 500,
    sound: RawResourceAndroidNotificationSound('vschool_sound'),
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
    presentAlert: true,
    presentSound: true,
    sound: 'vschool_sound',
  );
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  _flutterLocalNotificationsPlugin.show(msgId, message["data"]["msgTitle"],
      message["data"]["msgBody"], platformChannelSpecifics,
      payload: message["data"]["data"]);
  return Future<void>.value();
}
