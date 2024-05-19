import 'package:json_annotation/json_annotation.dart';

part 'base_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseEntity {
  // late List<String>? errors;
  //
  // bool get hasError => errors?.isNotEmpty ?? false;

  BaseEntity();

  factory BaseEntity.fromJson(Map<String, dynamic> json) => _$BaseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseEntityToJson(this);
}
