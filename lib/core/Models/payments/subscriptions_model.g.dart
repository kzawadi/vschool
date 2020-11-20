// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Subscription _$_$_SubscriptionFromJson(Map<String, dynamic> json) {
  return _$_Subscription(
    amount: json['amount'] as int,
    itemDesc: json['itemDesc'] as String,
    msisdn: json['msisdn'] as String,
    school: json['school'] as String,
    userId: json['userId'] as String,
    typeOfSubscription: json['typeOfSubscription'] as String,
    userName: json['userName'] as String,
  );
}

Map<String, dynamic> _$_$_SubscriptionToJson(_$_Subscription instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'itemDesc': instance.itemDesc,
      'msisdn': instance.msisdn,
      'school': instance.school,
      'userId': instance.userId,
      'typeOfSubscription': instance.typeOfSubscription,
      'userName': instance.userName,
    };
