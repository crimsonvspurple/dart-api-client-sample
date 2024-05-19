// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_timeout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTimeOut _$RequestTimeOutFromJson(Map<String, dynamic> json) =>
    RequestTimeOut(
      message: $enumDecodeNullable(_$MessageEnumMap, json['message']),
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["Request timed out"],
      data: json['data'] as Map<String, dynamic>?,
      version: (json['version'] as num?)?.toDouble() ?? 408,
      timestamp: json['timestamp'] as int? ?? 0,
    );

Map<String, dynamic> _$RequestTimeOutToJson(RequestTimeOut instance) =>
    <String, dynamic>{
      'message': _$MessageEnumMap[instance.message],
      'errors': instance.errors,
      'data': instance.data,
      'version': instance.version,
      'timestamp': instance.timestamp,
    };

const _$MessageEnumMap = {
  Message.DELETE_SUCCESSFUL: 'DELETE_SUCCESSFUL',
  Message.OTP_GENERATED: 'OTP_GENERATED',
  Message.SUCCESS: 'SUCCESS',
  Message.TOKEN_REFRESHED: 'TOKEN_REFRESHED',
  Message.REQUEST_FAILED: 'REQUEST_FAILED',
};
