// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'data_entry_db.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserEntryDataDb _$UserEntryDataDbFromJson(Map<String, dynamic> json) {
  return _UserEntryDataDb.fromJson(json);
}

/// @nodoc
class _$UserEntryDataDbTearOff {
  const _$UserEntryDataDbTearOff();

// ignore: unused_element
  _UserEntryDataDb call(
      {String email, String id, bool isATeacher, Map<int, String> childId}) {
    return _UserEntryDataDb(
      email: email,
      id: id,
      isATeacher: isATeacher,
      childId: childId,
    );
  }

// ignore: unused_element
  UserEntryDataDb fromJson(Map<String, Object> json) {
    return UserEntryDataDb.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserEntryDataDb = _$UserEntryDataDbTearOff();

/// @nodoc
mixin _$UserEntryDataDb {
  String get email;
  String get id;
  bool get isATeacher; // String isATeachers,
  Map<int, String> get childId;

  Map<String, dynamic> toJson();
  $UserEntryDataDbCopyWith<UserEntryDataDb> get copyWith;
}

/// @nodoc
abstract class $UserEntryDataDbCopyWith<$Res> {
  factory $UserEntryDataDbCopyWith(
          UserEntryDataDb value, $Res Function(UserEntryDataDb) then) =
      _$UserEntryDataDbCopyWithImpl<$Res>;
  $Res call(
      {String email, String id, bool isATeacher, Map<int, String> childId});
}

/// @nodoc
class _$UserEntryDataDbCopyWithImpl<$Res>
    implements $UserEntryDataDbCopyWith<$Res> {
  _$UserEntryDataDbCopyWithImpl(this._value, this._then);

  final UserEntryDataDb _value;
  // ignore: unused_field
  final $Res Function(UserEntryDataDb) _then;

  @override
  $Res call({
    Object email = freezed,
    Object id = freezed,
    Object isATeacher = freezed,
    Object childId = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      id: id == freezed ? _value.id : id as String,
      isATeacher:
          isATeacher == freezed ? _value.isATeacher : isATeacher as bool,
      childId:
          childId == freezed ? _value.childId : childId as Map<int, String>,
    ));
  }
}

/// @nodoc
abstract class _$UserEntryDataDbCopyWith<$Res>
    implements $UserEntryDataDbCopyWith<$Res> {
  factory _$UserEntryDataDbCopyWith(
          _UserEntryDataDb value, $Res Function(_UserEntryDataDb) then) =
      __$UserEntryDataDbCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email, String id, bool isATeacher, Map<int, String> childId});
}

/// @nodoc
class __$UserEntryDataDbCopyWithImpl<$Res>
    extends _$UserEntryDataDbCopyWithImpl<$Res>
    implements _$UserEntryDataDbCopyWith<$Res> {
  __$UserEntryDataDbCopyWithImpl(
      _UserEntryDataDb _value, $Res Function(_UserEntryDataDb) _then)
      : super(_value, (v) => _then(v as _UserEntryDataDb));

  @override
  _UserEntryDataDb get _value => super._value as _UserEntryDataDb;

  @override
  $Res call({
    Object email = freezed,
    Object id = freezed,
    Object isATeacher = freezed,
    Object childId = freezed,
  }) {
    return _then(_UserEntryDataDb(
      email: email == freezed ? _value.email : email as String,
      id: id == freezed ? _value.id : id as String,
      isATeacher:
          isATeacher == freezed ? _value.isATeacher : isATeacher as bool,
      childId:
          childId == freezed ? _value.childId : childId as Map<int, String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
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
  @override // String isATeachers,
  final Map<int, String> childId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
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
    return identical(this, other) ||
        (other is _UserEntryDataDb &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isATeacher, isATeacher) ||
                const DeepCollectionEquality()
                    .equals(other.isATeacher, isATeacher)) &&
            (identical(other.childId, childId) ||
                const DeepCollectionEquality().equals(other.childId, childId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isATeacher) ^
      const DeepCollectionEquality().hash(childId);

  @override
  _$UserEntryDataDbCopyWith<_UserEntryDataDb> get copyWith =>
      __$UserEntryDataDbCopyWithImpl<_UserEntryDataDb>(this, _$identity);

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
  @override // String isATeachers,
  Map<int, String> get childId;
  @override
  _$UserEntryDataDbCopyWith<_UserEntryDataDb> get copyWith;
}
