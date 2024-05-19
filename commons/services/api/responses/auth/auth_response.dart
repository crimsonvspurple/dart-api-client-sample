import 'package:commons/services/api/responses/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';
// part 'Token.g.dart';

@JsonSerializable(createToJson: false)
class Token {
  final String token;
  final int expires;

  Token(this.token, this.expires);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}

@JsonSerializable(createToJson: false)
class AuthResponse extends BaseEntity {
  final Token access;
  final Token refresh;

  AuthResponse(this.access, this.refresh);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}
