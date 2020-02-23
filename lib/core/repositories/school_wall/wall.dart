
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/Models/school_wall/school_wall_model.dart';
import 'package:ourESchool/core/entities/school_wall/school_wall_entity.dart';
import 'package:ourESchool/core/repositories/school_wall/school_wall_repo.dart';


class SchoolWallRepo implements SchoolWallRepository {
  final wallCollection = Firestore.instance.collection('Schools')
  .document('India').collection('walls');

  @override
  Future<void> addNewWall(Wall wall) {
    return wallCollection.add(wall.toEntity().toDocument());
  }

  @override
  Future<void> deleteWall(Wall wall) {
    return wallCollection.document(wall.id).delete();
  }

  @override
  Stream<List<Wall>> walls() {
    return wallCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Wall.fromEntity(WallEntity.fromSnapshot(doc)))
          .toList();
    });
  }
  @override
  Future<void> updateWall(Wall update) {
    return wallCollection
    .document(update.id)
    .updateData(update.toEntity().toDocument());
  }

}
