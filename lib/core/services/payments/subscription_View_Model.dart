import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/Models/payments/subResponse_model.dart';
import 'package:ourESchool/core/enums/bottom_sheet_type.dart';
import 'package:ourESchool/core/services/payments/subscription_services.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SubscriptionViewModel extends BaseViewModel {
  SubscriptionServices _subscriptionService = locator<SubscriptionServices>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  SubscriptionResponse get pesaResponse => _subscriptionService.res;
  bool get rescode => _subscriptionService.code;
  // String get paymentDesc => _subscriptionService.paymentDesc;

  void makeSub() async {
    setBusy(true);
    await _subscriptionService.subscribe();
    cprint("payment under way");
    setBusy(false);
  }

  // Future showBasicDialog() async {
  //   await _dialogService.showDialog(
  //     title: 'The Basic Dialog',
  //     description: paymentDesc,
  //     buttonTitle: 'This is the main button title',
  //     // dialogPlatform: DialogPlatform.Cupertino, // DialogPlatform.Material
  //   );
  // }

  // Future showCustomBottomSheet() async {
  //   var response = await _bottomSheetService.showCustomSheet(
  //     variant: BottomSheetType.floating,
  //     title: 'This is a floating sheet',
  //     description: paymentDesc,
  //     mainButtonTitle: 'Awesome!',
  //     secondaryButtonTitle: 'This is cool',
  //   );

  //   // Remember the null check, if you don't and the user dismisses the dialog without selecting an option
  //   // it will be null.
  //   print('response: ${response?.confirmed}');
  // }
}
