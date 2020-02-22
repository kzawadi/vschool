
// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ourESchool/core/models/school_wall_model/school_wall_model.dart';
// import 'package:ourESchool/core/repositories/school_wall/school_wall_repo.dart';

// class SchoolWallRepo implements SchoolWallRepository {
//   final wallCollection = Firestore.instance.collection('schoolwalls');

//   @override
//   Future<void> addNewWall(SchoolWall wall) {
//     return wallCollection.add(wall.toJson());
//   }

//   @override
//   Future<void> deleteWall(SchoolWall wall) {
//     return wallCollection.document(wall.id).delete();
//   }

//   @override
//   Stream<List<SchoolWall>> walls() {
//     return wallCollection.snapshots()
//     .map((snapshot) {
//       return snapshot.documents
//           .map((doc) => SchoolWall.fromJson(doc))
//           .toList();
//     });
   
  
//   }

//   @override
//   Future<void> updateWall(SchoolWall update) {
//     return wallCollection
//     .document(update.id)
//     .updateData(update.toJson());
//   }

// }
