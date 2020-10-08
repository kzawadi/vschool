// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'student_data_entry_db.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StudentEntryDataDb _$StudentEntryDataDbFromJson(Map<String, dynamic> json) {
  return _StudentEntryDataDb.fromJson(json);
}

/// @nodoc
class _$StudentEntryDataDbTearOff {
  const _$StudentEntryDataDbTearOff();

// ignore: unused_element
  _StudentEntryDataDb call(
      {String email, String id, Map<int, String> parentId}) {
    return _StudentEntryDataDb(
      email: email,
      id: id,
      parentId: parentId,
    );
  }

// ignore: unused_element
  StudentEntryDataDb fromJson(Map<String, Object> json) {
    return StudentEntryDataDb.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $StudentEntryDataDb = _$StudentEntryDataDbTearOff();

/// @nodoc
mixin _$StudentEntryDataDb {
  String get email;
  String get id; // bool isATeacher,
// String isATeachers,
  Map<int, String> get parentId;

  Map<String, dynamic> toJson();
  $StudentEntryDataDbCopyWith<StudentEntryDataDb> get copyWith;
}

/// @nodoc
abstract class $StudentEntryDataDbCopyWith<$Res> {
  factory $StudentEntryDataDbCopyWith(
          StudentEntryDataDb value, $Res Function(StudentEntryDataDb) then) =
      _$StudentEntryDataDbCopyWithImpl<$Res>;
  $Res call({String email, String id, Map<int, String> parentId});
}

/// @nodoc
class _$StudentEntryDataDbCopyWithImpl<$Res>
    implements $StudentEntryDataDbCopyWith<$Res> {
  _$StudentEntryDataDbCopyWithImpl(this._value, this._then);

  final StudentEntryDataDb _value;
  // ignore: unused_field
  final $Res Function(StudentEntryDataDb) _then;

  @override
  $Res call({
    Object email = freezed,
    Object id = freezed,
    Object parentId = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      id: id == freezed ? _value.id : id as String,
      parentId:
          parentId == freezed ? _value.parentId : parentId as Map<int, String>,
    ));
  }
}

/// @nodoc
abstract class _$StudentEntryDataDbCopyWith<$Res>
    implements $StudentEntryDataDbCopyWith<$Res> {
  factory _$StudentEntryDataDbCopyWith(
          _StudentEntryDataDb value, $Res Function(_StudentEntryDataDb) then) =
      __$StudentEntryDataDbCopyWithImpl<$Res>;
  @override
  $Res call({String email, String id, Map<int, String> parentId});
}

/// @nodoc
class __$StudentEntryDataDbCopyWithImpl<$Res>
    extends _$StudentEntryDataDbCopyWithImpl<$Res>
    implements _$StudentEntryDataDbCopyWith<$Res> {
  __$StudentEntryDataDbCopyWithImpl(
      _StudentEntryDataDb _value, $Res Function(_StudentEntryDataDb) _then)
      : super(_value, (v) => _then(v as _StudentEntryDataDb));

  @override
  _StudentEntryDataDb get _value => super._value as _StudentEntryDataDb;

  @override
  $Res call({
    Object email = freezed,
    Object id = freezed,
    Object parentId = freezed,
  }) {
    return _then(_StudentEntryDataDb(
      email: email == freezed ? _value.email : email as String,
      id: id == freezed ? _value.id : id as String,
      parentId:
          parentId == freezed ? _value.parentId : parentId as Map<int, String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_StudentEntryDataDb
    with DiagnosticableTreeMixin
    implements _StudentEntryDataDb {
  const _$_StudentEntryDataDb({this.email, this.id, this.parentId});

  factory _$_StudentEntryDataDb.fromJson(Map<String, dynamic> json) =>
      _$_$_StudentEntryDataDbFromJson(json);

  @override
  final String email;
  @override
  final String id;
  @override // bool isATeacher,
// String isATeachers,
  final Map<int, String> parentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StudentEntryDataDb(email: $email, id: $id, parentId: $parentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StudentEntryDataDb'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('parentId', parentId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StudentEntryDataDb &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(parentId);

  @override
  _$StudentEntryDataDbCopyWith<_StudentEntryDataDb> get copyWith =>
      __$StudentEntryDataDbCopyWithImpl<_StudentEntryDataDb>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StudentEntryDataDbToJson(this);
  }
}

abstract class _StudentEntryDataDb implements StudentEntryDataDb {
  const factory _StudentEntryDataDb(
      {String email,
      String id,
      Map<int, String> parentId}) = _$_StudentEntryDataDb;

  factory _StudentEntryDataDb.fromJson(Map<String, dynamic> json) =
      _$_StudentEntryDataDb.fromJson;

  @override
  String get email;
  @override
  String get id;
  @override // bool isATeacher,
// String isATeachers,
  Map<int, String> get parentId;
  @override
  _$StudentEntryDataDbCopyWith<_StudentEntryDataDb> get copyWith;
}
