// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_blog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBlog _$CreateBlogFromJson(Map<String, dynamic> json) => CreateBlog(
      json['id'] as String,
      json['title'] as String,
      json['blog'] as String,
      json['active'] as bool,
      json['version'] as int,
    );

Map<String, dynamic> _$CreateBlogToJson(CreateBlog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'blog': instance.blog,
      'active': instance.active,
      'version': instance.version,
    };
