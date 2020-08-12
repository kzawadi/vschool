// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntryData _$_$_UserEntryDataFromJson(Map<String, dynamic> json) {
  return _$_UserEntryData(
    email: json['email'] as String,
    id: json['id'] as String,
    isATeacher: json['isATeacher'] as String,
    childIds: json['childIds'] as String,
  );
}

Map<String, dynamic> _$_$_UserEntryDataToJson(_$_UserEntryData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'isATeacher': instance.isATeacher,
      'childIds': instance.childIds,
    };
