// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entry_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntryDataDb _$_$_UserEntryDataDbFromJson(Map<String, dynamic> json) {
  return _$_UserEntryDataDb(
    email: json['email'] as String,
    id: json['id'] as String,
    isATeacher: json['isATeacher'] as bool,
    childId: (json['childId'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
  );
}

Map<String, dynamic> _$_$_UserEntryDataDbToJson(_$_UserEntryDataDb instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'isATeacher': instance.isATeacher,
      'childId': instance.childId?.map((k, e) => MapEntry(k.toString(), e)),
    };
