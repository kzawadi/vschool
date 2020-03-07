import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/enums/fees.dart';

class Fees {
  String caption;
  String by;
  String forDiv;
  Timestamp timestamp;
  String forClass;
  String totalFees;

  /// for now its just there fro rapid replacement
  String photoPath;
  String id;
  FeesType type;

  Fees({
    this.caption = '',
    this.by,
    this.forDiv,
    this.timestamp,
    this.forClass,
    this.totalFees = '',
    this.photoPath = '',
    this.id,
    this.type,
  });

  Fees.fromJson(Map<String, dynamic> json) {
    caption = json['caption'] ?? '';
    by = json['by'];
    forDiv = json['forDiv'];
    timestamp = json['timestamp'] as Timestamp;
    forClass = json['forClass'];
    totalFees = json['totalFees'] ?? '';
    photoPath = json['photoPath'] ?? '';
    id = json['id'];
    type = FeesTypeHelper.getEnum(json['type']);
  }

  Fees.fromSnapshot(DocumentSnapshot snapshot) {
    caption = snapshot['caption'].toString() ?? '';
    by = snapshot['by'].toString();
    forDiv = snapshot['forDiv'].toString();
    timestamp = snapshot['timeStamp'] as Timestamp;
    forClass = snapshot['forClass'].toString();
    totalFees = snapshot['totalFees'].toString() ?? '';
    photoPath = snapshot['photoPath'].toString() ?? '';
    type = FeesTypeHelper.getEnum(snapshot['type'].toString());
    id = snapshot.documentID;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['by'] = this.by;
    data['forDiv'] = this.forDiv;
    data['timestamp'] = this.timestamp;
    data['forClass'] = this.forClass;
    data['totalFees'] = this.totalFees;
    data['type'] = FeesTypeHelper.getValue(this.type);
    data['photoPath'] = this.photoPath;
    // data['id'] = this.id;
    return data;
  }
}
