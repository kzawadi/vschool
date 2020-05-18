import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/enums/ViewState.dart';
import 'package:ourESchool/core/services/AnnouncementServices.dart';
import 'package:ourESchool/core/viewmodel/BaseModel.dart';
import 'package:ourESchool/locator.dart';

class AnnouncementPageModel extends BaseModel {
  AnnouncementServices _announcementServices = locator<AnnouncementServices>();

  AnnouncementPageModel();

  List<DocumentSnapshot> get postSnapshotList =>
      _announcementServices.postDocumentSnapshots;

  getAnnouncements(String stdDivGlobal) async {
    setState(ViewState.Busy);
    await _announcementServices.getAnnouncements(stdDivGlobal);
    setState(ViewState.Idle);
  }

  deleteAnnouncements(String id, String stdDivGlobal) async {
    setState(ViewState.Busy);
    await _announcementServices.deleteAnnouncement(id, stdDivGlobal);
    setState(ViewState.Idle);
  }

  onRefresh(String stdDivGlobal) async {
    _announcementServices.postDocumentSnapshots.clear();
    _announcementServices.lastPostSnapshot = null;
    await getAnnouncements(stdDivGlobal);
  }

  @override
  void dispose() {
    _announcementServices.lastPostSnapshot = null;
    _announcementServices.postDocumentSnapshots.clear();
    super.dispose();
  }
}
