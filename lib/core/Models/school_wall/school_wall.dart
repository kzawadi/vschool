import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';



part 'school_wall.g.dart';
part 'school_wall.freezed.dart';

@immutable
abstract class SchoolWall with _$SchoolWall{
  const factory SchoolWall({String name, String mission, String history, String location}) = _SchoolWall;

  factory SchoolWall.fromJson(Map<String, dynamic> json) => _$SchoolWallFromJson(json);
}