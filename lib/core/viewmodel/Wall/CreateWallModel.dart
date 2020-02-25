import 'package:ourESchool/core/Models/school_wall/wall_model.dart';
import 'package:ourESchool/core/enums/ViewState.dart';
import 'package:ourESchool/core/services/wallServices/wallServices.dart';
import 'package:ourESchool/core/viewmodel/BaseModel.dart';
import 'package:ourESchool/locator.dart';

class CreateWallModel extends BaseModel {
  WallServices wallServices = locator<WallServices>();

  getUserData() async {
    setState(ViewState.Busy);
    await wallServices.init();
    setState(ViewState.Idle);
  }

  Future postAnnouncement(Wall wall) async {
    setState(ViewState.Busy);
    await wallServices.postAnnouncement(wall);
    setState(ViewState.Idle);
  }

  // @override
  // void dispose() {
  //   if (state == ViewState.Idle && state2 == ViewState.Idle) {
  //     super.dispose();
  //   }
  // }
}
