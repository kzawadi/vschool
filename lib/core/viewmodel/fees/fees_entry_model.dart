import 'package:ourESchool/core/Models/fees/fees_model.dart';
import 'package:stacked/stacked.dart';

import '../../../imports.dart';

class CreateFeesModel extends BaseViewModel {
  FeesServices _feesServices = locator<FeesServices>();

  // getUserData() async {
  //   setState(ViewState.Busy);
  //   // await _feesServices.init();
  //   setState(ViewState.Idle);
  // }

  /// remember to pass the studentId
  Future postFees(Fees fees, String id) async {
    setBusy(true);
    await _feesServices.postFees(fees, id);
    notifyListeners();
    setBusy(false);
  }

  // @override
  // void dispose() {
  //   if (state == ViewState.Idle && state2 == ViewState.Idle) {
  //     super.dispose();
  //   }
  // }
}
