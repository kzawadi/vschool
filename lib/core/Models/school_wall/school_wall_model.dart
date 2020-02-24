import 'package:meta/meta.dart';
import 'package:ourESchool/core/entities/school_wall/school_wall_entity.dart';


@immutable
class Wall {
  final String id;
  final String mission;
  final String name;

  Wall(this.name, {String mission = '', String id})
      : this.mission = mission ?? '',
        this.id = id;

  Wall copyWith({String id, String mission, String name}) {
    return Wall(
      name ?? this.name,
      id: id ?? this.id,
      mission: mission ?? this.mission,
    );
  }

  @override
  int get hashCode =>
      name.hashCode ^ mission.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Wall &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          mission == other.mission &&
          id == other.id;

  @override
  String toString() {
    return 'Wall{name: $name, mission: $mission, id: $id}';
  }

  WallEntity toEntity() {
    return WallEntity(name, id, mission);
  }

  static Wall fromEntity(WallEntity entity) {
    return Wall(
      entity.name,
      mission: entity.mission,
      id: entity.id,
    );
  }
}
