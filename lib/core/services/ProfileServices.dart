import 'package:http/http.dart' as http;
import 'package:ourESchool/core/Models/studentData/studentData.dart';
import 'package:ourESchool/imports.dart';

class ProfileServices extends Services {
  StorageServices storageServices = locator<StorageServices>();
  StreamController<User> loggedInUserStream =
      StreamController.broadcast(sync: true);

  String country = Services.country;

  List<User> childrens = [];
  List<String> childrensId = [];

  ProfileServices() {
    getSchoolCode();
    getFirebaseUser();
  }

  /// this function sets the Profile Data of the User using a restful api in
  setProfileDataforChild({
    User user,
  }) async {
    UserType userType = UserType.STUDENT;

    if (user.photoUrl.contains('https')) {
      // photoUrl = url;
    } else if (user.photoUrl == 'default') {
      // user.photoUrl = user.photoUrl;
    } else {
      user.photoUrl = await storageServices.setProfilePhoto(user.photoUrl);
    }

    // user.photoUrl = photoUrl;

    Map profileDataHashMap = user.toJson();

    var body = json.encode({
      "schoolCode": schoolCode.trim().toUpperCase(),
      "profileData": profileDataHashMap,
      "userType": UserTypeHelper.getValue(userType),
      "country": country
    });

    final response = await http.post(
      profileUpdateUrl,
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("Data Uploaded Succesfully");
    } else {
      print("Data Upload error");
    }
  }

  //this function is similar to the above```setProfileData
  setProfileDataParent({
    User user,
  }) async {
    UserType userType = UserType.PARENT;

    if (user.photoUrl.contains('https')) {
      // photoUrl = url;
    } else if (user.photoUrl == 'default') {
      // user.photoUrl = user.photoUrl;
    } else {
      user.photoUrl = await storageServices.setProfilePhoto(user.photoUrl);
    }

    // user.photoUrl = photoUrl;

    Map profileDataHashMap = user.toJson();

    var body = json.encode({
      "schoolCode": schoolCode.trim().toUpperCase(),
      "profileData": profileDataHashMap,
      "userType": UserTypeHelper.getValue(userType),
      "country": country
    });
    print('data of child to be updated is $profileDataHashMap');
    final response = await http.post(
      profileUpdateUrl,
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("Data Uploaded Succesfully");
      final jsonData = await json.decode(response.body);

      User user = User.fromJson(jsonData);
      sharedPreferencesHelper.setUserDataModel(response.body);
      loggedInUserStream.add(user);
    } else {
      print("Data Upload error");
    }
  }

  setProfileDataTeacher({
    User user,
  }) async {
    UserType userType = UserType.TEACHER;

    if (user.photoUrl.contains('https')) {
      // photoUrl = url;
    } else if (user.photoUrl == 'default') {
      // user.photoUrl = user.photoUrl;
    } else {
      user.photoUrl = await storageServices.setProfilePhoto(user.photoUrl);
    }

    // user.photoUrl = photoUrl;

    Map profileDataHashMap = user.toJson();

    var body = json.encode({
      "schoolCode": schoolCode.trim().toUpperCase(),
      "profileData": profileDataHashMap,
      "userType": UserTypeHelper.getValue(userType),
      "country": country
    });
    print('data of Teacher to be updated is $profileDataHashMap');
    final response = await http.post(
      profileUpdateUrl,
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("Data Uploaded Succesfully");
      final jsonData = await json.decode(response.body);

      User user = User.fromJson(jsonData);
      sharedPreferencesHelper.setUserDataModel(response.body);
      loggedInUserStream.add(user);
    } else {
      print("Data Upload error");
    }
  }

  /// this funtion return a future of loged in user profiles Data
  /// it will retrive from shared preferences(LOCALY)
  /// and then it put the data to a stream (loggedInUserStream)

