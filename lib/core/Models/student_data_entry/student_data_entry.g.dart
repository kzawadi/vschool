// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_data_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentEntryData _$_$_StudentEntryDataFromJson(Map<String, dynamic> json) {
  return _$_StudentEntryData(
    email: json['email'] as String,
    id: json['id'] as String,
    isATeacher: json['isATeacher'] as String,
    parentId: json['parentId'] as String,
  );
}

Map<String, dynamic> _$_$_StudentEntryDataToJson(
        _$_StudentEntryData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'isATeacher': instance.isATeacher,
      'parentId': instance.parentId,
    };
