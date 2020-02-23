import 'package:meta/meta.dart';
import 'package:ourESchool/core/entities/school_wall/school_wall_entity.dart';


@immutable
class Wall {
  final String id;
  final String note;
  final String task;

  Wall(this.task, {String note = '', String id})
      : this.note = note ?? '',
        this.id = id;

  Wall copyWith({bool complete, String id, String note, String task}) {
    return Wall(
      task ?? this.task,
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  @override
  int get hashCode =>
      task.hashCode ^ note.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Wall &&
          runtimeType == other.runtimeType &&
          task == other.task &&
          note == other.note &&
          id == other.id;

  @override
  String toString() {
    return 'Wall{task: $task, note: $note, id: $id}';
  }

  WallEntity toEntity() {
    return WallEntity(task, id, note);
  }

  static Wall fromEntity(WallEntity entity) {
    return Wall(
      entity.name,
      note: entity.mission,
      id: entity.id,
    );
  }
}
