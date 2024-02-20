import 'package:framy_annotation/framy_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscriptions_model.g.dart';
part 'subscriptions_model.freezed.dart';

@immutable
@freezed
@framyModel
abstract class Subscription with _$Subscription {
  const factory Subscription({
    @required String amount,
    String itemDesc,
    @required String msisdn,
    String school,
    @required String userId,
    String typeOfSubscription,
    String userName,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

/// the type of subscription the user is enrolling
// enum ChannelType { MONTHLY, YEARLY }

// class ChannelTypeHelper {
//   static String stringOf(ChannelType type) {
//     switch (type) {
//       case ChannelType.YEARLY:
//         return "YEARLY";
//       case ChannelType.MONTHLY:
//         return "MONTHLY";
//     }
//     return null;
//   }

//   static ChannelType valueOf(String string) {
//     switch (string) {
//       case "YEARLY":
//         return ChannelType.YEARLY;
//       case "MONTHLY":
//         return ChannelType.MONTHLY;
//     }
//     return null;
//   }
// }
