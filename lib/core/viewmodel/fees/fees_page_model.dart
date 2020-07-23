import 'package:stacked/stacked.dart';

import '../../../imports.dart';

class FeesPageModel extends BaseViewModel {
  FeesServices _feesServices = locator<FeesServices>();

  FeesPageModel();

  DocumentSnapshot get feessnapshot => _feesServices.feessnapshot;

  void getFees(String studentId) async {
    setBusy(true);
    await _feesServices.getFees(studentId);
    notifyListeners();
    setBusy(false);
  }
}
