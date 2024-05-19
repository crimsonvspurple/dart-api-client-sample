import 'package:commons/services/api/configs/api_config.dart';
import 'package:commons/services/api/constants/content_type.dart';
import 'package:commons/services/api/constants/service.dart';
import 'package:commons/utils/simpleStorage/token_storage.dart';
import 'package:crypto/crypto.dart';

import 'base_body.dart';

abstract class ApiBaseRequest {
  final Service service;
  final String endpoint;
  final String method;
  final String contentType;
  final String encoding;
  final String acceptEncoding;
  final int? pageNumber;
  final int? pageSize;
  final String? pageSort;
  final Map<String, dynamic> query; // dynamic but has to be string/int types; not complex objects | can't be int?
  final bool? requireAuth;
  final bool hasBody;
  final int cacheDuration; // 0 = no cache
  final String path;
  final String? fragment;
  late final Map<String, dynamic /*String|Iterable<String>*/ >? queryParameters;
  late final BaseBody? body;
  final Duration timeout;
  final String? version;

  ApiBaseRequest(
      {required this.service,
      required this.endpoint,
      required this.method,
      required this.requireAuth,
      required this.hasBody,
      this.cacheDuration = 0,
      this.path = "",
      this.fragment,
      this.contentType = ContentType.json,
      this.encoding = "utf-8",
      this.acceptEncoding = "gzip, deflate",
      this.pageNumber,
      this.pageSize,
      this.pageSort,
      this.query = const {},
      this.timeout = const Duration(seconds: 15),
      this.version}) {
    Map<String, dynamic /*String|Iterable<String>*/ > params = {};
    if (pageNumber != null) {
      params['pageNum'] = pageNumber.toString();
    }
    if (pageSize != null) {
      params['pageSize'] = pageSize.toString();
    }
    if (pageSort != null) {
      params['pageSort'] = pageSort.toString();
    }
    if (query.isNotEmpty) {
      params.addAll(query);
    }

    queryParameters = params.isNotEmpty ? params : null;

    if (!hasBody) {
      body = null;
    }
    if (!path.startsWith("/")) {
      print("/ is missing of $method $service$endpoint");
    }
  }

  bool get shouldCache => cacheDuration > 0;

  Uri get uri => Uri(
      scheme: ApiConfig.scheme,
      host: ApiConfig.getPrefix(service) + ApiConfig.host + ApiConfig.getSuffix(service),
      port: ApiConfig.getPort(service),
      path: (version ?? ApiConfig.version) + endpoint + path,
      queryParameters: queryParameters,
      fragment: fragment);

  String getHash() {
    String hashString = _getUserIdForHash() + method + uri.toString() + (body?.toJson().toString() ?? "");
    return md5.convert(hashString.codeUnits).toString();
  }

  String _getUserIdForHash() {
    return TokenStorage().getCurrentUser()?.id.toString() ?? "";
  }
}
