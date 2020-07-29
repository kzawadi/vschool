// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feed _$_$_FeedFromJson(Map<String, dynamic> json) {
  return _$_Feed(
    caption: json['caption'] as String,
    by: json['by'] as String,
    forDiv: json['forDiv'] as String,
    forClass: json['forClass'] as String,
    photoUrl: json['photoUrl'] as String,
    photoPath: json['photoPath'] as String,
    type: _$enumDecodeNullable(_$AnnouncementTypeEnumMap, json['type']),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$_$_FeedToJson(_$_Feed instance) => <String, dynamic>{
      'caption': instance.caption,
      'by': instance.by,
      'forDiv': instance.forDiv,
      'forClass': instance.forClass,
      'photoUrl': instance.photoUrl,
      'photoPath': instance.photoPath,
      'type': _$AnnouncementTypeEnumMap[instance.type],
      'id': instance.id,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AnnouncementTypeEnumMap = {
  AnnouncementType.CIRCULAR: 'CIRCULAR',
  AnnouncementType.EVENT: 'EVENT',
  AnnouncementType.ACTIVITY: 'ACTIVITY',
  AnnouncementType.UNKNOWN: 'UNKNOWN',
};
