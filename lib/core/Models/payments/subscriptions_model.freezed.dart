// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'subscriptions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return _Subscription.fromJson(json);
}

/// @nodoc
class _$SubscriptionTearOff {
  const _$SubscriptionTearOff();

// ignore: unused_element
  _Subscription call(
      {@required int amount,
      String itemDesc,
      @required String msisdn,
      String school,
      @required String userId,
      String typeOfSubscription,
      String userName}) {
    return _Subscription(
      amount: amount,
      itemDesc: itemDesc,
      msisdn: msisdn,
      school: school,
      userId: userId,
      typeOfSubscription: typeOfSubscription,
      userName: userName,
    );
  }

// ignore: unused_element
  Subscription fromJson(Map<String, Object> json) {
    return Subscription.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Subscription = _$SubscriptionTearOff();

/// @nodoc
mixin _$Subscription {
  int get amount;
  String get itemDesc;
  String get msisdn;
  String get school;
  String get userId;
  String get typeOfSubscription;
  String get userName;

  Map<String, dynamic> toJson();
  $SubscriptionCopyWith<Subscription> get copyWith;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
          Subscription value, $Res Function(Subscription) then) =
      _$SubscriptionCopyWithImpl<$Res>;
  $Res call(
      {int amount,
      String itemDesc,
      String msisdn,
      String school,
      String userId,
      String typeOfSubscription,
      String userName});
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res> implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  final Subscription _value;
  // ignore: unused_field
  final $Res Function(Subscription) _then;

  @override
  $Res call({
    Object amount = freezed,
    Object itemDesc = freezed,
    Object msisdn = freezed,
    Object school = freezed,
    Object userId = freezed,
    Object typeOfSubscription = freezed,
    Object userName = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed ? _value.amount : amount as int,
      itemDesc: itemDesc == freezed ? _value.itemDesc : itemDesc as String,
      msisdn: msisdn == freezed ? _value.msisdn : msisdn as String,
      school: school == freezed ? _value.school : school as String,
      userId: userId == freezed ? _value.userId : userId as String,
      typeOfSubscription: typeOfSubscription == freezed
          ? _value.typeOfSubscription
          : typeOfSubscription as String,
      userName: userName == freezed ? _value.userName : userName as String,
    ));
  }
}

/// @nodoc
abstract class _$SubscriptionCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$SubscriptionCopyWith(
          _Subscription value, $Res Function(_Subscription) then) =
      __$SubscriptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int amount,
      String itemDesc,
      String msisdn,
      String school,
      String userId,
      String typeOfSubscription,
      String userName});
}

/// @nodoc
class __$SubscriptionCopyWithImpl<$Res> extends _$SubscriptionCopyWithImpl<$Res>
    implements _$SubscriptionCopyWith<$Res> {
  __$SubscriptionCopyWithImpl(
      _Subscription _value, $Res Function(_Subscription) _then)
      : super(_value, (v) => _then(v as _Subscription));

  @override
  _Subscription get _value => super._value as _Subscription;

  @override
  $Res call({
    Object amount = freezed,
    Object itemDesc = freezed,
    Object msisdn = freezed,
    Object school = freezed,
    Object userId = freezed,
    Object typeOfSubscription = freezed,
    Object userName = freezed,
  }) {
    return _then(_Subscription(
      amount: amount == freezed ? _value.amount : amount as int,
      itemDesc: itemDesc == freezed ? _value.itemDesc : itemDesc as String,
      msisdn: msisdn == freezed ? _value.msisdn : msisdn as String,
      school: school == freezed ? _value.school : school as String,
      userId: userId == freezed ? _value.userId : userId as String,
      typeOfSubscription: typeOfSubscription == freezed
          ? _value.typeOfSubscription
          : typeOfSubscription as String,
      userName: userName == freezed ? _value.userName : userName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Subscription with DiagnosticableTreeMixin implements _Subscription {
  const _$_Subscription(
      {@required this.amount,
      this.itemDesc,
      @required this.msisdn,
      this.school,
      @required this.userId,
      this.typeOfSubscription,
      this.userName})
      : assert(amount != null),
        assert(msisdn != null),
        assert(userId != null);

  factory _$_Subscription.fromJson(Map<String, dynamic> json) =>
      _$_$_SubscriptionFromJson(json);

  @override
  final int amount;
  @override
  final String itemDesc;
  @override
  final String msisdn;
  @override
  final String school;
  @override
  final String userId;
  @override
  final String typeOfSubscription;
  @override
  final String userName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Subscription(amount: $amount, itemDesc: $itemDesc, msisdn: $msisdn, school: $school, userId: $userId, typeOfSubscription: $typeOfSubscription, userName: $userName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Subscription'))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('itemDesc', itemDesc))
      ..add(DiagnosticsProperty('msisdn', msisdn))
      ..add(DiagnosticsProperty('school', school))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('typeOfSubscription', typeOfSubscription))
      ..add(DiagnosticsProperty('userName', userName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Subscription &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.itemDesc, itemDesc) ||
                const DeepCollectionEquality()
                    .equals(other.itemDesc, itemDesc)) &&
            (identical(other.msisdn, msisdn) ||
                const DeepCollectionEquality().equals(other.msisdn, msisdn)) &&
            (identical(other.school, school) ||
                const DeepCollectionEquality().equals(other.school, school)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.typeOfSubscription, typeOfSubscription) ||
                const DeepCollectionEquality()
                    .equals(other.typeOfSubscription, typeOfSubscription)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(itemDesc) ^
      const DeepCollectionEquality().hash(msisdn) ^
      const DeepCollectionEquality().hash(school) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(typeOfSubscription) ^
      const DeepCollectionEquality().hash(userName);

  @override
  _$SubscriptionCopyWith<_Subscription> get copyWith =>
      __$SubscriptionCopyWithImpl<_Subscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubscriptionToJson(this);
  }
}

abstract class _Subscription implements Subscription {
  const factory _Subscription(
      {@required int amount,
      String itemDesc,
      @required String msisdn,
      String school,
      @required String userId,
      String typeOfSubscription,
      String userName}) = _$_Subscription;

  factory _Subscription.fromJson(Map<String, dynamic> json) =
      _$_Subscription.fromJson;

  @override
  int get amount;
  @override
  String get itemDesc;
  @override
  String get msisdn;
  @override
  String get school;
  @override
  String get userId;
  @override
  String get typeOfSubscription;
  @override
  String get userName;
  @override
  _$SubscriptionCopyWith<_Subscription> get copyWith;
}
