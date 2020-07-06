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
//Schools/India/MAMA/Login/Parent-Teacher/dZdZUa5GAlFtjblV3UVN

    for (StudentEntryData u in userEntryData) {
      String wazazi = u.parentId;
      List mzazi = wazazi.split(',');

      Map<int, String> wazazimapped = mzazi.asMap();
      StudentEntryDataDb x = StudentEntryDataDb(
        email: u.email,
        id: u.id,
        isATeacher:
            false, //bool.fromEnvironment(u.isATeacher.trim().toLowerCase()),
        parentId: wazazimapped,
      );

      Map data = x.toJson();
      print(data);
      print(wazazimapped);
      DocumentReference _refs = (await schoolRefwithCode())
          .document('Login')
          .collection('Student')
          .document(u.id);

      await _refs.setData(data, merge: true);
    }
  }

  File _jsonFile;
  List<StudentEntryData> userData = List<StudentEntryData>();
  String _path;
  String jsonString;
  List<StudentEntryData> _data = [];

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
        .map((i) => StudentEntryData.fromJson(i))
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
