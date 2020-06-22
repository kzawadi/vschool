// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntryData _$_$_UserEntryDataFromJson(Map<String, dynamic> json) {
  return _$_UserEntryData(
    name: json['name'] as String,
    age: json['age'] as int,
    connection: (json['connection'] as List)
        ?.map((e) =>
            e == null ? null : Connections.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_UserEntryDataToJson(_$_UserEntryData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'connection': instance.connection,
    };
