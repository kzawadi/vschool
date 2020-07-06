import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_data_entry_db.freezed.dart';
part 'student_data_entry_db.g.dart';

@immutable
@freezed
abstract class StudentEntryDataDb with _$StudentEntryDataDb {
  const factory StudentEntryDataDb({
    String email,
    String id,
    bool isATeacher,
    // String isATeachers,
    Map<int, String> parentId,
    // String childIds,
  }) = _StudentEntryDataDb;
  factory StudentEntryDataDb.fromJson(Map<String, dynamic> json) =>
      _$StudentEntryDataDbFromJson(json);
}
