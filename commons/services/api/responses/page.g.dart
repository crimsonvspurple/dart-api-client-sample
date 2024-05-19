// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      json['content'] as List<dynamic>,
      Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      json['totalPages'] as int,
      json['totalElements'] as int,
      json['last'] as bool,
      json['size'] as int,
      json['number'] as int,
      Sort.fromJson(json['sort'] as Map<String, dynamic>),
      json['numberOfElements'] as int,
      json['empty'] as bool,
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'last': instance.last,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };
