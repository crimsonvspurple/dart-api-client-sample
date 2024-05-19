import 'package:commons/services/api/responses/blog/opaque/tags_projection.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../user/opaque/user_projection_public.dart';

part 'blog_projection.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class BlogProjection {
  final String id;
  final String title;
  final String synopsis;
  final String authorId;
  final double readDuration;
  final UserProjectionPublic author;
  final String? coverImage;
  final int date;
  final String status;
  final List<String> tagIds;
  final List<TagsProjection> tags;
  final bool active;

  BlogProjection(this.id, this.title, this.synopsis, this.authorId, this.readDuration, this.author, this.date, this.status, this.tagIds, this.tags, this.active,
      this.coverImage);

  factory BlogProjection.fromJson(Map<String, dynamic> json) => _$BlogProjectionFromJson(json);

  Map<String, dynamic> toJson() => _$BlogProjectionToJson(this);
}
