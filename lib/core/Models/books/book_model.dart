import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourESchool/core/enums/fees.dart';

class Fees {
  String description;
  String bookName;
  String bookId;
  Timestamp timestamp;
  String subject;
  String bookIsForStandard;

  /// for now its just there fro rapid replacement
  String bookCover;
  String isbn;
  FeesType type;

  Fees({
    this.description = '',
    this.bookName,
    this.bookId,
    this.timestamp,
    this.subject,
    this.bookIsForStandard = '',
    this.bookCover = '',
    this.isbn,
    this.type,
  });

  Fees.fromJson(Map<String, dynamic> json) {
    description = json['description'] ?? '';
    bookName = json['bookName'];
    bookId = json['bookId'];
    timestamp = json['timestamp'] as Timestamp;
    subject = json['subject'];
    bookIsForStandard = json['bookIsForStandard'] ?? '';
    bookCover = json['bookCover'] ?? '';
    isbn = json['isbn'];
    type = FeesTypeHelper.getEnum(json['type']);
  }

  Fees.fromSnapshot(DocumentSnapshot snapshot) {
    description = snapshot['description'].toString() ?? '';
    bookName = snapshot['bookName'].toString();
    bookId = snapshot['bookId'].toString();
    timestamp = snapshot['timeStamp'] as Timestamp;
    subject = snapshot['subject'].toString();
    bookIsForStandard = snapshot['bookIsForStandard'].toString() ?? '';
    bookCover = snapshot['bookCover'].toString() ?? '';
    type = FeesTypeHelper.getEnum(snapshot['type'].toString());
    isbn = snapshot['isbn'].toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['bookName'] = this.bookName;
    data['bookId'] = this.bookId;
    data['timestamp'] = this.timestamp;
    data['subject'] = this.subject;
    data['bookIsForStandard'] = this.bookIsForStandard;
    data['type'] = FeesTypeHelper.getValue(this.type);
    data['bookCover'] = this.bookCover;
    data['isbn'] = this.isbn;
    return data;
  }
}
