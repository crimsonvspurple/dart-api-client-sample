import 'package:commons/services/api/requests/base_body.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_blog_body.g.dart';

@JsonSerializable(createFactory: false)
class UpdateBlogBody extends BaseBody {
  final String id;
  final String? title;
  final String? content;
  final String? synopsis;
  final String? authorId;
  final String? coverImage;
  final int? date;
  final String? status;
  final int version;

  UpdateBlogBody(this.id, this.title, this.content, this.synopsis, this.authorId, this.date, this.status, this.version, this.coverImage);

  @override
  Map<String, dynamic> toJson() => _$UpdateBlogBodyToJson(this);
}
