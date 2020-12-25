import 'package:framy_annotation/framy_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contribution_model.freezed.dart';
part 'contribution_model.g.dart';

@framyModel
@immutable
@freezed
abstract class Contribution with _$Contribution {
  const factory Contribution({
    String amount,
    String contributionId,
    String studentName,
    String parentName,
    bool payed,
    String description,
    String startDate,
    String expireDate,
    String targetClass,
    // DateTime date,

    // String childIds,
  }) = _Contribution;
  factory Contribution.fromJson(Map<String, dynamic> json) =>
      _$ContributionFromJson(json);
}
