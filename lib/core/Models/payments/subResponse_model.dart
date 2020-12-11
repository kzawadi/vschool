import 'package:framy_annotation/framy_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subResponse_model.g.dart';
part 'subResponse_model.freezed.dart';

@immutable
@freezed
@framyModel
abstract class SubscriptionResponse with _$SubscriptionResponse {
  const factory SubscriptionResponse({
    String responseCode,
    String output_ResponseDesc,
  }) = _SubscriptionResponse;

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);
}
