
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/models/school_wall_model/school_wall_model.dart';
import 'package:ourESchool/core/repositories/school_wall/school_wall_repo.dart';

class SchoolWallRepo implements SchoolWallRepository {
  final wallCollection = Firestore.instance.collection('schoolwalls');

  @override
  Future<void> addNewTodo(SchoolWall wall) {
    return wallCollection.add(wall.toJson());
  }

  @override
  Future<void> deleteTodo(SchoolWall wall) {
    return wallCollection.document(wall.id).delete();
  }

  @override
  Stream<List<SchoolWall>> todos() {
   
  
  }

  @override
  Future<void> updateTodo(SchoolWall wall) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}
