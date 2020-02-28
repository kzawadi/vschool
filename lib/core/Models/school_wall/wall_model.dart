import 'package:cloud_firestore/cloud_firestore.dart';

class Wall {
  String schoolName;
  String by;
  String forDiv;
  Timestamp timestamp;
  String forClass;
  String photoUrl;
  String photoPath;
  String id;
  String mission;
  String beliefs;
  String history;
  String regNo;
  String location;
  String contacts;
  String dirSms;

  Wall({
    this.schoolName = '',
    this.by,
    this.forDiv,
    this.timestamp,
    this.forClass,
    this.photoUrl = '',
    this.photoPath = '',
    this.id,
    this.mission,
    this.beliefs,
    this.history,
    this.regNo,
    this.location,
    this.contacts,
    this.dirSms,
  });

  Wall.fromJson(Map<String, dynamic> json) {
    schoolName = json['schoolName'] ?? '';
    by = json['by'];
    forDiv = json['forDiv'];
    timestamp = json['timestamp'] as Timestamp;
    forClass = json['forClass'];
    photoUrl = json['photoUrl'] ?? '';
    photoPath = json['photoPath'] ?? '';
    id = json['id'];
    mission = json['mission'];
    beliefs = json['beliefs'];
    history = json['history'];
    regNo = json['regNo'];
    location = json['location'];
    contacts = json['contacts'];
    dirSms = json['dirSms'];
  }

  Wall.fromSnapshot(DocumentSnapshot snapshot) {
    schoolName = snapshot['schoolName'].toString() ?? '';
    by = snapshot['by'].toString();
    forDiv = snapshot['forDiv'].toString();
    timestamp = snapshot['timeStamp'] as Timestamp;
    forClass = snapshot['forClass'].toString();
    photoUrl = snapshot['photoUrl'].toString() ?? '';
    photoPath = snapshot['photoPath'].toString() ?? '';
    id = snapshot.documentID;
    mission = snapshot['mission'].toString() ?? '';
    beliefs = snapshot['beliefs'].toString() ?? '';
    history = snapshot['history'].toString() ?? '';
    regNo = snapshot['regNo'].toString() ?? '';
    location = snapshot['location'].toString() ?? '';
    contacts = snapshot['contacts'].toString() ?? '';
    dirSms = snapshot['dirSms'].toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolName'] = this.schoolName;
    data['by'] = this.by;
    data['forDiv'] = this.forDiv;
    // data['timestamp'] = this.timestamp;
    data['forClass'] = this.forClass;
    data['photoUrl'] = this.photoUrl;
    data['photoPath'] = this.photoPath;
    // data['id'] = this.id;
    data['mission'] = this.mission;
    data['beliefs'] = this.beliefs;
    data['history'] = this.history;
    data['regNo'] = this.regNo;
    data['location'] = this.location;
    data['contacts'] = this.contacts;
    data['dirSms'] = this.dirSms;
    return data;
  }
}
