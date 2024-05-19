// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      json['id'] as String,
      json['title'] as String,
      json['content'] as String,
      json['readDuration'] as int,
      json['synopsis'] as String,
      json['authorId'] as String,
      UserProjectionPublic.fromJson(json['author'] as Map<String, dynamic>),
      json['date'] as int,
      json['status'] as String,
      (json['tagIds'] as List<dynamic>).map((e) => e as String).toList(),
      (json['tags'] as List<dynamic>)
          .map((e) => TagsProjection.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['active'] as bool,
      json['version'] as int,
      json['coverImage'] as String,
      json['authorAbout'] == null
          ? null
          : AboutProjection.fromJson(
              json['authorAbout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'readDuration': instance.readDuration,
      'synopsis': instance.synopsis,
      'coverImage': instance.coverImage,
      'authorId': instance.authorId,
      'author': instance.author.toJson(),
      'date': instance.date,
      'authorAbout': instance.authorAbout?.toJson(),
      'status': instance.status,
      'tagIds': instance.tagIds,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'active': instance.active,
      'version': instance.version,
    };
