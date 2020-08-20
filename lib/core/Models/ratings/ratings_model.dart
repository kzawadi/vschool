// // import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:meta/meta.dart';
// import 'package:flutter/foundation.dart';
// import 'package:json_annotation/json_annotation.dart';

// // part 'rating.freezed.dart';
// part 'ratings.g.dart';

// enum Subjects {
//   @JsonValue("maths")
//   MATHS,
//   @JsonValue("science")
//   SCIENCE,
//   @JsonValue("english")
//   ENGLISH,
//   @JsonValue("swahili")
//   SWAHILI,
// }

// @immutable
// // @freezed
// @JsonSerializable()
// abstract class Rating with _$Rating {
//   const factory Rating({
//     final Subjects subject,
//     final int rating,
//   }) = _Rating;

//   factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
// }
