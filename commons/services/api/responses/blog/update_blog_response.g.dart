// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_blog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBlog _$UpdateBlogFromJson(Map<String, dynamic> json) => UpdateBlog(
      json['id'] as String,
      json['title'] as String,
      json['blog'] as String,
      json['active'] as bool,
      json['version'] as int,
    );

Map<String, dynamic> _$UpdateBlogToJson(UpdateBlog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'blog': instance.blog,
      'active': instance.active,
      'version': instance.version,
    };
