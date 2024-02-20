import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:framy_annotation/framy_annotation.dart';

class User {
  String email;
  String id;

  bool isTeacher;

  //  Map<String, dynamic> childId;
  var childId;

  User({
    this.email = '',
    this.id = '',
    this.childId = null,
    this.isTeacher = false,
  });

  User.fromSnapshot(DocumentSnapshot documentSnapshot) {
    _fromJson(documentSnapshot.data());
  }

  _fromJson(Map<String, dynamic> json) {
    email = json['email'] ?? '';
    id = json['id'] ?? '';
    isTeacher = json['isTeacher'] ?? false;
    childId = json['childId'] ?? {};
  }

  User.fromJson(Map<String, dynamic> json) {
    _fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['isTeacher'] = this.isTeacher;
    data['childId'] = this.childId;
    return data;
  }
}
