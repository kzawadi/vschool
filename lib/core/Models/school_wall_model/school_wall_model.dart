import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'school_wall_model.freezed.dart';
part 'school_wall_model.g.dart';

@immutable
abstract class SchoolWall with _$SchoolWall{
  const factory SchoolWall(String name, String mission, String history, String location,String id) = _SchoolWall;
  factory SchoolWall.fromJson(Map<String, dynamic> json) => _$SchoolWallFromJson(json);
}