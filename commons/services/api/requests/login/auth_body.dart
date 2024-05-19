import 'package:json_annotation/json_annotation.dart';

import '../base_body.dart';

part 'auth_body.g.dart';

@JsonSerializable(createFactory: false)
class AuthBody extends BaseBody {
  final String? phoneNumber;
  final String? email;
  final String? code;

  AuthBody(this.phoneNumber, this.email, this.code);

  @override
  Map<String, dynamic> toJson() => _$AuthBodyToJson(this);
}
