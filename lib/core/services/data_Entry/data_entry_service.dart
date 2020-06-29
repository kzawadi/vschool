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
    CollectionReference _postRefs = (await schoolRefwithCode())
        .document('Login')
        .collection('Parent-Teacher');
    // .document('b0Rk7BjGDlilKn6ZZiod');

    for (UserEntryData u in userEntryData) {
      String watoto = u.childIds;
      List toto = watoto.split(',');

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

      await _postRefs.add(data);
    }
  }

  File _jsonFile;
  List<UserEntryData> userData = List<UserEntryData>();
  String _path;
  String jsonString;
  List<UserEntryData> _data = [];

  Future<String> _loadAStudentAsset() async {
    _path = await FilePicker.getFilePath().then(
      (value) async {
        _jsonFile = File(value);
        String datastring = await _jsonFile.readAsString();
        jsonString = datastring;
      },
    ).catchError((error) {
      //showSomeAlert() or handleSomething()
      print(error);
    });

    return jsonString;
  }

  getData() async {
    String dataJson = await _loadAStudentAsset();
    _data = (json.decode(dataJson) as List)
        .map((i) => UserEntryData.fromJson(i))
        .toList();
    userData.addAll(_data);
    _clearChached();
    //  notifyListeners();
    print(userData);

    // notifyListeners();
    // return userData;
  }

  void _clearChached() {
    FilePicker.clearTemporaryFiles();
  }
}