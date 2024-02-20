// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../UI/pages/Chat/ChatPage.dart';
import '../UI/pages/Dashboard/payments/subscription/payment_page_one.dart';
import '../UI/pages/Setting/SettingPage.dart';
import '../UI/pages/feed/feed_page.dart';

class Routes {
  static const String feedPage = '/';
  static const String chatPage = '/chat-page';
  static const String settingPage = '/setting-page';
  static const String paymentPageOne = '/payment-page-one';
  static const all = <String>{
    feedPage,
    chatPage,
    settingPage,
    paymentPageOne,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.feedPage, page: FeedPage),
    RouteDef(Routes.chatPage, page: ChatPage),
    RouteDef(Routes.settingPage, page: SettingPage),
    RouteDef(Routes.paymentPageOne, page: PaymentPageOne),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    FeedPage: (data) {
      final args = data.getArgs<FeedPageArguments>(
        orElse: () => FeedPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => FeedPage(
          key: args.key,
          reactive: args.reactive,
        ),
        settings: data,
      );
    },
    ChatPage: (data) {
      final args = data.getArgs<ChatPageArguments>(
        orElse: () => ChatPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatPage(key: args.key),
        settings: data,
      );
    },
    SettingPage: (data) {
      final args = data.getArgs<SettingPageArguments>(
        orElse: () => SettingPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingPage(key: args.key),
        settings: data,
      );
    },
    PaymentPageOne: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PaymentPageOne(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// FeedPage arguments holder class
class FeedPageArguments {
  final Key key;
  final dynamic reactive;
  FeedPageArguments({this.key, this.reactive = false});
}

/// ChatPage arguments holder class
class ChatPageArguments {
  final Key key;
  ChatPageArguments({this.key});
}

/// SettingPage arguments holder class
class SettingPageArguments {
  final Key key;
  SettingPageArguments({this.key});
}
