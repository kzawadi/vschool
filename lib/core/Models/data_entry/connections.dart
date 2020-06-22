import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'connections.freezed.dart';
part 'connections.g.dart';

@immutable
abstract class Connections with _$Connections {
  const factory Connections({String name}) = _Connections;
  factory Connections.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsFromJson(json);
}
