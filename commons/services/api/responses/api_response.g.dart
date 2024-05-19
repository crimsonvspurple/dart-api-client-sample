// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      $enumDecodeNullable(_$MessageEnumMap, json['message']),
      (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['data'] as Map<String, dynamic>?,
      (json['version'] as num).toDouble(),
      json['timestamp'] as int,
    );

const _$MessageEnumMap = {
  Message.DELETE_SUCCESSFUL: 'DELETE_SUCCESSFUL',
  Message.OTP_GENERATED: 'OTP_GENERATED',
  Message.SUCCESS: 'SUCCESS',
  Message.TOKEN_REFRESHED: 'TOKEN_REFRESHED',
  Message.REQUEST_FAILED: 'REQUEST_FAILED',
};
