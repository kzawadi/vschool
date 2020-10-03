import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/enums/announcementType.dart';

class Announcement {
  String caption;
  String by;
  String forDiv;
  Timestamp timestamp;
  String forClass;
  String photoUrl;
  String createrPhotoUrl;
  String photoPath;
  AnnouncementType type;
  String id;

  Announcement(
      {this.caption = '',
      this.by,
      this.forDiv,
      this.timestamp,
      this.forClass,
      this.photoUrl = '',
      this.createrPhotoUrl = '',
      this.photoPath = '',
      this.type,
      this.id});

  Announcement.fromJson(Map<String, dynamic> json) {
    caption = json['caption'] ?? '';
    by = json['by'];
    forDiv = json['forDiv'];
    timestamp = json['timestamp'] as Timestamp;
    forClass = json['forClass'];
    photoUrl = json['photoUrl'] ?? '';
    createrPhotoUrl = json['createrPhotoUrl'] ?? '';
    photoPath = json['photoPath'] ?? '';
    type = AnnouncementTypeHelper.getEnum(json['type']);
    id = json['id'];
  }

  Announcement.fromSnapshot(DocumentSnapshot snapshot) {
    caption = snapshot.data()['caption'].toString() ?? '';
    by = snapshot.data()['by'].toString();
    forDiv = snapshot.data()['forDiv'].toString();
    timestamp = snapshot.data()['timeStamp'] as Timestamp;
    forClass = snapshot.data()['forClass'].toString();
    photoUrl = snapshot.data()['photoUrl'].toString() ?? '';
    createrPhotoUrl = snapshot.data()['createrPhotoUrl'].toString() ?? '';
    photoPath = snapshot.data()['photoPath'].toString() ?? '';
    type = AnnouncementTypeHelper.getEnum(snapshot.data()['type'].toString());
    id = snapshot.id;
  }

  /// something is not very okay with decoding and encoding of timestamp fields..
  /// it has to be reviewed someday but keep in mind when using this data class
  /// [timstamp] and [timeStamp]
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['by'] = this.by;
    data['forDiv'] = this.forDiv;
    data['timeStamp'] = Timestamp.now();
    data['forClass'] = this.forClass;
    data['photoUrl'] = this.photoUrl;
    data['createrPhotoUrl'] = this.createrPhotoUrl;
    data['type'] = AnnouncementTypeHelper.getValue(this.type);
    data['photoPath'] = this.photoPath;
    // data['id'] = this.id;
    return data;
  }
}
