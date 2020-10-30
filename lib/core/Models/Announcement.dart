import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/enums/announcementType.dart';

class Announcement {
  String caption;
  String by;
  String forDiv;
  Timestamp timestamp;
  String forClass;
  String photoUrl;
  String userId;
  String photoPath;
  AnnouncementType type;
  String id;
  int likeCount;
  List<String> likeList;

  Announcement({
    this.caption = '',
    this.by,
    this.forDiv,
    this.timestamp,
    this.forClass,
    this.photoUrl = '',
    this.userId = '',
    this.photoPath = '',
    this.type,
    this.id,
    this.likeCount,
    this.likeList,
  });

  Announcement.fromJson(Map<String, dynamic> json) {
    caption = json['caption'] ?? '';
    by = json['by'];
    forDiv = json['forDiv'];
    timestamp = json['timestamp'] as Timestamp;
    forClass = json['forClass'];
    photoUrl = json['photoUrl'] ?? '';
    userId = json['userId'] ?? '';
    photoPath = json['photoPath'] ?? '';
    type = AnnouncementTypeHelper.getEnum(json['type']);
    id = json['id'];
    if (json["likeList"] != null) {
      likeList = List<String>();
      final list = json['likeList'];
      if (list is List) {
        json['likeList'].forEach((value) {
          likeList.add(value);
        });
        likeCount = likeList.length;
      }
    } else {
      likeList = [];
      likeCount = 0;
    }
  }

  Announcement.fromSnapshot(DocumentSnapshot snapshot) {
    caption = snapshot.data()['caption'].toString() ?? '';
    by = snapshot.data()['by'].toString();
    forDiv = snapshot.data()['forDiv'].toString();
    timestamp = snapshot.data()['timeStamp'] as Timestamp;
    forClass = snapshot.data()['forClass'].toString();
    photoUrl = snapshot.data()['photoUrl'].toString() ?? '';
    userId = snapshot.data()['userId'].toString() ?? '';
    photoPath = snapshot.data()['photoPath'].toString() ?? '';
    type = AnnouncementTypeHelper.getEnum(snapshot.data()['type'].toString());
    id = snapshot.id;
    if (snapshot.data()["likeList"] != null) {
      likeList = List<String>();
      final list = snapshot.data()['likeList'];
      if (list is List) {
        snapshot.data()['likeList'].forEach((value) {
          likeList.add(value);
        });
        likeCount = likeList.length;
      }
    } else {
      likeList = [];
      likeCount = 0;
    }
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
    data['userId'] = this.userId;
    data['type'] = AnnouncementTypeHelper.getValue(this.type);
    data['photoPath'] = this.photoPath;
    data['likeList'] = this.likeList;
    data['likeCount'] = this.likeCount;
    return data;
  }
}
