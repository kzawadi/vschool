import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:ourESchool/core/Models/data_entry/data_entry.dart';
import 'package:ourESchool/core/services/Services.dart';

class DataEntryService extends Services {
  DataEntryService() {
    // getFirebaseUser();
    getSchoolCode();
  }

  Future<void> postData() async {
//Schools/India/MAMA/Login/Parent-Teacher/dZdZUa5GAlFtjblV3UVN
    var _postRefs = (await schoolRefwithCode())
        .document('Login')
        .collection('Parent-Teacher')
        .document('b0Rk7BjGDlilKn6ZZiod');

    Map<dynamic, String> childIdss = {'1': 'tuswege'};
    var vlue = {"1": "2nd,3rd,4th"};
    UserEntryData data = UserEntryData(
      email: 'newd@gmail.com',
      id: 'newdUserId',
      // isATeacher: false,
      // childId: childIdss,
    );
    Map datta = data.toJson();
    print(childIdss);
    await _postRefs.setData(datta);
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
