import 'package:commons/services/api/constants/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_timeout.g.dart';

@JsonSerializable()
class RequestTimeOut {
  final Message? message;
  final List<String>? errors;
  final Map<String, dynamic>? data;
  final double version;
  final int timestamp;

  RequestTimeOut({
    this.message,
    this.errors = const ["Request timed out"],
    this.data,
    this.version = 408,
    this.timestamp = 0,
  });

  factory RequestTimeOut.fromJson(Map<String, dynamic> json) => _$RequestTimeOutFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTimeOutToJson(this);
}
