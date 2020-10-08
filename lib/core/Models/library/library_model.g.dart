// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Classlibrary _$_$_ClasslibraryFromJson(Map<String, dynamic> json) {
  return _$_Classlibrary(
    standard: json['standard'] as String,
    division: json['division'] as String,
    description: json['description'] as String,
    day: json['day'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    by: json['by'] as String,
    subjects: json['subjects'] as List,
  );
}

Map<String, dynamic> _$_$_ClasslibraryToJson(_$_Classlibrary instance) =>
    <String, dynamic>{
      'standard': instance.standard,
      'division': instance.division,
      'description': instance.description,
      'day': instance.day,
      'createdAt': instance.createdAt?.toIso8601String(),
      'by': instance.by,
      'subjects': instance.subjects,
    };
