// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagsProjection _$TagsProjectionFromJson(Map<String, dynamic> json) =>
    TagsProjection(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['slug'] as String,
    );

Map<String, dynamic> _$TagsProjectionToJson(TagsProjection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'slug': instance.slug,
    };
