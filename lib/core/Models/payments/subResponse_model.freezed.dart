// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'subResponse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SubscriptionResponse _$SubscriptionResponseFromJson(Map<String, dynamic> json) {
  return _SubscriptionResponse.fromJson(json);
}

/// @nodoc
class _$SubscriptionResponseTearOff {
  const _$SubscriptionResponseTearOff();

// ignore: unused_element
  _SubscriptionResponse call(
      {String responseCode, String output_ResponseDesc}) {
    return _SubscriptionResponse(
      responseCode: responseCode,
      output_ResponseDesc: output_ResponseDesc,
    );
  }

// ignore: unused_element
  SubscriptionResponse fromJson(Map<String, Object> json) {
    return SubscriptionResponse.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SubscriptionResponse = _$SubscriptionResponseTearOff();

/// @nodoc
mixin _$SubscriptionResponse {
  String get responseCode;
  String get output_ResponseDesc;

  Map<String, dynamic> toJson();
  $SubscriptionResponseCopyWith<SubscriptionResponse> get copyWith;
}

/// @nodoc
abstract class $SubscriptionResponseCopyWith<$Res> {
  factory $SubscriptionResponseCopyWith(SubscriptionResponse value,
          $Res Function(SubscriptionResponse) then) =
      _$SubscriptionResponseCopyWithImpl<$Res>;
  $Res call({String responseCode, String output_ResponseDesc});
}

/// @nodoc
class _$SubscriptionResponseCopyWithImpl<$Res>
    implements $SubscriptionResponseCopyWith<$Res> {
  _$SubscriptionResponseCopyWithImpl(this._value, this._then);

  final SubscriptionResponse _value;
  // ignore: unused_field
  final $Res Function(SubscriptionResponse) _then;

  @override
  $Res call({
    Object responseCode = freezed,
    Object output_ResponseDesc = freezed,
  }) {
    return _then(_value.copyWith(
      responseCode: responseCode == freezed
          ? _value.responseCode
          : responseCode as String,
      output_ResponseDesc: output_ResponseDesc == freezed
          ? _value.output_ResponseDesc
          : output_ResponseDesc as String,
    ));
  }
}

/// @nodoc
abstract class _$SubscriptionResponseCopyWith<$Res>
    implements $SubscriptionResponseCopyWith<$Res> {
  factory _$SubscriptionResponseCopyWith(_SubscriptionResponse value,
          $Res Function(_SubscriptionResponse) then) =
      __$SubscriptionResponseCopyWithImpl<$Res>;
  @override
  $Res call({String responseCode, String output_ResponseDesc});
}

/// @nodoc
class __$SubscriptionResponseCopyWithImpl<$Res>
    extends _$SubscriptionResponseCopyWithImpl<$Res>
    implements _$SubscriptionResponseCopyWith<$Res> {
  __$SubscriptionResponseCopyWithImpl(
      _SubscriptionResponse _value, $Res Function(_SubscriptionResponse) _then)
      : super(_value, (v) => _then(v as _SubscriptionResponse));

  @override
  _SubscriptionResponse get _value => super._value as _SubscriptionResponse;

  @override
  $Res call({
    Object responseCode = freezed,
    Object output_ResponseDesc = freezed,
  }) {
    return _then(_SubscriptionResponse(
      responseCode: responseCode == freezed
          ? _value.responseCode
          : responseCode as String,
      output_ResponseDesc: output_ResponseDesc == freezed
          ? _value.output_ResponseDesc
          : output_ResponseDesc as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SubscriptionResponse
    with DiagnosticableTreeMixin
    implements _SubscriptionResponse {
  const _$_SubscriptionResponse({this.responseCode, this.output_ResponseDesc});

  factory _$_SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_SubscriptionResponseFromJson(json);

  @override
  final String responseCode;
  @override
  final String output_ResponseDesc;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscriptionResponse(responseCode: $responseCode, output_ResponseDesc: $output_ResponseDesc)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubscriptionResponse'))
      ..add(DiagnosticsProperty('responseCode', responseCode))
      ..add(DiagnosticsProperty('output_ResponseDesc', output_ResponseDesc));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubscriptionResponse &&
            (identical(other.responseCode, responseCode) ||
                const DeepCollectionEquality()
                    .equals(other.responseCode, responseCode)) &&
            (identical(other.output_ResponseDesc, output_ResponseDesc) ||
                const DeepCollectionEquality()
                    .equals(other.output_ResponseDesc, output_ResponseDesc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(responseCode) ^
      const DeepCollectionEquality().hash(output_ResponseDesc);

  @override
  _$SubscriptionResponseCopyWith<_SubscriptionResponse> get copyWith =>
      __$SubscriptionResponseCopyWithImpl<_SubscriptionResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubscriptionResponseToJson(this);
  }
}

abstract class _SubscriptionResponse implements SubscriptionResponse {
  const factory _SubscriptionResponse(
      {String responseCode,
      String output_ResponseDesc}) = _$_SubscriptionResponse;

  factory _SubscriptionResponse.fromJson(Map<String, dynamic> json) =
      _$_SubscriptionResponse.fromJson;

  @override
  String get responseCode;
  @override
  String get output_ResponseDesc;
  @override
  _$SubscriptionResponseCopyWith<_SubscriptionResponse> get copyWith;
}
