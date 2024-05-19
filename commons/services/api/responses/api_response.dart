import 'package:commons/services/api/constants/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(createToJson: false)
class ApiResponse {
  final Message? message;
  final List<String>? errors;
  final Map<String, dynamic>? data;
  final double version;
  final int timestamp;

  ApiResponse(this.message, this.errors, this.data, this.version, this.timestamp);

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  bool get hasError => errors?.isNotEmpty ?? false;
}
