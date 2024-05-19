import 'package:json_annotation/json_annotation.dart';

part 'update_blog_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateBlog {
  final String id;
  final String title;
  final String blog;
  final bool active;
  final int version;

  UpdateBlog(this.id, this.title, this.blog, this.active, this.version);

  factory UpdateBlog.fromJson(Map<String, dynamic> json) => _$UpdateBlogFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBlogToJson(this);
}
