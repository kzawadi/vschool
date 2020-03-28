import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/enums/fees.dart';

class Fees {
  String description;
  String fordiv;
  String ratings;
  Timestamp timestamp;
  String subject;
  String forclass;

  /// for now its just there fro rapid replacement
  String bookCover;
  String isbn;
  FeesType type;

  Fees({
    this.description = '',
    this.fordiv,
    this.ratings,
    this.timestamp,
    this.subject,
    this.forclass = '',
    this.bookCover = '',
    this.isbn,
    this.type,
  });

  Fees.fromJson(Map<String, dynamic> json) {
    description = json['description'] ?? '';
    fordiv = json['fordiv'];
    ratings = json['ratings'];
    timestamp = json['timestamp'] as Timestamp;
    subject = json['subject'];
    forclass = json['forclass'] ?? '';
    bookCover = json['bookCover'] ?? '';
    isbn = json['isbn'];
    type = FeesTypeHelper.getEnum(json['type']);
  }

  Fees.fromSnapshot(DocumentSnapshot snapshot) {
    description = snapshot['description'].toString() ?? '';
    fordiv = snapshot['fordiv'].toString();
    ratings = snapshot['ratings'].toString();
    timestamp = snapshot['timeStamp'] as Timestamp;
    subject = snapshot['subject'].toString();
    forclass = snapshot['forclass'].toString() ?? '';
    bookCover = snapshot['bookCover'].toString() ?? '';
    type = FeesTypeHelper.getEnum(snapshot['type'].toString());
    isbn = snapshot['isbn'].toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['fordiv'] = this.fordiv;
    data['ratings'] = this.ratings;
    data['timestamp'] = this.timestamp;
    data['subject'] = this.subject;
    data['forclass'] = this.forclass;
    data['type'] = FeesTypeHelper.getValue(this.type);
    data['bookCover'] = this.bookCover;
    data['isbn'] = this.isbn;
    return data;
  }
}
