// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'student_data_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StudentEntryData _$StudentEntryDataFromJson(Map<String, dynamic> json) {
  return _StudentEntryData.fromJson(json);
}

class _$StudentEntryDataTearOff {
  const _$StudentEntryDataTearOff();

  _StudentEntryData call(
      {String email, String id, String isATeacher, String parentId}) {
    return _StudentEntryData(
      email: email,
      id: id,
      isATeacher: isATeacher,
      parentId: parentId,
    );
  }
}

// ignore: unused_element
const $StudentEntryData = _$StudentEntryDataTearOff();

mixin _$StudentEntryData {
  String get email;
  String get id;
  String get isATeacher;
  String get parentId;

  Map<String, dynamic> toJson();
  $StudentEntryDataCopyWith<StudentEntryData> get copyWith;
}

abstract class $StudentEntryDataCopyWith<$Res> {
  factory $StudentEntryDataCopyWith(
          StudentEntryData value, $Res Function(StudentEntryData) then) =
      _$StudentEntryDataCopyWithImpl<$Res>;
  $Res call({String email, String id, String isATeacher, String parentId});
}

class _$StudentEntryDataCopyWithImpl<$Res>
    implements $StudentEntryDataCopyWith<$Res> {
  _$StudentEntryDataCopyWithImpl(this._value, this._then);

  final StudentEntryData _value;
  // ignore: unused_field
  final $Res Function(StudentEntryData) _then;

  @override
  $Res call({
    Object email = freezed,
    Object id = freezed,
    Object isATeacher = freezed,
    Object parentId = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      id: id == freezed ? _value.id : id as String,
      isATeacher:
          isATeacher == freezed ? _value.isATeacher : isATeacher as String,
      parentId: parentId == freezed ? _value.parentId : parentId as String,
    ));
  }
}

abstract class _$StudentEntryDataCopyWith<$Res>
    implements $StudentEntryDataCopyWith<$Res> {
  factory _$StudentEntryDataCopyWith(
          _StudentEntryData value, $Res Function(_StudentEntryData) then) =
      __$StudentEntryDataCopyWithImpl<$Res>;
  @override
  $Res call({String email, String id, String isATeacher, String parentId});
}

class __$StudentEntryDataCopyWithImpl<$Res>
    extends _$StudentEntryDataCopyWithImpl<$Res>
    implements _$StudentEntryDataCopyWith<$Res> {
  __$StudentEntryDataCopyWithImpl(
      _StudentEntryData _value, $Res Function(_StudentEntryData) _then)
      : super(_value, (v) => _then(v as _StudentEntryData));

  @override
  _StudentEntryData get _value => super._value as _StudentEntryData;

  @override
  $Res call({
    Object email = freezed,
    Object id = freezed,
    Object isATeacher = freezed,
    Object parentId = freezed,
  }) {
    return _then(_StudentEntryData(
      email: email == freezed ? _value.email : email as String,
      id: id == freezed ? _value.id : id as String,
      isATeacher:
          isATeacher == freezed ? _value.isATeacher : isATeacher as String,
      parentId: parentId == freezed ? _value.parentId : parentId as String,
    ));
  }
}

@JsonSerializable()
class _$_StudentEntryData
    with DiagnosticableTreeMixin
    implements _StudentEntryData {
  const _$_StudentEntryData(
      {this.email, this.id, this.isATeacher, this.parentId});

  factory _$_StudentEntryData.fromJson(Map<String, dynamic> json) =>
      _$_$_StudentEntryDataFromJson(json);

  @override
  final String email;
  @override
  final String id;
  @override
  final String isATeacher;
  @override
  final String parentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StudentEntryData(email: $email, id: $id, isATeacher: $isATeacher, parentId: $parentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StudentEntryData'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isATeacher', isATeacher))
      ..add(DiagnosticsProperty('parentId', parentId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StudentEntryData &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isATeacher, isATeacher) ||
                const DeepCollectionEquality()
                    .equals(other.isATeacher, isATeacher)) &&
            (identical(other.parentId, parentId) ||
                const DeepCollectionEquality()
                    .equals(other.parentId, parentId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isATeacher) ^
      const DeepCollectionEquality().hash(parentId);

  @override
  _$StudentEntryDataCopyWith<_StudentEntryData> get copyWith =>
      __$StudentEntryDataCopyWithImpl<_StudentEntryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StudentEntryDataToJson(this);
  }
}

abstract class _StudentEntryData implements StudentEntryData {
  const factory _StudentEntryData(
      {String email,
      String id,
      String isATeacher,
      String parentId}) = _$_StudentEntryData;

  factory _StudentEntryData.fromJson(Map<String, dynamic> json) =
      _$_StudentEntryData.fromJson;

  @override
  String get email;
  @override
  String get id;
  @override
  String get isATeacher;
  @override
  String get parentId;
  @override
  _$StudentEntryDataCopyWith<_StudentEntryData> get copyWith;
}
