import 'package:json_annotation/json_annotation.dart';

part 'tags_projection.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class TagsProjection {
  final String id;
  final String name;
  final String description;
  final String slug;

  TagsProjection(this.id, this.name, this.description, this.slug);

  factory TagsProjection.fromJson(Map<String, dynamic> json) => _$TagsProjectionFromJson(json);

  Map<String, dynamic> toJson() => _$TagsProjectionToJson(this);
}
