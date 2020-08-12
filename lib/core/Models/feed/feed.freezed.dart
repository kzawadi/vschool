// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Feed _$FeedFromJson(Map<String, dynamic> json) {
  return _Feed.fromJson(json);
}

class _$FeedTearOff {
  const _$FeedTearOff();

  _Feed call(
      {String caption,
      String by,
      String forDiv,
      String forClass,
      String photoUrl,
      String photoPath,
      AnnouncementType type,
      String id}) {
    return _Feed(
      caption: caption,
      by: by,
      forDiv: forDiv,
      forClass: forClass,
      photoUrl: photoUrl,
      photoPath: photoPath,
      type: type,
      id: id,
    );
  }
}

// ignore: unused_element
const $Feed = _$FeedTearOff();

mixin _$Feed {
  String get caption;
  String get by;
  String get forDiv;
  String get forClass;
  String get photoUrl;
  String get photoPath;
  AnnouncementType get type;
  String get id;

  Map<String, dynamic> toJson();
  $FeedCopyWith<Feed> get copyWith;
}

abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res>;
  $Res call(
      {String caption,
      String by,
      String forDiv,
      String forClass,
      String photoUrl,
      String photoPath,
      AnnouncementType type,
      String id});
}

class _$FeedCopyWithImpl<$Res> implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  final Feed _value;
  // ignore: unused_field
  final $Res Function(Feed) _then;

  @override
  $Res call({
    Object caption = freezed,
    Object by = freezed,
    Object forDiv = freezed,
    Object forClass = freezed,
    Object photoUrl = freezed,
    Object photoPath = freezed,
    Object type = freezed,
    Object id = freezed,
  }) {
    return _then(_value.copyWith(
      caption: caption == freezed ? _value.caption : caption as String,
      by: by == freezed ? _value.by : by as String,
      forDiv: forDiv == freezed ? _value.forDiv : forDiv as String,
      forClass: forClass == freezed ? _value.forClass : forClass as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      photoPath: photoPath == freezed ? _value.photoPath : photoPath as String,
      type: type == freezed ? _value.type : type as AnnouncementType,
      id: id == freezed ? _value.id : id as String,
    ));
  }
}

abstract class _$FeedCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$FeedCopyWith(_Feed value, $Res Function(_Feed) then) =
      __$FeedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String caption,
      String by,
      String forDiv,
      String forClass,
      String photoUrl,
      String photoPath,
      AnnouncementType type,
      String id});
}

class __$FeedCopyWithImpl<$Res> extends _$FeedCopyWithImpl<$Res>
    implements _$FeedCopyWith<$Res> {
  __$FeedCopyWithImpl(_Feed _value, $Res Function(_Feed) _then)
      : super(_value, (v) => _then(v as _Feed));

  @override
  _Feed get _value => super._value as _Feed;

  @override
  $Res call({
    Object caption = freezed,
    Object by = freezed,
    Object forDiv = freezed,
    Object forClass = freezed,
    Object photoUrl = freezed,
    Object photoPath = freezed,
    Object type = freezed,
    Object id = freezed,
  }) {
    return _then(_Feed(
      caption: caption == freezed ? _value.caption : caption as String,
      by: by == freezed ? _value.by : by as String,
      forDiv: forDiv == freezed ? _value.forDiv : forDiv as String,
      forClass: forClass == freezed ? _value.forClass : forClass as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      photoPath: photoPath == freezed ? _value.photoPath : photoPath as String,
      type: type == freezed ? _value.type : type as AnnouncementType,
      id: id == freezed ? _value.id : id as String,
    ));
  }
}

@JsonSerializable()
class _$_Feed with DiagnosticableTreeMixin implements _Feed {
  const _$_Feed(
      {this.caption,
      this.by,
      this.forDiv,
      this.forClass,
      this.photoUrl,
      this.photoPath,
      this.type,
      this.id});

  factory _$_Feed.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedFromJson(json);

  @override
  final String caption;
  @override
  final String by;
  @override
  final String forDiv;
  @override
  final String forClass;
  @override
  final String photoUrl;
  @override
  final String photoPath;
  @override
  final AnnouncementType type;
  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Feed(caption: $caption, by: $by, forDiv: $forDiv, forClass: $forClass, photoUrl: $photoUrl, photoPath: $photoPath, type: $type, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Feed'))
      ..add(DiagnosticsProperty('caption', caption))
      ..add(DiagnosticsProperty('by', by))
      ..add(DiagnosticsProperty('forDiv', forDiv))
      ..add(DiagnosticsProperty('forClass', forClass))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('photoPath', photoPath))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Feed &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality()
                    .equals(other.caption, caption)) &&
            (identical(other.by, by) ||
                const DeepCollectionEquality().equals(other.by, by)) &&
            (identical(other.forDiv, forDiv) ||
                const DeepCollectionEquality().equals(other.forDiv, forDiv)) &&
            (identical(other.forClass, forClass) ||
                const DeepCollectionEquality()
                    .equals(other.forClass, forClass)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.photoPath, photoPath) ||
                const DeepCollectionEquality()
                    .equals(other.photoPath, photoPath)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(by) ^
      const DeepCollectionEquality().hash(forDiv) ^
      const DeepCollectionEquality().hash(forClass) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(photoPath) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id);

  @override
  _$FeedCopyWith<_Feed> get copyWith =>
      __$FeedCopyWithImpl<_Feed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedToJson(this);
  }
}

abstract class _Feed implements Feed {
  const factory _Feed(
      {String caption,
      String by,
      String forDiv,
      String forClass,
      String photoUrl,
      String photoPath,
      AnnouncementType type,
      String id}) = _$_Feed;

  factory _Feed.fromJson(Map<String, dynamic> json) = _$_Feed.fromJson;

  @override
  String get caption;
  @override
  String get by;
  @override
  String get forDiv;
  @override
  String get forClass;
  @override
  String get photoUrl;
  @override
  String get photoPath;
  @override
  AnnouncementType get type;
  @override
  String get id;
  @override
  _$FeedCopyWith<_Feed> get copyWith;
}
