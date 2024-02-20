import 'package:framy_annotation/framy_annotation.dart';
import 'package:ourESchool/imports.dart';

SharedPreferencesHelper _sharedPreferencesHelper =
    locator<SharedPreferencesHelper>();

@framyModel
class StudentData {
  String id;
  String email;
  // bool isATeacher;
  // Map childIds = Map<dynamic, dynamic>();
  Map parentIds = Map<dynamic, dynamic>();

  StudentData(
      {this.id,
      this.email,
      // this.isATeacher = false,
      // this.childIds,
      this.parentIds}) {
    setData();
  }

  setData() async {
    print('In StudentData Object');
    // if (childIds != null) {
    //   String childsId = json.encode(childIds);
    //   _sharedPreferencesHelper.setChildIds(childsId);
    // }

    if (parentIds != null) {
      String parentsId = json.encode(parentIds);
      _sharedPreferencesHelper.setParentsIdsData(parentsId);
    }
  }
}
