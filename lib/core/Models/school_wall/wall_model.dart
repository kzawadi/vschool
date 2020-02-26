import 'package:cloud_firestore/cloud_firestore.dart';

class Wall {
  String caption;
  String by;
  String forDiv;
  Timestamp timestamp;
  String forClass;
  String photoUrl;
  String photoPath;
  String id;
  String mission;

  Wall({
    this.caption = '',
    this.by,
    this.forDiv,
    this.timestamp,
    this.forClass,
    this.photoUrl = '',
    this.photoPath = '',
    this.id,
    this.mission,
  });

  Wall.fromJson(Map<String, dynamic> json) {
    caption = json['caption'] ?? '';
    by = json['by'];
    forDiv = json['forDiv'];
    timestamp = json['timestamp'] as Timestamp;
    forClass = json['forClass'];
    photoUrl = json['photoUrl'] ?? '';
    photoPath = json['photoPath'] ?? '';
    id = json['id'];
    mission = json['mission'];
  }

  Wall.fromSnapshot(DocumentSnapshot snapshot) {
    caption = snapshot['caption'].toString() ?? '';
    by = snapshot['by'].toString();
    forDiv = snapshot['forDiv'].toString();
    timestamp = snapshot['timeStamp'] as Timestamp;
    forClass = snapshot['forClass'].toString();
    photoUrl = snapshot['photoUrl'].toString() ?? '';
    photoPath = snapshot['photoPath'].toString() ?? '';
    id = snapshot.documentID;
    mission = snapshot['mission'].toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['by'] = this.by;
    data['forDiv'] = this.forDiv;
    // data['timestamp'] = this.timestamp;
    data['forClass'] = this.forClass;
    data['photoUrl'] = this.photoUrl;
    data['photoPath'] = this.photoPath;
    // data['id'] = this.id;
    data['mission'] = this.mission;
    return data;
  }
}
