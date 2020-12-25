// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'contribution_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Contribution _$ContributionFromJson(Map<String, dynamic> json) {
  return _Contribution.fromJson(json);
}

/// @nodoc
class _$ContributionTearOff {
  const _$ContributionTearOff();

// ignore: unused_element
  _Contribution call(
      {String amount,
      String contributionId,
      String studentName,
      String parentName,
      bool payed,
      String description,
      String startDate,
      String expireDate,
      String targetClass}) {
    return _Contribution(
      amount: amount,
      contributionId: contributionId,
      studentName: studentName,
      parentName: parentName,
      payed: payed,
      description: description,
      startDate: startDate,
      expireDate: expireDate,
      targetClass: targetClass,
    );
  }

// ignore: unused_element
  Contribution fromJson(Map<String, Object> json) {
    return Contribution.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Contribution = _$ContributionTearOff();

/// @nodoc
mixin _$Contribution {
  String get amount;
  String get contributionId;
  String get studentName;
  String get parentName;
  bool get payed;
  String get description;
  String get startDate;
  String get expireDate;
  String get targetClass;

  Map<String, dynamic> toJson();
  $ContributionCopyWith<Contribution> get copyWith;
}

/// @nodoc
abstract class $ContributionCopyWith<$Res> {
  factory $ContributionCopyWith(
          Contribution value, $Res Function(Contribution) then) =
      _$ContributionCopyWithImpl<$Res>;
  $Res call(
      {String amount,
      String contributionId,
      String studentName,
      String parentName,
      bool payed,
      String description,
      String startDate,
      String expireDate,
      String targetClass});
}

/// @nodoc
class _$ContributionCopyWithImpl<$Res> implements $ContributionCopyWith<$Res> {
  _$ContributionCopyWithImpl(this._value, this._then);

  final Contribution _value;
  // ignore: unused_field
  final $Res Function(Contribution) _then;

  @override
  $Res call({
    Object amount = freezed,
    Object contributionId = freezed,
    Object studentName = freezed,
    Object parentName = freezed,
    Object payed = freezed,
    Object description = freezed,
    Object startDate = freezed,
    Object expireDate = freezed,
    Object targetClass = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed ? _value.amount : amount as String,
      contributionId: contributionId == freezed
          ? _value.contributionId
          : contributionId as String,
      studentName:
          studentName == freezed ? _value.studentName : studentName as String,
      parentName:
          parentName == freezed ? _value.parentName : parentName as String,
      payed: payed == freezed ? _value.payed : payed as bool,
      description:
          description == freezed ? _value.description : description as String,
      startDate: startDate == freezed ? _value.startDate : startDate as String,
      expireDate:
          expireDate == freezed ? _value.expireDate : expireDate as String,
      targetClass:
          targetClass == freezed ? _value.targetClass : targetClass as String,
    ));
  }
}

/// @nodoc
abstract class _$ContributionCopyWith<$Res>
    implements $ContributionCopyWith<$Res> {
  factory _$ContributionCopyWith(
          _Contribution value, $Res Function(_Contribution) then) =
      __$ContributionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String amount,
      String contributionId,
      String studentName,
      String parentName,
      bool payed,
      String description,
      String startDate,
      String expireDate,
      String targetClass});
}

