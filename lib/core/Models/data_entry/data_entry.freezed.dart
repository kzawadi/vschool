// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'data_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserEntryData _$UserEntryDataFromJson(Map<String, dynamic> json) {
  return _UserEntryData.fromJson(json);
}

class _$UserEntryDataTearOff {
  const _$UserEntryDataTearOff();

  _UserEntryData call(
      {String email, String id, String isATeacher, String childIds}) {
    return _UserEntryData(
      email: email,
      id: id,
      isATeacher: isATeacher,
      childIds: childIds,
    );
  }
}

// ignore: unused_element
const $UserEntryData = _$UserEntryDataTearOff();

mixin _$UserEntryData {
  String get email;
  String get id;
  String get isATeacher;
  String get childIds;

  Map<String, dynamic> toJson();
  $UserEntryDataCopyWith<UserEntryData> get copyWith;
}

abstract class $UserEntryDataCopyWith<$Res> {
  factory $UserEntryDataCopyWith(
          UserEntryData value, $Res Function(UserEntryData) then) =
      _$UserEntryDataCopyWithImpl<$Res>;
  $Res call({String email, String id, String isATeacher, String childIds});
}

class _$UserEntryDataCopyWithImpl<$Res>
    implements $UserEntryDataCopyWith<$Res> {
  _$UserEntryDataCopyWithImpl(this._value, this._then);

  final UserEntryData _value;
  // ignore: unused_field
  final $Res Function(UserEntryData) _then;

  @override
  $Res call({
    Object email = freezed,
    Object id = freezed,
    Object isATeacher = freezed,
    Object childIds = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      id: id == freezed ? _value.id : id as String,
      isATeacher:
          isATeacher == freezed ? _value.isATeacher : isATeacher as String,
      childIds: childIds == freezed ? _value.childIds : childIds as String,
    ));
  }
}

abstract class _$UserEntryDataCopyWith<$Res>
    implements $UserEntryDataCopyWith<$Res> {
  factory _$UserEntryDataCopyWith(
          _UserEntryData value, $Res Function(_UserEntryData) then) =
      __$UserEntryDataCopyWithImpl<$Res>;
  @override
  $Res call({String email, String id, String isATeacher, String childIds});
}

class __$UserEntryDataCopyWithImpl<$Res>
    extends _$UserEntryDataCopyWithImpl<$Res>
    implements _$UserEntryDataCopyWith<$Res> {
  __$UserEntryDataCopyWithImpl(
      _UserEntryData _value, $Res Function(_UserEntryData) _then)
      : super(_value, (v) => _then(v as _UserEntryData));

  @override
  _UserEntryData get _value => super._value as _UserEntryData;

  @override
  $Res call({
    Object email = freezed,
    Object id = freezed,
    Object isATeacher = freezed,
    Object childIds = freezed,
  }) {
    return _then(_UserEntryData(
      email: email == freezed ? _value.email : email as String,
      id: id == freezed ? _value.id : id as String,
      isATeacher:
          isATeacher == freezed ? _value.isATeacher : isATeacher as String,
      childIds: childIds == freezed ? _value.childIds : childIds as String,
    ));
  }
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
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
    return identical(this, other) ||
        (other is _UserEntryData &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isATeacher, isATeacher) ||
                const DeepCollectionEquality()
                    .equals(other.isATeacher, isATeacher)) &&
            (identical(other.childIds, childIds) ||
                const DeepCollectionEquality()
                    .equals(other.childIds, childIds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isATeacher) ^
      const DeepCollectionEquality().hash(childIds);

  @override
  _$UserEntryDataCopyWith<_UserEntryData> get copyWith =>
      __$UserEntryDataCopyWithImpl<_UserEntryData>(this, _$identity);

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
  _$UserEntryDataCopyWith<_UserEntryData> get copyWith;
}