  Future<User> getLoggedInUserProfileData() async {
    // if (schoolCode == null)
    await getSchoolCode();
    String id = await sharedPreferencesHelper.getLoggedInUserId();
    UserType userType = await sharedPreferencesHelper.getUserType();

    String userDataModel = await sharedPreferencesHelper.getUserDataModel();

    if (userDataModel != 'N.A') {
      print("Data Retrived Succesfully (Local)");
      final jsonData = await json.decode(userDataModel);

      User user = User.fromJson(jsonData);
      loggedInUserStream.add(user);
      user.toString();
      return user;
    }

    var body = json.encode({
      "schoolCode": schoolCode.trim().toUpperCase(),
      "id": id,
      "userType": UserTypeHelper.getValue(userType),
      "country": country
    });

    print(body);

    final response = await http.post(
      getProfileDataUrl,
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("Data Retrived Succesfully");
      final jsonData = await json.decode(response.body);

      User user = User.fromJson(jsonData);
      sharedPreferencesHelper.setUserDataModel(response.body);
      loggedInUserStream.add(user);
      user.toString();
      return user;
    } else {
      print("Data Retrived failed");
      return User(id: id);
    }
  }

  //Fetch Profile Data Using Firestore SDK
  Future<User> getProfileDataById(String uid, UserType userType) async {
    DocumentReference profielRef = await _getProfileRef(uid, userType);

    try {
      User user = User.fromSnapshot(
          await profielRef.get(source: Source.serverAndCache));
      return user;
    } catch (e) {
      print(e);
      return User(id: uid);
    }
  }

  Future<User> getUserDataFromReference(DocumentReference reference) async {
    User user = User.fromSnapshot(await reference.get());
    return user;
  }

  /// this get a list of associated childrens and there Data by another inside method call
  getChildrens() async {
    String childrens = await sharedPreferencesHelper.getChildIds();
    if (childrens == 'N.A') {
      this.childrens = [];
      return;
    }
    Map<String, String> childIds = Map.from(
      jsonDecode(childrens).map(
        (key, values) {
          String value = values.toString();
          return MapEntry(key, value);
        },
      ),
    );
    await _getChildrensData(childIds);
    print('the child Ids are in this format $childIds');
  }

  getChildUserName() async {
    String _childrens = await sharedPreferencesHelper.getChildIds();
    if (_childrens == 'N.A') {
      this.childrensId = [];
      return;
    }

    Map<String, String> childIds = Map.from(
      jsonDecode(_childrens).map(
        (key, values) {
          String value = values.toString();
          return MapEntry(key, value);
        },
      ),
    );
    childrensId = childIds.values.toList();
    print('the childe usernames which are ID  $childrensId');
  }

  _getChildrensData(Map<String, String> childIds) async {
    List<User> childData = [];
    for (String id in childIds.values) {
      childData.add(await getProfileDataById(id, UserType.STUDENT));
    }
    print('childId value is $childData');
    childrens = childData;
  }

  Future<DocumentReference> _getProfileRef(
      String uid, UserType userType) async {
    await getSchoolCode();
    DocumentReference ref = (await schoolRefwithCode()).document('Profile');
    switch (userType) {
      case UserType.STUDENT:
        return ref.collection('Student').document(uid);
        break;
      case UserType.TEACHER:
      case UserType.PARENT:
        return ref.collection('Parent-Teacher').document(uid);
        break;
      case UserType.UNKNOWN:
        return null;
        break;
      default:
        return null;
    }
  }

  //Fetch Profile Data Using HTTP Request
  Future<User> getProfileDataByIdd(String uid, UserType userType) async {
    await getSchoolCode();
    var body = json.encode({
      "schoolCode": schoolCode.trim().toUpperCase(),
      "id": uid,
      "userType": UserTypeHelper.getValue(userType),
      "country": country
    });

    print(body);

    final response = await http.post(
      getProfileDataUrl,
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("Data Retrived Succesfully");
      final jsonData = await json.decode(response.body);

      User user = User.fromJson(jsonData);
      user.toString();
      return user;
    } else {
      print("Data Retrived failed");
      return User(id: uid);
    }
  }

  getChildParentId({String childId}) async {
    DocumentReference docref = (await schoolRefwithCode())
        .document('Login')
        .collection('Student')
        .document(childId);
//todo chang the firestore backend to use child id as Document
    await docref.get().then(
      (value) {
        studentData = StudentData(
          email: value["email"].toString(),
          id: value['id'].toString(),
          parentIds: value["parentId"] as Map<dynamic, dynamic> ?? null,
        );
      },
    );
    studentData.setData();
    print('The Parents of The Student have Been saved to the shared pref');
  }
}
