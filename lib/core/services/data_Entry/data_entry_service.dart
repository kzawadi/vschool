import 'dart:convert';
import 'dart:io';
import 'dart:core';

import 'package:file_picker/file_picker.dart';
import 'package:ourESchool/core/Models/data_entry/data_entry.dart';
import 'package:ourESchool/core/Models/data_entry/data_entry_db.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/imports.dart';

class DataEntryService extends Services {
  DataEntryService() {
    // getFirebaseUser();
    getSchoolCode();
  }

  Future<void> postData({List<UserEntryData> userEntryData}) async {
//Schools/India/MAMA/Login/Parent-Teacher/dZdZUa5GAlFtjblV3UVN
    SetOptions options = SetOptions(merge: true);

    for (UserEntryData u in userEntryData) {
      // String watoto = u.childIds;
      List toto = u.childIds.split(',');

      Map<int, String> watotomapped = toto.asMap();
      UserEntryDataDb x = UserEntryDataDb(
        email: u.email,
        id: u.id,
        isATeacher:
            false, //bool.fromEnvironment(u.isATeacher.trim().toLowerCase()),
        childId: watotomapped,
      );

      Map data = x.toJson();
      print(data);
      print(watotomapped);
      DocumentReference _postRefs = (await schoolRefwithCode())
          .doc('Login')
          .collection('Parent-Teacher')
          .doc(u.id);

      await _postRefs.set(data, options);
    }
  }

  File _jsonFile;
  var userData = <UserEntryData>[];
  // String _path;
  String jsonString;
  var _data = <UserEntryData>[];

  Future<String> _loadAStudentAsset() async {
    //todo pass in the file type
    await FilePicker.getFilePath().then(
      (value) async {
        _jsonFile = File(value);
        String datastring = await _jsonFile.readAsString();
        jsonString = datastring;
      },
    ).catchError(
      (error) {
        //showSomeAlert() or handleSomething()
        print(error);
      },
    );

    return jsonString;
  }

  Future<List<UserEntryData>> getData() async {
    clearData();
    String dataJson = await _loadAStudentAsset();
    _data = (json.decode(dataJson) as List)
        .map((i) => UserEntryData.fromJson(i))
        .toList();
    userData.addAll(_data);
    //  notifyListeners();
    print(userData);
    return userData;
    // notifyListeners();
    // return userData;
  }

  void clearData() {
    _data.clear();
    userData.clear();
  }
}
