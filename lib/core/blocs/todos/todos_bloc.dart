import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ourESchool/core/blocs/todos/todos_event.dart';
import 'package:ourESchool/core/blocs/todos/todos_state.dart';
import 'package:ourESchool/core/repositories/school_wall/school_wall_repo.dart';



class WallsBloc extends Bloc<WallEvent, WallState> {
  final SchoolWallRepository _wallRepository;
  StreamSubscription _wallsSubscription;

  WallsBloc({@required SchoolWallRepository wallsRepository})
      : assert(wallsRepository != null),
        _wallRepository = wallsRepository;

  @override
  WallState get initialState => WallsLoading();

  @override
  Stream<WallState> mapEventToState(WallEvent event) async* {
    if (event is LoadWalls) {
      yield* _mapLoadWallsToState();
    } else if (event is AddWall) {
      yield* _mapAddWallToState(event);
    } else if (event is UpdateWall) {
      yield* _mapUpdateWallToState(event);
    } else if (event is DeleteWall) {
      yield* _mapDeleteWallToState(event);
    } 
    // else if (event is ToggleAll) {
    //   yield* _mapToggleAllToState();
    // } 
    // else if (event is ClearCompleted) {
    //   yield* _mapClearCompletedToState();
    // } 
    else if (event is WallsUpdated) {
      yield* _mapWallsUpdateToState(event);
    }
  }

  Stream<WallState> _mapLoadWallsToState() async* {
    _wallsSubscription?.cancel();
    _wallsSubscription = _wallRepository.walls().listen(
          (walls) => dispatch(WallsUpdated(walls)),
        );
  }
  Stream<WallState> _mapAddWallToState(AddWall event) async* {
    _wallRepository.addNewWall(event.wall);
  }

  Stream<WallState> _mapUpdateWallToState(UpdateWall event) async* {
    _wallRepository.updateWall(event.updatedWall);
  }

  Stream<WallState> _mapDeleteWallToState(DeleteWall event) async* {
    _wallRepository.deleteWall(event.wall);
  }

  // Stream<WallState> _mapToggleAllToState() async* {
  //   final state = currentState;
  //   if (state is WallLoaded) {
  //     final allComplete = state.walls.every((wall) => wall.complete);
  //     final List<Wall> updatedTodos = state.wall
  //         .map((wall) => wall.copyWith(complete: !allComplete))
  //         .toList();
  //     updatedTodos.forEach((updatedTodo) {
  //       _wallRepository.updateWall(updatedTodo);
  //     });
  //   }
  // }

  // Stream<WallState> _mapClearCompletedToState() async* {
  //   final state = currentState;
  //   if (state is WallLoaded) {
  //     final List<Wall> completedWalls =
  //         state.wall.where((wall) => wall.complete).toList();
  //     completedWalls.forEach((completedWall) {
  //       _wallRepository.deleteWall(completedWalls);
  //     });
  //   }
  // }

  Stream<WallState> _mapWallsUpdateToState(WallsUpdated event) async* {
    yield WallLoaded(event.walls);
  }
}
