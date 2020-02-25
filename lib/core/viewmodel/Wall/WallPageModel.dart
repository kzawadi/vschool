import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/enums/ViewState.dart';
import 'package:ourESchool/core/viewmodel/BaseModel.dart';
import 'package:ourESchool/locator.dart';
import 'package:ourESchool/core/services/wallServices/wallServices.dart';

class WallPageModel extends BaseModel {
  WallServices _wallServices = locator<WallServices>();

  WallPageModel();

  List<DocumentSnapshot> get postSnapshotList =>
      _wallServices.postDocumentSnapshots;

  getAnnouncements(String stdDiv_Global) async {
    setState(ViewState.Busy);
    await _wallServices.getAnnouncements(stdDiv_Global);
    setState(ViewState.Idle);
  }

  onRefresh(String stdDiv_Global) async {
    _wallServices.postDocumentSnapshots.clear();
    _wallServices.lastPostSnapshot = null;
    await getAnnouncements(stdDiv_Global);
  }

  @override
  void dispose() {
    _wallServices.lastPostSnapshot = null;
    _wallServices.postDocumentSnapshots.clear();
    super.dispose();
  }
}
