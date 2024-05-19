import 'package:commons/services/api/responses/blog/opaque/tags_projection.dart';
import 'package:json_annotation/json_annotation.dart';

import '../user/opaque/about_projection.dart';
import '../user/opaque/user_projection_public.dart';

part 'blog.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Blog {
  final String id;
  final String title;
  final String content;
  final int readDuration;
  final String synopsis;
  final String coverImage;
  final String authorId;
  final UserProjectionPublic author;
  final int date;
  final AboutProjection? authorAbout;
  final String status;
  final List<String> tagIds;
  final List<TagsProjection> tags;
  final bool active;
  final int version;

  Blog(this.id, this.title, this.content, this.readDuration, this.synopsis, this.authorId, this.author, this.date, this.status, this.tagIds, this.tags,
      this.active, this.version, this.coverImage, this.authorAbout);

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
}
