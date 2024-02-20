import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:ourESchool/core/enums/fees.dart';

@framyModel
class Fees {
  String description;
  String due;
  String paid;
  Timestamp timestamp;
  String to;
  String totalFees;

  /// for now its just there fro rapid replacement
  String photoPath;
  String id;
  FeesType type;

  Fees({
    this.description = '',
    this.due,
    this.paid,
    this.timestamp,
    this.to,
    this.totalFees = '',
    this.photoPath = '',
    this.id,
    this.type,
  });

  Fees.fromJson(Map<String, dynamic> json) {
    description = json['description'] ?? '';
    due = json['due'];
    paid = json['paid'];
    timestamp = json['timestamp'] as Timestamp;
    to = json['to'];
    totalFees = json['totalFees'] ?? '';
    photoPath = json['photoPath'] ?? '';
    id = json['id'];
    type = FeesTypeHelper.getEnum(json['type']);
  }

  Fees.fromSnapshot(DocumentSnapshot snapshot) {
    description = snapshot.data()['description'].toString() ?? '';
    due = snapshot.data()['due'].toString();
    paid = snapshot.data()['paid'].toString();
    timestamp = snapshot.data()['timeStamp'] as Timestamp;
    to = snapshot.data()['to'].toString();
    totalFees = snapshot.data()['totalFees'].toString() ?? '';
    photoPath = snapshot.data()['photoPath'].toString() ?? '';
    type = FeesTypeHelper.getEnum(snapshot.data()['type'].toString());
    id = snapshot.id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['due'] = this.due;
    data['paid'] = this.paid;
    data['timestamp'] = this.timestamp;
    data['to'] = this.to;
    data['totalFees'] = this.totalFees;
    data['type'] = FeesTypeHelper.getValue(this.type);
    data['photoPath'] = this.photoPath;
    // data['id'] = this.id;
    return data;
  }
}
