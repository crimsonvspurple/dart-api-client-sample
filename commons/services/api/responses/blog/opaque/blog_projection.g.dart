// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogProjection _$BlogProjectionFromJson(Map<String, dynamic> json) =>
    BlogProjection(
      json['id'] as String,
      json['title'] as String,
      json['synopsis'] as String,
      json['authorId'] as String,
      (json['readDuration'] as num).toDouble(),
      UserProjectionPublic.fromJson(json['author'] as Map<String, dynamic>),
      json['date'] as int,
      json['status'] as String,
      (json['tagIds'] as List<dynamic>).map((e) => e as String).toList(),
      (json['tags'] as List<dynamic>)
          .map((e) => TagsProjection.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['active'] as bool,
      json['coverImage'] as String?,
    );

Map<String, dynamic> _$BlogProjectionToJson(BlogProjection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'synopsis': instance.synopsis,
      'authorId': instance.authorId,
      'readDuration': instance.readDuration,
      'author': instance.author.toJson(),
      'coverImage': instance.coverImage,
      'date': instance.date,
      'status': instance.status,
      'tagIds': instance.tagIds,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'active': instance.active,
    };
