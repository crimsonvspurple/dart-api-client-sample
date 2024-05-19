import 'package:json_annotation/json_annotation.dart';

part 'create_blog_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateBlog {
  final String id;
  final String title;
  final String blog;
  final bool active;
  final int version;

  CreateBlog(this.id, this.title, this.blog, this.active, this.version);

  factory CreateBlog.fromJson(Map<String, dynamic> json) => _$CreateBlogFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBlogToJson(this);
}
