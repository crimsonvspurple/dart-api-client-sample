import 'package:json_annotation/json_annotation.dart';

part 'base_body.g.dart';

@JsonSerializable(createFactory: false)
class BaseBody {
  BaseBody();

  Map<String, dynamic> toJson() => _$BaseBodyToJson(this);
}
