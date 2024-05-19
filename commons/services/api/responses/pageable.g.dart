// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      Sort.fromJson(json['sort'] as Map<String, dynamic>),
      json['pageSize'] as int,
      json['pageNumber'] as int,
      json['offset'] as int,
      json['paged'] as bool,
      json['unpaged'] as bool,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'sort': instance.sort,
      'pageSize': instance.pageSize,
      'pageNumber': instance.pageNumber,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };
