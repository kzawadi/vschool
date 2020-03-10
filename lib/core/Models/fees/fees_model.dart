import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/enums/fees.dart';

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
    description = snapshot['description'].toString() ?? '';
    due = snapshot['due'].toString();
    paid = snapshot['paid'].toString();
    timestamp = snapshot['timeStamp'] as Timestamp;
    to = snapshot['to'].toString();
    totalFees = snapshot['totalFees'].toString() ?? '';
    photoPath = snapshot['photoPath'].toString() ?? '';
    type = FeesTypeHelper.getEnum(snapshot['type'].toString());
    id = snapshot.documentID;
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
