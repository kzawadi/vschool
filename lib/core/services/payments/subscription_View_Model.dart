import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/Models/payments/subResponse_model.dart';
import 'package:ourESchool/core/enums/dialog_type.dart';
import 'package:ourESchool/core/services/payments/subscription_services.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SubscriptionViewModel extends BaseViewModel {
  SubscriptionServices _subscriptionService = locator<SubscriptionServices>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  bool _confirmationResult;
  bool get confirmationResult => _confirmationResult;

  DialogResponse _dialogResponse;
  DialogResponse get customDialogResult => _dialogResponse;

  SubscriptionResponse get pesaResponse => _subscriptionService.res;
  // bool get rescode => _subscriptionService.code;

  get title => "TITLE";
  // String get paymentDesc => _subscriptionService.paymentDesc;

  // void makeSub() async {
  //   setBusy(true);
  //   await _subscriptionService.subscribe();
  //   cprint("payment under way");
  //   setBusy(false);
  // }

  void makeSubYearly() async {
    setBusy(true);
    await _subscriptionService.subscribe();
    cprint("payment under way");
    setBusy(false);
  }

  ///This method triger a Diolof form which a user can enter her phone number
  ///for mpesa Subscription payment procedure to start and after getting that number
  ///through the responseData we pass it to the API
  ///the Data coming from the dialog is [msisdn]
  Future showSubscriptionBillingNumberForm() async {
    await _dialogService
        .showCustomDialog(
      variant: DialogType.SubscriptionsDetails,
      customData: DialogType.SubscriptionsDetails,
      barrierDismissible: true,
    )
        .then(
      (value) async {
        //todo handle confirmation of okay..because now the function will be called even if the dialog was cancelled

        if (value.confirmed) {
          String msisdn = value?.responseData.toString().trim();
          _confirmationResult = value?.confirmed;
          cprint(msisdn);
          await _subscriptionService.subscribe(msisdn: msisdn);
        } else
          cprint("Payments process Canceled",
              event: "Subscription Process Canceled");
      },
      onError: (e) => cprint(
          "No value was found in showSubscriptionBillingNumberForm---" + e),
    );
  }

  ///This method triger a Diolof form which a user can enter her phone number
  ///for mpesa Subscription payment procedure to start and after getting that number
  ///through the responseData we pass it to the API
  ///the Data coming from the dialog is [msisdn]
  Future showSubscriptionBillingNumberFormYearly() async {
    await _dialogService
        .showCustomDialog(
      variant: DialogType.SubscriptionsDetails,
      customData: DialogType.SubscriptionsDetails,
      barrierDismissible: true,
    )
        .then(
      (value) async {
        //todo handle confirmation of okay..because now the function will be called even if the dialog was cancelled

        if (value.confirmed) {
          String msisdn = value?.responseData.toString().trim();
          _confirmationResult = value?.confirmed;
          cprint(msisdn);
          await _subscriptionService.subscribeYearly(msisdn: msisdn);
        } else
          cprint("Payments process Canceled",
              event: "Subscription Process Canceled");
      },
      onError: (e) => cprint(
          "No value was found in showSubscriptionBillingNumberForm---" + e),
    );
  }
}
