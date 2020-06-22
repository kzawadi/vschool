import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ourESchool/core/Models/data_entry/connections.dart';

part 'data_entry.freezed.dart';
part 'data_entry.g.dart';

@immutable
abstract class UserEntryData with _$UserEntryData {
  const factory UserEntryData(
      {String name, int age, List<Connections> connection}) = _UserEntryData;
  factory UserEntryData.fromJson(Map<String, dynamic> json) =>
      _$UserEntryDataFromJson(json);
}
