import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscriptionResponse_model.g.dart';
part 'subscriptionResponse_model.freezed.dart';

@immutable
@freezed
abstract class SubscriptionResponse with _$SubscriptionResponse {
  const factory SubscriptionResponse({
    String responseCode,
    String outputResponseDesc,
  }) = _SubscriptionResponse;

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);
}
