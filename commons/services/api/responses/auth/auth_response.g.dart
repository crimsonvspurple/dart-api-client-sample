// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      json['token'] as String,
      json['expires'] as int,
    );

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      Token.fromJson(json['access'] as Map<String, dynamic>),
      Token.fromJson(json['refresh'] as Map<String, dynamic>),
    );
