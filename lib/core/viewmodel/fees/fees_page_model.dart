import '../../../imports.dart';

class FeesPageModel extends BaseModel {
  FeesServices _feesServices = locator<FeesServices>();

  FeesPageModel();

  DocumentSnapshot get feessnapshot => _feesServices.feessnapshot;

  getFees(String studentId) async {
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
    // _announcementServices.lastPostSnapshot = null;
    // _announcementServices.postDocumentSnapshots.clear();
    //_feesServices.feessnapshot.clear();
    super.dispose();
  }
}
