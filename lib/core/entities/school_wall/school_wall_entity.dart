// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class WallEntity extends Equatable {
  final String id;
  final String mission;
  final String name;

  const WallEntity(this.name, this.id, this.mission,);

  Map<String, Object> toJson() {
    return {
      "name": name,
      "mission": mission,
      "id": id,
    };
  }

  @override
  List<Object> get props => [id, mission, name];

  @override
  String toString() {
    return 'WallEntity { name: $name, mission: $mission, id: $id }';
  }

  static WallEntity fromJson(Map<String, Object> json) {
    return WallEntity(
      json["name"] as String,
      json["id"] as String,
      json["mission"] as String,
    );
  }

  static WallEntity fromSnapshot(DocumentSnapshot snap) {
    return WallEntity(
      snap.data['name'],
      snap.documentID,
      snap.data['mission'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "name": name,
      "mission": mission,
    };
  }
}
