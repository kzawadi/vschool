import '../../../imports.dart';

class FeesPageModel extends BaseModel {
  AnnouncementServices _announcementServices = locator<AnnouncementServices>();
  FeesServices _feesServices = locator<FeesServices>();

  FeesPageModel();

  DocumentSnapshot get feessnapshot => _feesServices.feessnapshot;

  getAnnouncements(String studentId) async {
    setState(ViewState.Busy);
    await _feesServices.getFees(studentId);
    setState(ViewState.Idle);
  }

  // onRefresh(String stdDiv_Global) async {
  //   _announcementServices.postDocumentSnapshots.clear();
  //   _announcementServices.lastPostSnapshot = null;
  //   await getAnnouncements(stdDiv_Global);
  // }

  @override
  void dispose() {
    _announcementServices.lastPostSnapshot = null;
    _announcementServices.postDocumentSnapshots.clear();
    super.dispose();
  }
}
