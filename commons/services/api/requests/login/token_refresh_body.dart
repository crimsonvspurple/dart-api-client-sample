import 'package:commons/services/api/requests/base_body.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_refresh_body.g.dart';

@JsonSerializable(createFactory: false)
class TokenRefreshBody extends BaseBody {
  final String token;

  TokenRefreshBody(this.token);

  @override
  Map<String, dynamic> toJson() => _$TokenRefreshBodyToJson(this);
}
