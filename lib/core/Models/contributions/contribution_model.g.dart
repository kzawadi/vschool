// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contribution _$_$_ContributionFromJson(Map<String, dynamic> json) {
  return _$_Contribution(
    amount: json['amount'] as String,
    contributionId: json['contributionId'] as String,
    studentName: json['studentName'] as String,
    parentName: json['parentName'] as String,
    payed: json['payed'] as bool,
    description: json['description'] as String,
    startDate: json['startDate'] as String,
    expireDate: json['expireDate'] as String,
    targetClass: json['targetClass'] as String,
  );
}

Map<String, dynamic> _$_$_ContributionToJson(_$_Contribution instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'contributionId': instance.contributionId,
      'studentName': instance.studentName,
      'parentName': instance.parentName,
      'payed': instance.payed,
      'description': instance.description,
      'startDate': instance.startDate,
      'expireDate': instance.expireDate,
      'targetClass': instance.targetClass,
    };
