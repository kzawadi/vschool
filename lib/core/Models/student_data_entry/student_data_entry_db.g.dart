// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_data_entry_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentEntryDataDb _$_$_StudentEntryDataDbFromJson(
    Map<String, dynamic> json) {
  return _$_StudentEntryDataDb(
    email: json['email'] as String,
    id: json['id'] as String,
    isATeacher: json['isATeacher'] as bool,
    parentId: (json['parentId'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
  );
}

Map<String, dynamic> _$_$_StudentEntryDataDbToJson(
        _$_StudentEntryDataDb instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'isATeacher': instance.isATeacher,
      'parentId': instance.parentId?.map((k, e) => MapEntry(k.toString(), e)),
    };
