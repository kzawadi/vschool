import 'package:framy_annotation/framy_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'library_model.g.dart';
part 'library_model.freezed.dart';

@immutable
@freezed
@framyModel
abstract class Classlibrary with _$Classlibrary {
  const factory Classlibrary({
    String standard,
    String division,
    String description,
    String day,
    DateTime createdAt,
    String by,
    List subjects,
  }) = _Classlibrary;

  factory Classlibrary.fromJson(Map<String, dynamic> json) =>
      _$ClasslibraryFromJson(json);
}
