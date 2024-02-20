import 'package:http/http.dart' as http;
import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/Models/payments/subResponse_model.dart';
import 'package:ourESchool/core/Models/payments/subscriptions_model.dart';
import 'package:ourESchool/core/enums/bottom_sheet_type.dart';
import 'package:ourESchool/imports.dart';
import 'package:stacked_services/stacked_services.dart';

class SubscriptionServices with Services {
  final _bottomSheetService = locator<BottomSheetService>();

  SubscriptionResponse res;
  // bool code = true;
  String paymentDesc = "noData";
  // String schoolCode = '';

  Future<void> subscribe({String msisdn}) async {
    String schoolName = await getSchoolCode();
    String subMainUrl =
        "http://ec2-3-8-36-235.eu-west-2.compute.amazonaws.com:80/silver";
    var subBody = Subscription(
      msisdn: msisdn,
      amount: "5000",
      itemDesc: "Vschool Subscription Monthly",
      userId: auth.currentUser.uid,
      typeOfSubscription: "MONTHLY",
      school: schoolName,
      userName: auth.currentUser.email,
    );
    final payload = jsonEncode(subBody);
    cprint(payload);
    await http.post(
      subMainUrl,
      body: payload,
      headers: {"Content-Type": "application/json"},
    ).then(
      (value) async {
        cprint('Response status: ${value.statusCode}');
        cprint('Response body: ${value.body}');
        var x = jsonDecode(value.body);
        res = SubscriptionResponse.fromJson(x);
        Map<String, dynamic> map = jsonDecode(value.body);
        paymentDesc = map['output_ResponseDesc'];
        cprint(paymentDesc);
        await showCustomBottomSheet(desc: paymentDesc);
      },
    );
  }

  Future<void> subscribeYearly({String msisdn}) async {
    String schoolName = await getSchoolCode();
    String subMainUrl =
        "http://ec2-3-8-36-235.eu-west-2.compute.amazonaws.com:80/silver";
    var subBody = Subscription(
      msisdn: msisdn,
      amount: "50000",
      itemDesc: "Vschool Subscription Yearly",
      userId: auth.currentUser.uid,
      typeOfSubscription: "YEARLY",
      school: schoolName,
      userName: auth.currentUser.email,
    );
    final payload = jsonEncode(subBody);
    cprint(payload);
    await http.post(
      subMainUrl,
      body: payload,
      headers: {"Content-Type": "application/json"},
    ).then(
      (value) async {
        cprint('Response status: ${value.statusCode}');
        cprint('Response body: ${value.body}');
        var x = jsonDecode(value.body);
        res = SubscriptionResponse.fromJson(x);
        Map<String, dynamic> map = jsonDecode(value.body);
        paymentDesc = map['output_ResponseDesc'];
        cprint(paymentDesc);
        await showCustomBottomSheet(desc: paymentDesc);
      },
    );
  }

  Future showCustomBottomSheet({String desc}) async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.floating,
      title: 'Payments Status',
      description: desc,
      mainButtonTitle: "okay",
      barrierDismissible: true,
      secondaryButtonTitle: "",
    );

    // Remember the null check, if you don't and the user dismisses the dialog without selecting an option
    // it will be null.
    cprint('response: ${sheetResponse?.confirmed}');
  }
}
