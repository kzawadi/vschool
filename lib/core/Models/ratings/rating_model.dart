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
    description = snapshot.data()['description'].toString() ?? '';
    fordiv = snapshot.data()['fordiv'].toString();
    ratings = snapshot.data()['ratings'].toString();
    timestamp = snapshot.data()['timeStamp'] as Timestamp;
    subject = snapshot.data()['subject'].toString();
    forclass = snapshot.data()['forclass'].toString() ?? '';
    bookCover = snapshot.data()['bookCover'].toString() ?? '';
    type = FeesTypeHelper.getEnum(snapshot.data()['type'].toString());
    isbn = snapshot.data()['isbn'].toString() ?? '';
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
