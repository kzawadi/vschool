// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connections.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Connections _$ConnectionsFromJson(Map<String, dynamic> json) {
  return _Connections.fromJson(json);
}

abstract class _$Connections {
  String get name;

  Connections copyWith({String name});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Connections with DiagnosticableTreeMixin implements _Connections {
  const _$_Connections({this.name});

  factory _$_Connections.fromJson(Map<String, dynamic> json) =>
      _$_$_ConnectionsFromJson(json);

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'Connections(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Connections'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Connections &&
        (identical(other.name, name) || other.name == name);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode;

  @override
  _$_Connections copyWith({
    Object name = immutable,
  }) {
    return _$_Connections(
      name: name == immutable ? this.name : name as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConnectionsToJson(this);
  }
}

abstract class _Connections implements Connections {
  const factory _Connections({String name}) = _$_Connections;

  factory _Connections.fromJson(Map<String, dynamic> json) =
      _$_Connections.fromJson;

  @override
  String get name;

  @override
  _Connections copyWith({String name});
}
