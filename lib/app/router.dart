import 'package:auto_route/auto_route_annotations.dart';
import 'package:ourESchool/UI/pages/Chat/ChatPage.dart';
import 'package:ourESchool/UI/pages/feed/feed_page.dart';
import 'package:ourESchool/UI/pages/Setting/SettingPage.dart';
import 'package:ourESchool/UI/pages/Dashboard/payments/subscription/payment_page_one.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: FeedPage, initial: true),
  MaterialRoute(page: ChatPage),
  MaterialRoute(page: SettingPage),
  MaterialRoute(page: PaymentPageOne)
])
class $Router {}
