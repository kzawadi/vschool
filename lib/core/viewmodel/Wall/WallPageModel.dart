import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/enums/ViewState.dart';
import 'package:ourESchool/core/viewmodel/BaseModel.dart';
import 'package:ourESchool/locator.dart';
import 'package:ourESchool/core/services/wallServices/wallServices.dart';

class WallPageModel extends BaseModel {
  WallServices _wallServices = locator<WallServices>();

  WallPageModel();

  DocumentSnapshot get wall => _wallServices.wallsnapshot;

  getWall(String stdDiv_Global) async {
    setState(ViewState.Busy);
    await _wallServices.getWall(stdDiv_Global);
    setState(ViewState.Idle);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
