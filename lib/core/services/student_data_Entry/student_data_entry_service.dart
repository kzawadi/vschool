import 'dart:convert';
import 'dart:io';
import 'dart:core';

import 'package:file_picker/file_picker.dart';
import 'package:ourESchool/core/Models/student_data_entry/student_data_entry.dart';
import 'package:ourESchool/core/Models/student_data_entry/student_data_entry_db.dart';
import 'package:ourESchool/core/services/Services.dart';
import 'package:ourESchool/imports.dart';

class StudentDataEntryService extends Services {
  StudentDataEntryService() {
    // getFirebaseUser();
    getSchoolCode();
  }

  Future<void> postData({List<StudentEntryData> userEntryData}) async {
//Schools/India/MAMA/Login/Student/dZdZUa5GAlFtjblV3UVN
    SetOptions options = SetOptions(merge: true);

    for (StudentEntryData u in userEntryData) {
      // String wazazi = u.parentId;
      List mzazi = u.parentId.split(',');

      Map<int, String> wazazimapped = mzazi.asMap();
      StudentEntryDataDb x = StudentEntryDataDb(
        email: u.email,
        id: u.id,
        parentId: wazazimapped,
      );

      Map data = x.toJson();
      print(data);
      print(wazazimapped);
      DocumentReference _refs = (await schoolRefwithCode())
          .doc('Login')
          .collection('Student')
          .doc(u.id);

      await _refs.set(data, options);
    }
  }

  File _jsonFile;
  var userData = <StudentEntryData>[];
  // String _path;
  String jsonString;
  var _data = <StudentEntryData>[];

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

  Future<List<StudentEntryData>> getData() async {
    clearData();
    String dataJson = await _loadAStudentAsset();
    _data = (json.decode(dataJson) as List)
        .map((i) => StudentEntryData.fromJson(i))
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
