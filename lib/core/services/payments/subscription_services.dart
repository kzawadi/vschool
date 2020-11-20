import 'package:http/http.dart' as http;
import 'package:ourESchool/UI/resources/utility.dart';
import 'package:ourESchool/core/Models/payments/subscriptions_model.dart';
import 'package:ourESchool/imports.dart';

class SubscriptionServices {
  // client.get( Uri.http("locahost:8000", "/category"));

  Future<void> subscribe() async {
    // var url = 'https://example.com/whatsit/create';
    String subMainUrl =
        "http://ec2-3-8-36-235.eu-west-2.compute.amazonaws.com:80/api/v1/vschool/subscription";
    // HttpClient client = HttpClient();
    // var x = client.post(subMainUrl, 80, "");
    var subBody = Subscription(
      msisdn: "000000000001",
      amount: "5000",
      itemDesc: "school",
      userId: "new user new user",
      typeOfSubscription: "MONTHLY",
      school: "mama",
      userName: "parent",
    );
    final payload = jsonEncode(subBody);
    cprint(payload);
    var response = await http.post(
      subMainUrl,
      body: payload,
      headers: {"Content-Type": "application/json"},
    );
    cprint('Response status: ${response.statusCode}');
    cprint('Response body: ${response.body}');

    // print(await http.read('https://example.com/foobar.txt'));
  }
}
