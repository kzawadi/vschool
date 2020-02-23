import 'package:equatable/equatable.dart';
import 'package:ourESchool/core/Models/school_wall/school_wall_model.dart';

abstract class WallState extends Equatable {
  const WallState();

  @override
  List<Object> get props => [];
}

class WallsLoading extends WallState {}

class WallLoaded extends WallState {
  final List<Wall> walls;

  const WallLoaded([this.walls = const []]);

  @override
  List<Object> get props => [walls];

  @override
  String toString() => 'WallLoaded { walls: $walls }';
}

class WallNotLoaded extends WallState {}
