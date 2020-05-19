import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ourESchool/core/Models/User.dart';
import 'package:ourESchool/core/Models/UserDataLogin.dart';
import 'package:ourESchool/core/Server.dart';
import 'package:ourESchool/core/helpers/shared_preferences_helper.dart';
import 'package:ourESchool/locator.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Services {
  SharedPreferencesHelper _sharedPreferencesHelper =
      locator<SharedPreferencesHelper>();
  static String country =
      "India"; //Get this from firstScreen(UI Not developed yet)
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static final Firestore _firestore = Firestore.instance;
  static final FirebaseMessaging _fcm = FirebaseMessaging();
  static final FirebaseAnalytics _analytics = FirebaseAnalytics();
  static final FirebaseInAppMessaging _fiam = FirebaseInAppMessaging();

  FirebaseUser firebaseUser;

  User _user;

  UserDataLogin userDataLogin;

  String schoolCode = null;

  final StorageReference _storageReference =
      FirebaseStorage.instance.ref().child(country);

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  String baseUrl = Server.baseUrl;

  String webApiUrl = Server.baseUrl + Server.webApi;

  String profileUpdateUrl =
      Server.baseUrl + Server.webApi + Server.profileUpdate;

  String getProfileDataUrl =
      Server.baseUrl + Server.webApi + Server.getProfileData;

  String postAnnouncemnetUrl =
      Server.baseUrl + Server.webApi + Server.postAnnouncement;

  String addAssignmentUrl =
      Server.baseUrl + Server.webApi + Server.addAssignment;

  DocumentReference _schoolRef =
      _firestore.collection('Schools').document(country);

  DocumentReference _wallRef =
      _firestore.collection('walls').document('websites');

  Firestore get firestore => _firestore;
  FirebaseAuth get auth => _auth;
  User get loggedInUser => _user;
  FirebaseMessaging get cloudmesaging => _fcm;
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

  getFirebaseUser() async {
    firebaseUser = await _auth.currentUser();
  }

  Future<String> getSchoolCode() async {
    schoolCode = await _sharedPreferencesHelper.getSchoolCode();
    return schoolCode;
  }
}
