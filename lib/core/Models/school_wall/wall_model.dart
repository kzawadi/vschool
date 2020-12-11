import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:framy_annotation/framy_annotation.dart';

@framyModel
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
  String file1;
  String file2;
  String file3;
  String file4;
  String file5;
  String file6;
  String file7;
  String file8;
  String file9;
  String file10;

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
    this.file1,
    this.file2,
    this.file3,
    this.file4,
    this.file5,
    this.file6,
    this.file7,
    this.file8,
    this.file9,
    this.file10,
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
    file1 = json['file1'];
    file2 = json['file2'];
    file3 = json['file3'];
    file4 = json['file4'];
    file5 = json['file5'];
    file6 = json['file6'];
    file7 = json['file7'];
    file8 = json['file8'];
    file9 = json['file9'];
    file10 = json['file10'];
  }

  Wall.fromSnapshot(DocumentSnapshot snapshot) {
    schoolName = snapshot.data()['schoolName'].toString() ?? '';
    by = snapshot.data()['by'].toString();
    forDiv = snapshot.data()['forDiv'].toString();
    timestamp = snapshot.data()['timeStamp'] as Timestamp;
    forClass = snapshot.data()['forClass'].toString();
    photoUrl = snapshot.data()['photoUrl'].toString() ?? '';
    photoPath = snapshot.data()['photoPath'].toString() ?? '';
    id = snapshot.id;
    mission = snapshot.data()['mission'].toString() ?? '';
    beliefs = snapshot.data()['beliefs'].toString() ?? '';
    history = snapshot.data()['history'].toString() ?? '';
    regNo = snapshot.data()['regNo'].toString() ?? '';
    location = snapshot.data()['location'].toString() ?? '';
    contacts = snapshot.data()['contacts'].toString() ?? '';
    dirSms = snapshot.data()['dirSms'].toString() ?? '';
    file1 = snapshot.data()['file1'].toString() ?? '';
    file2 = snapshot.data()['file2'].toString() ?? '';
    file3 = snapshot.data()['file3'].toString() ?? '';
    file4 = snapshot.data()['file4'].toString() ?? '';
    file5 = snapshot.data()['file5'].toString() ?? '';
    file6 = snapshot.data()['file6'].toString() ?? '';
    file7 = snapshot.data()['file7'].toString() ?? '';
    file8 = snapshot.data()['file8'].toString() ?? '';
    file9 = snapshot.data()['file9'].toString() ?? '';
    file10 = snapshot.data()['file10'].toString() ?? '';
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
    data['file1'] = this.file1;
    data['file2'] = this.file2;
    data['file3'] = this.file3;
    data['file4'] = this.file4;
    data['file5'] = this.file5;
    data['file6'] = this.file6;
    data['file7'] = this.file7;
    data['file8'] = this.file8;
    data['file9'] = this.file9;
    data['file10'] = this.file10;
    return data;
  }
}
