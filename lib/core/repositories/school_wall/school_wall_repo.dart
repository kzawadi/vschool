import 'dart:async';

import 'package:ourESchool/core/models/school_wall_model/school_wall_model.dart';

abstract class SchoolWallRepository {
  Future<void> addNewTodo(SchoolWall wall);

  Future<void> deleteTodo(SchoolWall wall);

  Stream<List<SchoolWall>> todos();

  Future<void> updateTodo(SchoolWall wall);
}
