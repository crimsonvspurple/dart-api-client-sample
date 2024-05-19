import 'package:commons/services/api/requests/base_body.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_blog_body.g.dart';

@JsonSerializable(createFactory: false)
class CreateBlogBody extends BaseBody {
  final String title;
  final String content;
  final String synopsis;
  final String authorId;
  final String? coverImage;
  final int date;
  final String status;
  final List<String> tagIds;

  CreateBlogBody(this.title, this.content, this.synopsis, this.authorId, this.date, this.status, this.tagIds, this.coverImage);

  @override
  Map<String, dynamic> toJson() => _$CreateBlogBodyToJson(this);
}
