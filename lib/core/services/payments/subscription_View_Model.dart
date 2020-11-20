import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/services/payments/subscription_services.dart';
import 'package:ourESchool/locator.dart';
import 'package:stacked/stacked.dart';

class SubscriptionViewModel extends BaseViewModel {
  SubscriptionServices _subscriptionService = locator<SubscriptionServices>();

  makeSub() {
    setBusy(true);
    _subscriptionService.subscribe();
    cprint("payment under way");
    setBusy(false);
  }
}
