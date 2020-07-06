import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_data_entry.freezed.dart';
part 'student_data_entry.g.dart';

@immutable
@freezed
abstract class StudentEntryData with _$StudentEntryData {
  const factory StudentEntryData({
    String email,
    String id,
    // bool isATeacher,
    // String isATeacher,
    // Map<dynamic, String> childId,
    String parentId,
  }) = _StudentEntryData;
  factory StudentEntryData.fromJson(Map<String, dynamic> json) =>
      _$StudentEntryDataFromJson(json);
}
