import 'dart:async';

import 'package:ourESchool/core/Models/school_wall/school_wall_model.dart';

abstract class SchoolWallRepository {
  Future<void> addNewWall(Wall wall);

  Future<void> deleteWall(Wall wall);

  Stream<List<Wall>> walls();

  Future<void> updateWall(Wall wall);
}
