import 'package:framy_annotation/framy_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_entry_db.freezed.dart';
part 'data_entry_db.g.dart';

@immutable
@freezed
@framyModel
abstract class UserEntryDataDb with _$UserEntryDataDb {
  const factory UserEntryDataDb({
    String email,
    String id,
    bool isATeacher,
    // String isATeachers,
    Map<int, String> childId,
    // String childIds,
  }) = _UserEntryDataDb;
  factory UserEntryDataDb.fromJson(Map<String, dynamic> json) =>
      _$UserEntryDataDbFromJson(json);
}
