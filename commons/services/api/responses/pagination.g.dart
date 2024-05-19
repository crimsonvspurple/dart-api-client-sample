// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      json['pageSize'] as String,
      json['pageNumber'] as String,
      json['pageSort'] as String,
      (json['pageSortValues'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageNumber': instance.pageNumber,
      'pageSort': instance.pageSort,
      'pageSortValues': instance.pageSortValues,
    };
