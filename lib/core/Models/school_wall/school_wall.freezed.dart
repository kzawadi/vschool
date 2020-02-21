// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_wall.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

SchoolWall _$SchoolWallFromJson(Map<String, dynamic> json) {
  return _SchoolWall.fromJson(json);
}

abstract class _$SchoolWall {
  String get name;
  String get mission;
  String get history;
  String get location;

  SchoolWall copyWith(
      {String name, String mission, String history, String location});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_SchoolWall implements _SchoolWall {
  const _$_SchoolWall({this.name, this.mission, this.history, this.location});

  factory _$_SchoolWall.fromJson(Map<String, dynamic> json) =>
      _$_$_SchoolWallFromJson(json);

  @override
  final String name;
  @override
  final String mission;
  @override
  final String history;
  @override
  final String location;

  @override
  String toString() {
    return 'SchoolWall(name: $name, mission: $mission, history: $history, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _SchoolWall &&
        (identical(other.name, name) || other.name == name) &&
        (identical(other.mission, mission) || other.mission == mission) &&
        (identical(other.history, history) || other.history == history) &&
        (identical(other.location, location) || other.location == location);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      name.hashCode ^
      mission.hashCode ^
      history.hashCode ^
      location.hashCode;

  @override
  _$_SchoolWall copyWith({
    Object name = immutable,
    Object mission = immutable,
    Object history = immutable,
    Object location = immutable,
  }) {
    return _$_SchoolWall(
      name: name == immutable ? this.name : name as String,
      mission: mission == immutable ? this.mission : mission as String,
      history: history == immutable ? this.history : history as String,
      location: location == immutable ? this.location : location as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SchoolWallToJson(this);
  }
}

abstract class _SchoolWall implements SchoolWall {
  const factory _SchoolWall(
      {String name,
      String mission,
      String history,
      String location}) = _$_SchoolWall;

  factory _SchoolWall.fromJson(Map<String, dynamic> json) =
      _$_SchoolWall.fromJson;

  @override
  String get name;
  @override
  String get mission;
  @override
  String get history;
  @override
  String get location;

  @override
  _SchoolWall copyWith(
      {String name, String mission, String history, String location});
}
