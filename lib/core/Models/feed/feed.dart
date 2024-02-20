import 'package:framy_annotation/framy_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ourESchool/core/enums/announcementType.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@immutable
@freezed
@framyModel
abstract class Feed with _$Feed {
  const factory Feed({
    String caption,
    String by,
    String forDiv,
    // DateTime timestamp,
    String forClass,
    String photoUrl,
    String photoPath,
    AnnouncementType type,
    String id,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
