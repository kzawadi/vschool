// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'library_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Classlibrary _$ClasslibraryFromJson(Map<String, dynamic> json) {
  return _Classlibrary.fromJson(json);
}

/// @nodoc
class _$ClasslibraryTearOff {
  const _$ClasslibraryTearOff();

// ignore: unused_element
  _Classlibrary call(
      {String standard,
      String division,
      String description,
      String day,
      DateTime createdAt,
      String by,
      List<dynamic> subjects}) {
    return _Classlibrary(
      standard: standard,
      division: division,
      description: description,
      day: day,
      createdAt: createdAt,
      by: by,
      subjects: subjects,
    );
  }

// ignore: unused_element
  Classlibrary fromJson(Map<String, Object> json) {
    return Classlibrary.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Classlibrary = _$ClasslibraryTearOff();

/// @nodoc
mixin _$Classlibrary {
  String get standard;
  String get division;
  String get description;
  String get day;
  DateTime get createdAt;
  String get by;
  List<dynamic> get subjects;

  Map<String, dynamic> toJson();
  $ClasslibraryCopyWith<Classlibrary> get copyWith;
}

/// @nodoc
abstract class $ClasslibraryCopyWith<$Res> {
  factory $ClasslibraryCopyWith(
          Classlibrary value, $Res Function(Classlibrary) then) =
      _$ClasslibraryCopyWithImpl<$Res>;
  $Res call(
      {String standard,
      String division,
      String description,
      String day,
      DateTime createdAt,
      String by,
      List<dynamic> subjects});
}

/// @nodoc
class _$ClasslibraryCopyWithImpl<$Res> implements $ClasslibraryCopyWith<$Res> {
  _$ClasslibraryCopyWithImpl(this._value, this._then);

  final Classlibrary _value;
  // ignore: unused_field
  final $Res Function(Classlibrary) _then;

  @override
  $Res call({
    Object standard = freezed,
    Object division = freezed,
    Object description = freezed,
    Object day = freezed,
    Object createdAt = freezed,
    Object by = freezed,
    Object subjects = freezed,
  }) {
    return _then(_value.copyWith(
      standard: standard == freezed ? _value.standard : standard as String,
      division: division == freezed ? _value.division : division as String,
      description:
          description == freezed ? _value.description : description as String,
      day: day == freezed ? _value.day : day as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      by: by == freezed ? _value.by : by as String,
      subjects:
          subjects == freezed ? _value.subjects : subjects as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$ClasslibraryCopyWith<$Res>
    implements $ClasslibraryCopyWith<$Res> {
  factory _$ClasslibraryCopyWith(
          _Classlibrary value, $Res Function(_Classlibrary) then) =
      __$ClasslibraryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String standard,
      String division,
      String description,
      String day,
      DateTime createdAt,
      String by,
      List<dynamic> subjects});
}

/// @nodoc
class __$ClasslibraryCopyWithImpl<$Res> extends _$ClasslibraryCopyWithImpl<$Res>
    implements _$ClasslibraryCopyWith<$Res> {
  __$ClasslibraryCopyWithImpl(
      _Classlibrary _value, $Res Function(_Classlibrary) _then)
      : super(_value, (v) => _then(v as _Classlibrary));

  @override
  _Classlibrary get _value => super._value as _Classlibrary;

  @override
  $Res call({
    Object standard = freezed,
    Object division = freezed,
    Object description = freezed,
    Object day = freezed,
    Object createdAt = freezed,
    Object by = freezed,
    Object subjects = freezed,
  }) {
    return _then(_Classlibrary(
      standard: standard == freezed ? _value.standard : standard as String,
      division: division == freezed ? _value.division : division as String,
      description:
          description == freezed ? _value.description : description as String,
      day: day == freezed ? _value.day : day as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      by: by == freezed ? _value.by : by as String,
      subjects:
          subjects == freezed ? _value.subjects : subjects as List<dynamic>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Classlibrary with DiagnosticableTreeMixin implements _Classlibrary {
  const _$_Classlibrary(
      {this.standard,
      this.division,
      this.description,
      this.day,
      this.createdAt,
      this.by,
      this.subjects});

  factory _$_Classlibrary.fromJson(Map<String, dynamic> json) =>
      _$_$_ClasslibraryFromJson(json);

  @override
  final String standard;
  @override
  final String division;
  @override
  final String description;
  @override
  final String day;
  @override
  final DateTime createdAt;
  @override
  final String by;
  @override
  final List<dynamic> subjects;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Classlibrary(standard: $standard, division: $division, description: $description, day: $day, createdAt: $createdAt, by: $by, subjects: $subjects)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Classlibrary'))
      ..add(DiagnosticsProperty('standard', standard))
      ..add(DiagnosticsProperty('division', division))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('by', by))
      ..add(DiagnosticsProperty('subjects', subjects));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Classlibrary &&
            (identical(other.standard, standard) ||
                const DeepCollectionEquality()
                    .equals(other.standard, standard)) &&
            (identical(other.division, division) ||
                const DeepCollectionEquality()
                    .equals(other.division, division)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.by, by) ||
                const DeepCollectionEquality().equals(other.by, by)) &&
            (identical(other.subjects, subjects) ||
                const DeepCollectionEquality()
                    .equals(other.subjects, subjects)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(standard) ^
      const DeepCollectionEquality().hash(division) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(day) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(by) ^
      const DeepCollectionEquality().hash(subjects);

  @override
  _$ClasslibraryCopyWith<_Classlibrary> get copyWith =>
      __$ClasslibraryCopyWithImpl<_Classlibrary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClasslibraryToJson(this);
  }
}

abstract class _Classlibrary implements Classlibrary {
  const factory _Classlibrary(
      {String standard,
      String division,
      String description,
      String day,
      DateTime createdAt,
      String by,
      List<dynamic> subjects}) = _$_Classlibrary;

  factory _Classlibrary.fromJson(Map<String, dynamic> json) =
      _$_Classlibrary.fromJson;

  @override
  String get standard;
  @override
  String get division;
  @override
  String get description;
  @override
  String get day;
  @override
  DateTime get createdAt;
  @override
  String get by;
  @override
  List<dynamic> get subjects;
  @override
  _$ClasslibraryCopyWith<_Classlibrary> get copyWith;
}
