import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' as authentication;
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/Models/UserDataLogin.dart';
import 'package:ourESchool/core/Models/studentData/studentData.dart';
import 'package:ourESchool/core/Server.dart';
import 'package:ourESchool/core/helpers/shared_preferences_helper.dart';
import 'package:ourESchool/locator.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Services {
  final SharedPreferencesHelper _sharedPreferencesHelper =
      locator<SharedPreferencesHelper>();
  static final String country =
      "India"; //Get this from firstScreen(UI Not developed yet)
  //todo REMEMBER TO CHANGE THIS TO TANZANIA WHEN READY FOR PRODUCTION
  static final authentication.FirebaseAuth _auth =
      authentication.FirebaseAuth.instance;

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseMessaging _fcm = FirebaseMessaging();
  static final FirebaseAnalytics _analytics = FirebaseAnalytics();
  static final FirebaseInAppMessaging _fiam = FirebaseInAppMessaging();
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  authentication.User firebaseUser;

  User _user;

  UserDataLogin userDataLogin;
  StudentData studentData;

  String schoolCode = null;

  final StorageReference _storageReference =
      FirebaseStorage.instance.ref().child(country);

  final Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  final String baseUrl = Server.baseUrl;

  final String webApiUrl = Server.baseUrl + Server.webApi;

  final String profileUpdateUrl =
      Server.baseUrl + Server.webApi + Server.profileUpdate;

  final String getProfileDataUrl =
      Server.baseUrl + Server.webApi + Server.getProfileData;

  final String postAnnouncemnetUrl =
      Server.baseUrl + Server.webApi + Server.postAnnouncement;

  final String addAssignmentUrl =
      Server.baseUrl + Server.webApi + Server.addAssignment;

  final DocumentReference _schoolRef =
      _firestore.collection('Schools').doc(country);

  final DocumentReference _wallRef =
      _firestore.collection('walls').doc('websites');

  FirebaseFirestore get firestore => _firestore;
  authentication.FirebaseAuth get auth => _auth;
  User get loggedInUser => _user;
  FirebaseMessaging get cloudmesaging => _fcm;
  FlutterLocalNotificationsPlugin get localNotifications =>
      flutterLocalNotificationsPlugin;
  FirebaseAnalytics get analytics => _analytics;
  FirebaseInAppMessaging get fiam => _fiam;

  DocumentReference get schoolRef => _schoolRef;

  Future<CollectionReference> schoolRefwithCode() async =>
      _schoolRef.collection((await getSchoolCode()).toUpperCase().trim());

  DocumentReference get wallRef => _wallRef;
  // Future<DocumentReference> wallRef() async =>
  //     _wallRef.collection('wall'
  //         .toUpperCase()
  //         .trim(),);

  StorageReference get storageReference => _storageReference;

  SharedPreferencesHelper get sharedPreferencesHelper =>
      _sharedPreferencesHelper;

  getFirebaseUser() {
    firebaseUser = auth.currentUser;
  }

  Future<String> getSchoolCode() async {
    schoolCode = await _sharedPreferencesHelper.getSchoolCode();
    return schoolCode;
  }
}
