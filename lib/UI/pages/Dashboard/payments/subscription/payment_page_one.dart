import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourESchool/UI/Widgets/button_round_with_shadow.dart';
import 'package:ourESchool/UI/Widgets/contra_text.dart';
import 'package:ourESchool/UI/Widgets/customAppBar.dart';
import 'package:ourESchool/UI/pages/Dashboard/payments/subscription/payment_card_item.dart';
import 'package:ourESchool/UI/resources/colors.dart';
import 'package:ourESchool/UI/resources/customWidgets.dart';
import 'package:ourESchool/core/services/payments/subscription_View_Model.dart';
import 'package:stacked/stacked.dart';
import 'package:framy_annotation/framy_annotation.dart';

final String words =
    "Thanks for appreciating our system , your about to subscribe to our services so we can innovate more.";

class PaymentPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //todo set this to nonReactive
    return ViewModelBuilder<SubscriptionViewModel>.reactive(
      viewModelBuilder: () => SubscriptionViewModel(),
      builder: (context, model, child) => PaymentPage(),
    );
  }
}

@FramyUseProvider(SubscriptionViewModel)
@FramyWidget()
class PaymentPage extends ViewModelWidget<SubscriptionViewModel> {
  @override
  Widget build(BuildContext context, SubscriptionViewModel viewModel) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar2(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ButtonRoundWithShadow(
                          size: 48,
                          borderColor: wood_smoke,
                          color: white,
                          callback: () {
                            Navigator.pop(context);
                          },
                          shadowColor: wood_smoke,
                          iconPath: "assets/icons/arrow_back.svg"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ContraText(
                    size: 27,
                    alignment: Alignment.bottomCenter,
                    text: "Subscriptions",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 20,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(18.0),
                child: ContraText(
                  alignment: Alignment.center,
                  text: words,
                  size: 18,
                  weight: FontWeight.w600,
                ),
              ),
              PaymentCartItem(
                onTap: viewModel.showSubscriptionBillingNumberFormYearly,
                bgColor: lightening_yellow,
                type: "Per Year",
                price: "Tz " + "50,000",
              ),
              sizedBox(height: 30),
              PaymentCartItem(
                onTap: viewModel.showSubscriptionBillingNumberForm,
                bgColor: flamingo,
                type: "Per Month",
                price: "Tz " + "5,000",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
