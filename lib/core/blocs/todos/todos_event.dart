import 'package:equatable/equatable.dart';
import 'package:ourESchool/core/Models/school_wall/school_wall_model.dart';

abstract class WallEvent extends Equatable {
  const WallEvent();

  @override
  List<Object> get props => [];
}

class LoadWalls extends WallEvent {}

class AddWall extends WallEvent {
  final Wall wall;

  const AddWall(this.wall);

  @override
  List<Object> get props => [wall];

  @override
  String toString() => 'AddWall { wall: $wall }';
}

class UpdateWall extends WallEvent {
  final Wall updatedWall;

  const UpdateWall(this.updatedWall);

  @override
  List<Object> get props => [updatedWall];

  @override
  String toString() => 'UpdateWall { updatedWall: $updatedWall }';
}

class DeleteWall extends WallEvent {
  final Wall wall;

  const DeleteWall(this.wall);

  @override
  List<Object> get props => [wall];

  @override
  String toString() => 'DeleteWall { wall: $wall }';
}

class ClearCompleted extends WallEvent {}

class ToggleAll extends WallEvent {}

class WallsUpdated extends WallEvent {
  final List<Wall> walls;

  const WallsUpdated(this.walls);

  @override
  List<Object> get props => [walls];
}
