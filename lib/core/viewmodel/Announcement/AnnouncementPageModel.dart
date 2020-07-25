import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/services/AnnouncementServices.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';

class AnnouncementPageModel extends BaseViewModel {
  AnnouncementServices _announcementServices = locator<AnnouncementServices>();

  AnnouncementPageModel();

  List<DocumentSnapshot> get postSnapshotList =>
      _announcementServices.postDocumentSnapshots;

  getAnnouncements(String stdDivGlobal) async {
    setBusy(true);
    await _announcementServices.getAnnouncements(stdDivGlobal);
    notifyListeners();
    setBusy(false);
  }

  deleteAnnouncements(String id, String stdDivGlobal) async {
    setBusy(true);
    await _announcementServices.deleteAnnouncement(id, stdDivGlobal);
    notifyListeners();
    setBusy(false);
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
