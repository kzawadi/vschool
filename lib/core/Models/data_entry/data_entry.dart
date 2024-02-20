import 'package:framy_annotation/framy_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_entry.freezed.dart';
part 'data_entry.g.dart';

@immutable
@freezed
@framyModel
abstract class UserEntryData with _$UserEntryData {
  const factory UserEntryData({
    String email,
    String id,
    // bool isATeacher,
    String isATeacher,
    // Map<dynamic, String> childId,
    String childIds,
  }) = _UserEntryData;
  factory UserEntryData.fromJson(Map<String, dynamic> json) =>
      _$UserEntryDataFromJson(json);
}
