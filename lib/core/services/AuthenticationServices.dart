import 'package:firebase_auth/firebase_auth.dart' as authentication;
import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/services/analytics_service.dart';
import 'package:ourESchool/imports.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationServices extends Services {
  // Future handleGoogleSignIn() async {
  //   try {
  //     AuthCredential credential;
  //     final GoogleSignInAccount googleUser = await _googleSignIn.signIn().catchError((e) {
  //       throw e;
  //     });
  //     await googleUser.authentication.then((onValue) async {
  //       credential = GoogleAuthProvider.getCredential(
  //         accessToken: onValue.accessToken,
  //         idToken: onValue.idToken,
  //       );
  //       _firebaseUser = await _auth.signInWithCredential(credential);
  //     });
  //     print("signed in " + _firebaseUser.displayName);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  bool isUserLoggedIn = false;
  UserType userType = UserType.STUDENT;

  StreamController<authentication.User> fireBaseUserStream =
      StreamController<authentication.User>();
  StreamController<bool> isUserLoggedInStream = StreamController<bool>();
  StreamController<UserType> userTypeStream = StreamController<UserType>();

  ProfileServices _profileServices = locator<ProfileServices>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  AuthenticationServices() {
    isLoggedIn().then((onValue) => isUserLoggedIn = onValue);
    _userType().then((onValue) => userType = onValue);
  }

  Future<bool> isLoggedIn() async {
    await getFirebaseUser();
    fireBaseUserStream.add(firebaseUser);
    String name = firebaseUser != null ? firebaseUser.email.toString() : 'Null';
    print('User Email :' + name);
    // if (firebaseUser == null) {
    //   await logoutMethod();
    // }
    isUserLoggedIn = firebaseUser == null ? false : true;
    isUserLoggedInStream.add(isUserLoggedIn);
    if (isUserLoggedIn) _profileServices.getLoggedInUserProfileData();
    print(isUserLoggedIn.toString() + 'here');
    return isUserLoggedIn;
  }

  Future<UserType> _userType() async {
    userType = await sharedPreferencesHelper.getUserType();
    userTypeStream.add(userType);
    return userType;
  }

  Future checkDetails({
    @required String schoolCode,
    @required String email,
    @required String password,
    @required UserType userType,
  }) async {
    await sharedPreferencesHelper.clearAllData();
    //Check if the School code is present and return "School not Present" if not
    //Then check if the user credentials are in the database or not
    //if not then return "Student Not Found" else return "Logging in"

    //Api Call to check details
    bool isSchoolPresent = false;
    bool isUserAvailable = false;
    String loginType = userType == UserType.STUDENT
        ? "Student"
        : userType == UserType.TEACHER
            ? "Parent-Teacher"
            : "Parent-Teacher";

    DocumentReference _schoolLoginRef =
        schoolRef.collection(schoolCode.toUpperCase().trim()).doc('Login');

    await _schoolLoginRef.get().then((onValue) {
      isSchoolPresent = onValue.exists;
      print("Inside Then :" + onValue.data.toString());
    });

    if (!isSchoolPresent) {
      print('School Not Found');
      return ReturnType.SCHOOLCODEERROR;
    } else {
      print('School Found');
    }

    CollectionReference _userRef = _schoolLoginRef.collection(loginType);

    await _userRef
        .where("email", isEqualTo: email)
        .snapshots()
        .first
        .then((querySnapshot) {
      //todo here only the first is expected but why forEach
      querySnapshot.docs.forEach((documentSnapshot) {
        isUserAvailable = documentSnapshot.exists;
        print("User Data : " + documentSnapshot.data.toString());
        if (userType == UserType.STUDENT) {
          userDataLogin = UserDataLogin(
            email: documentSnapshot.data()["email"].toString(),
            id: documentSnapshot.data()["id"].toString(),
            parentIds:
                documentSnapshot.data()['parentId'] as Map<dynamic, dynamic> ??
                    null,
          );
          // DocumentReference ref = documentSnapshot["ref"] as DocumentReference;
          // print('Insude Document Reference');
          // ref.get().then(
          //       (onValue) => print(
          //         'Dataaa : ' + onValue.data.toString(),
          //       ),
          //     );
        } else {
          userDataLogin = UserDataLogin(
            email: documentSnapshot.data()["email"].toString(),
            id: documentSnapshot.data()["id"].toString(),
            isATeacher: documentSnapshot.data()["isATeacher"] as bool,
            childIds:
                documentSnapshot.data()["childId"] as Map<dynamic, dynamic> ??
                    null,
          );
        }
      });
    });

    if (!isUserAvailable) {
      print('User Not Found');
      return ReturnType.EMAILERROR;
    } else {
      print('User Found');
      userDataLogin.setData();
    }

    sharedPreferencesHelper.setLoggedInUserId(userDataLogin.id);

    if (userType == UserType.STUDENT) {
      this.userType = userType;
      userTypeStream.add(userType);
      sharedPreferencesHelper.setUserType(UserType.STUDENT);
    } else {
      if (userDataLogin.isATeacher) {
        this.userType = UserType.TEACHER;
        userTypeStream.add(this.userType);
        sharedPreferencesHelper.setUserType(this.userType);
      } else {
        this.userType = UserType.PARENT;
        userTypeStream.add(this.userType);
        sharedPreferencesHelper.setUserType(this.userType);
      }
    }

    print("Childs :" + userDataLogin.childIds.toString());
    print("Email :" + userDataLogin.email);
    print("Id :" + userDataLogin.id);
    print("isATeacher :" + userDataLogin.isATeacher.toString());

    return ReturnType.SUCCESS;
  }

  ///this is a function to serve fcm token in firestore
  void _saveDeviceToken() async {
    String fcmToken = await cloudmesaging.getToken();
    String id = await sharedPreferencesHelper.getLoggedInUserId();

    // cprint('curent user id is $firebaseUser'.toString());

    // Save it to Firestore
    if (fcmToken != null) {
      DocumentReference tokens = firestore
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

  Future emailPasswordRegister(String email, String password, UserType userType,
      String schoolCode) async {
    // await sharedPreferencesHelper.clearAllData();
    try {
      AuthErrors authErrors = AuthErrors.UNKNOWN;
      authentication.UserCredential authResult = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser = authResult.user;
      await firestore.collection('users').doc(firebaseUser.uid).set({
        "uid": firebaseUser.uid,
        "email": firebaseUser.email,
        "username": firebaseUser.displayName,
        // "roles": {"admin": true, "editor": true},
        "active": true
      });
      authErrors = AuthErrors.SUCCESS;
      sharedPreferencesHelper.setSchoolCode(schoolCode);
      // analytics.setUserId(firebaseUser.uid);
      // analytics.logSignUp(signUpMethod: firebaseUser.providerId);

      print("User Regestered using Email and Password");
      print('user collection created with $firebaseUser'.toString());
      // sharedPreferencesHelper.setUserType(userType);
      isUserLoggedIn = true;
      isUserLoggedInStream.add(isUserLoggedIn);
      fireBaseUserStream.add(firebaseUser);
      _saveDeviceToken();
      await _analyticsService.logSignUp();
      return authErrors;
    } catch (e) {
      return catchException(e);
    }
  }

  Future<AuthErrors> signInWithGoogle(
      {UserType userType, String schoolCode}) async {
    try {
      AuthErrors authErrors = AuthErrors.UNKNOWN;
      authentication.UserCredential userCredential;

      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final authentication.GoogleAuthCredential googleAuthCredential =
          authentication.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await auth.signInWithCredential(googleAuthCredential);

      firebaseUser = userCredential.user;
      authErrors = AuthErrors.SUCCESS;
      sharedPreferencesHelper.setSchoolCode(schoolCode);
      print("User Loggedin using Goolge Acoount");

      isUserLoggedIn = true;
      fireBaseUserStream.sink.add(firebaseUser);
      isUserLoggedInStream.add(isUserLoggedIn);
      _saveDeviceToken();
      await _analyticsService.setUserProperties(
          userId: userCredential.user.uid);
      return authErrors;
    } catch (e) {
      return catchException(e);
    }
  }

  Future<AuthErrors> emailPasswordSignIn(String email, String password,
      UserType userType, String schoolCode) async {
    // await sharedPreferencesHelper.clearAllData();
    try {
      AuthErrors authErrors = AuthErrors.UNKNOWN;
      authentication.UserCredential authResult = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      firebaseUser = authResult.user;
      authErrors = AuthErrors.SUCCESS;
      sharedPreferencesHelper.setSchoolCode(schoolCode);
      print("User Loggedin using Email and Password");
      //  sharedPreferencesHelper.setUserType(userType);
      isUserLoggedIn = true;
      fireBaseUserStream.sink.add(firebaseUser);
      isUserLoggedInStream.add(isUserLoggedIn);
      _saveDeviceToken();
      await _analyticsService.setUserProperties(
        userId: authResult.user.uid,
      );

      return authErrors;
    } catch (e) {
      return catchException(e);
    }
  }

  // Future<User> fetchUserData() async {
  //   FirebaseUser user = await auth.currentUser();
  //   if (user == null) {
  //     print("No User LogedIn");
  //     return null;
  //   }
  //   User userr = User(
  //     displayName: user.displayName,
  //     mobileNo: user.phoneNumber,
  //     email: user.email,
  //     firebaseUuid: user.uid,
  //     isVerified: user.isEmailVerified,
  //     photoUrl: user.photoUrl,
  //   );
  //   print(userr.toString());
  //   return userr;
  // }

  logoutMethod() async {
    await auth.signOut();
    isUserLoggedIn = false;
    isUserLoggedInStream.add(false);
    fireBaseUserStream.add(null);
    userTypeStream.add(UserType.UNKNOWN);
    await sharedPreferencesHelper.clearAllData();
    print("User Loged out");
  }

  Future<AuthErrors> passwordReset(String email) async {
    try {
      AuthErrors authErrors = AuthErrors.UNKNOWN;
      await auth.sendPasswordResetEmail(email: email);
      authErrors = AuthErrors.SUCCESS;
      print("Password Reset Link Send");
      return authErrors;
    } catch (e) {
      return catchException(e);
    }
  }

  AuthErrors catchException(Exception e) {
    AuthErrors errorType = AuthErrors.UNKNOWN;
    if (e is PlatformException) {
      if (Platform.isIOS) {
        switch (e.message) {
          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
            errorType = AuthErrors.UserNotFound;
            break;
          case 'The password is invalid or the user does not have a password.':
            errorType = AuthErrors.PasswordNotValid;
            break;
          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
            errorType = AuthErrors.NetworkError;
            break;
          case 'Too many unsuccessful login attempts.  Please include reCaptcha verification or try again later':
            errorType = AuthErrors.TOOMANYATTEMPTS;
            break;
          // ...
          default:
            print('Case iOS ${e.message} is not yet implemented');
        }
      } else if (Platform.isAndroid) {
        switch (e.code) {
          case 'Error 17011':
            errorType = AuthErrors.UserNotFound;
            break;
          case 'Error 17009':
          case 'ERROR_WRONG_PASSWORD':
            errorType = AuthErrors.PasswordNotValid;
            break;
          case 'Error 17020':
            errorType = AuthErrors.NetworkError;
            break;
          // ...
          default:
            print('Case Android ${e.message} ${e.code} is not yet implemented');
        }
      }
    }

    print('The error is $errorType');
    return errorType;
  }
}
