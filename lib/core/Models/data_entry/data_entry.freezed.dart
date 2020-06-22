// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

UserEntryData _$UserEntryDataFromJson(Map<String, dynamic> json) {
  return _UserEntryData.fromJson(json);
}

abstract class _$UserEntryData {
  String get name;
  int get age;
  List<Connections> get connection;

  UserEntryData copyWith({String name, int age, List<Connections> connection});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_UserEntryData with DiagnosticableTreeMixin implements _UserEntryData {
  const _$_UserEntryData({this.name, this.age, this.connection});

  factory _$_UserEntryData.fromJson(Map<String, dynamic> json) =>
      _$_$_UserEntryDataFromJson(json);

  @override
  final String name;
  @override
  final int age;
  @override
  final List<Connections> connection;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'UserEntryData(name: $name, age: $age, connection: $connection)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEntryData'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('connection', connection));
  }

  @override
  bool operator ==(dynamic other) {
    return other is _UserEntryData &&
        (identical(other.name, name) || other.name == name) &&
        (identical(other.age, age) || other.age == age) &&
        (identical(other.connection, connection) ||
            other.connection == connection);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ name.hashCode ^ age.hashCode ^ connection.hashCode;

  @override
  _$_UserEntryData copyWith({
    Object name = immutable,
    Object age = immutable,
    Object connection = immutable,
  }) {
    return _$_UserEntryData(
      name: name == immutable ? this.name : name as String,
      age: age == immutable ? this.age : age as int,
      connection: connection == immutable
          ? this.connection
          : connection as List<Connections>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserEntryDataToJson(this);
  }
}

abstract class _UserEntryData implements UserEntryData {
  const factory _UserEntryData(
      {String name, int age, List<Connections> connection}) = _$_UserEntryData;

  factory _UserEntryData.fromJson(Map<String, dynamic> json) =
      _$_UserEntryData.fromJson;

  @override
  String get name;
  @override
  int get age;
  @override
  List<Connections> get connection;

  @override
  _UserEntryData copyWith({String name, int age, List<Connections> connection});
}
