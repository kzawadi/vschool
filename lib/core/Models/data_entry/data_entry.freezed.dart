// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

UserEntryData _$UserEntryDataFromJson(Map<String, dynamic> json) {
  return _UserEntryData.fromJson(json);
}

abstract class _$UserEntryData {
  String get email;
  String get id;
  String get isATeacher;
  String get childIds;

  UserEntryData copyWith(
      {String email, String id, String isATeacher, String childIds});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_UserEntryData with DiagnosticableTreeMixin implements _UserEntryData {
  const _$_UserEntryData({this.email, this.id, this.isATeacher, this.childIds});

  factory _$_UserEntryData.fromJson(Map<String, dynamic> json) =>
      _$_$_UserEntryDataFromJson(json);

  @override
  final String email;
  @override
  final String id;
  @override
  final String isATeacher;
  @override
  final String childIds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'UserEntryData(email: $email, id: $id, isATeacher: $isATeacher, childIds: $childIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEntryData'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isATeacher', isATeacher))
      ..add(DiagnosticsProperty('childIds', childIds));
  }

  @override
  bool operator ==(dynamic other) {
    return other is _UserEntryData &&
        (identical(other.email, email) || other.email == email) &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.isATeacher, isATeacher) ||
            other.isATeacher == isATeacher) &&
        (identical(other.childIds, childIds) || other.childIds == childIds);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      email.hashCode ^
      id.hashCode ^
      isATeacher.hashCode ^
      childIds.hashCode;

  @override
  _$_UserEntryData copyWith({
    Object email = immutable,
    Object id = immutable,
    Object isATeacher = immutable,
    Object childIds = immutable,
  }) {
    return _$_UserEntryData(
      email: email == immutable ? this.email : email as String,
      id: id == immutable ? this.id : id as String,
      isATeacher:
          isATeacher == immutable ? this.isATeacher : isATeacher as String,
      childIds: childIds == immutable ? this.childIds : childIds as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserEntryDataToJson(this);
  }
}

abstract class _UserEntryData implements UserEntryData {
  const factory _UserEntryData(
      {String email,
      String id,
      String isATeacher,
      String childIds}) = _$_UserEntryData;

  factory _UserEntryData.fromJson(Map<String, dynamic> json) =
      _$_UserEntryData.fromJson;

  @override
  String get email;
  @override
  String get id;
  @override
  String get isATeacher;
  @override
  String get childIds;

  @override
  _UserEntryData copyWith(
      {String email, String id, String isATeacher, String childIds});
}