/// @nodoc
class __$ContributionCopyWithImpl<$Res> extends _$ContributionCopyWithImpl<$Res>
    implements _$ContributionCopyWith<$Res> {
  __$ContributionCopyWithImpl(
      _Contribution _value, $Res Function(_Contribution) _then)
      : super(_value, (v) => _then(v as _Contribution));

  @override
  _Contribution get _value => super._value as _Contribution;

  @override
  $Res call({
    Object amount = freezed,
    Object contributionId = freezed,
    Object studentName = freezed,
    Object parentName = freezed,
    Object payed = freezed,
    Object description = freezed,
    Object startDate = freezed,
    Object expireDate = freezed,
    Object targetClass = freezed,
  }) {
    return _then(_Contribution(
      amount: amount == freezed ? _value.amount : amount as String,
      contributionId: contributionId == freezed
          ? _value.contributionId
          : contributionId as String,
      studentName:
          studentName == freezed ? _value.studentName : studentName as String,
      parentName:
          parentName == freezed ? _value.parentName : parentName as String,
      payed: payed == freezed ? _value.payed : payed as bool,
      description:
          description == freezed ? _value.description : description as String,
      startDate: startDate == freezed ? _value.startDate : startDate as String,
      expireDate:
          expireDate == freezed ? _value.expireDate : expireDate as String,
      targetClass:
          targetClass == freezed ? _value.targetClass : targetClass as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Contribution with DiagnosticableTreeMixin implements _Contribution {
  const _$_Contribution(
      {this.amount,
      this.contributionId,
      this.studentName,
      this.parentName,
      this.payed,
      this.description,
      this.startDate,
      this.expireDate,
      this.targetClass});

  factory _$_Contribution.fromJson(Map<String, dynamic> json) =>
      _$_$_ContributionFromJson(json);

  @override
  final String amount;
  @override
  final String contributionId;
  @override
  final String studentName;
  @override
  final String parentName;
  @override
  final bool payed;
  @override
  final String description;
  @override
  final String startDate;
  @override
  final String expireDate;
  @override
  final String targetClass;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Contribution(amount: $amount, contributionId: $contributionId, studentName: $studentName, parentName: $parentName, payed: $payed, description: $description, startDate: $startDate, expireDate: $expireDate, targetClass: $targetClass)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Contribution'))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('contributionId', contributionId))
      ..add(DiagnosticsProperty('studentName', studentName))
      ..add(DiagnosticsProperty('parentName', parentName))
      ..add(DiagnosticsProperty('payed', payed))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('expireDate', expireDate))
      ..add(DiagnosticsProperty('targetClass', targetClass));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Contribution &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.contributionId, contributionId) ||
                const DeepCollectionEquality()
                    .equals(other.contributionId, contributionId)) &&
            (identical(other.studentName, studentName) ||
                const DeepCollectionEquality()
                    .equals(other.studentName, studentName)) &&
            (identical(other.parentName, parentName) ||
                const DeepCollectionEquality()
                    .equals(other.parentName, parentName)) &&
            (identical(other.payed, payed) ||
                const DeepCollectionEquality().equals(other.payed, payed)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.expireDate, expireDate) ||
                const DeepCollectionEquality()
                    .equals(other.expireDate, expireDate)) &&
            (identical(other.targetClass, targetClass) ||
                const DeepCollectionEquality()
                    .equals(other.targetClass, targetClass)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(contributionId) ^
      const DeepCollectionEquality().hash(studentName) ^
      const DeepCollectionEquality().hash(parentName) ^
      const DeepCollectionEquality().hash(payed) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(expireDate) ^
      const DeepCollectionEquality().hash(targetClass);

  @override
  _$ContributionCopyWith<_Contribution> get copyWith =>
      __$ContributionCopyWithImpl<_Contribution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContributionToJson(this);
  }
}

abstract class _Contribution implements Contribution {
  const factory _Contribution(
      {String amount,
      String contributionId,
      String studentName,
      String parentName,
      bool payed,
      String description,
      String startDate,
      String expireDate,
      String targetClass}) = _$_Contribution;

  factory _Contribution.fromJson(Map<String, dynamic> json) =
      _$_Contribution.fromJson;

  @override
  String get amount;
  @override
  String get contributionId;
  @override
  String get studentName;
  @override
  String get parentName;
  @override
  bool get payed;
  @override
  String get description;
  @override
  String get startDate;
  @override
  String get expireDate;
  @override
  String get targetClass;
  @override
  _$ContributionCopyWith<_Contribution> get copyWith;
}
