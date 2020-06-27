// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entry_db.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

UserEntryDataDb _$UserEntryDataDbFromJson(Map<String, dynamic> json) {
  return _UserEntryDataDb.fromJson(json);
}

abstract class _$UserEntryDataDb {
  String get email;
  String get id;
  bool get isATeacher;
  Map<int, String> get childId;

  UserEntryDataDb copyWith(
      {String email, String id, bool isATeacher, Map<int, String> childId});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_UserEntryDataDb
    with DiagnosticableTreeMixin
    implements _UserEntryDataDb {
  const _$_UserEntryDataDb(
      {this.email, this.id, this.isATeacher, this.childId});

  factory _$_UserEntryDataDb.fromJson(Map<String, dynamic> json) =>
      _$_$_UserEntryDataDbFromJson(json);

  @override
  final String email;
  @override
  final String id;
  @override
  final bool isATeacher;
  @override
  final Map<int, String> childId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'UserEntryDataDb(email: $email, id: $id, isATeacher: $isATeacher, childId: $childId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEntryDataDb'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isATeacher', isATeacher))
      ..add(DiagnosticsProperty('childId', childId));
  }

  @override
  bool operator ==(dynamic other) {
    return other is _UserEntryDataDb &&
        (identical(other.email, email) || other.email == email) &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.isATeacher, isATeacher) ||
            other.isATeacher == isATeacher) &&
        (identical(other.childId, childId) || other.childId == childId);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      email.hashCode ^
      id.hashCode ^
      isATeacher.hashCode ^
      childId.hashCode;

  @override
  _$_UserEntryDataDb copyWith({
    Object email = immutable,
    Object id = immutable,
    Object isATeacher = immutable,
    Object childId = immutable,
  }) {
    return _$_UserEntryDataDb(
      email: email == immutable ? this.email : email as String,
      id: id == immutable ? this.id : id as String,
      isATeacher:
          isATeacher == immutable ? this.isATeacher : isATeacher as bool,
      childId:
          childId == immutable ? this.childId : childId as Map<int, String>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserEntryDataDbToJson(this);
  }
}

abstract class _UserEntryDataDb implements UserEntryDataDb {
  const factory _UserEntryDataDb(
      {String email,
      String id,
      bool isATeacher,
      Map<int, String> childId}) = _$_UserEntryDataDb;

  factory _UserEntryDataDb.fromJson(Map<String, dynamic> json) =
      _$_UserEntryDataDb.fromJson;

  @override
  String get email;
  @override
  String get id;
  @override
  bool get isATeacher;
  @override
  Map<int, String> get childId;

  @override
  _UserEntryDataDb copyWith(
      {String email, String id, bool isATeacher, Map<int, String> childId});
}
