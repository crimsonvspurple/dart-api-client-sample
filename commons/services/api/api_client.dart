import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:commons/services/api/error_response.dart';
import 'package:commons/services/api/request_timeout.dart';
import 'package:commons/services/api/requests/api_base_request.dart';
import 'package:commons/services/api/responses/api_response.dart';
import 'package:commons/services/api/responses/user/user.dart';
import 'package:commons/utils/misc/ds_source.dart';
import 'package:commons/utils/simpleStorage/token_storage.dart';
import 'package:commons/utils/timezone/tz_header.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'constants/http_method.dart';
import 'hive_client.dart';

/// WARNING: Caching is disabled now.
/// After implementing cache-busting enable it again
class ApiClient {
  // ensure singleton
  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal();

  // let's keep one client if possible; have to close it on APP exit
  http.Client client = http.Client();
  HiveClient hive = HiveClient();

  Future<ApiResponse> call(ApiBaseRequest apiRequest) async {
    final http.Response response;
    final headers = {
      HttpHeaders.contentTypeHeader: "${apiRequest.contentType}; charset=${apiRequest.encoding}",
      HttpHeaders.acceptEncodingHeader: apiRequest.acceptEncoding
    };

    final tZ = TzHeader.tzHeader;

    headers['tZ'] = tZ;
    headers['ds-source'] = dsSource();

    dev.log('${apiRequest.uri}', name: runtimeType.toString());

    /* the logic here is like this:
      1. We want to send token or block the call if we are calling endpoints which require auth
      2. We want to send token for endpoints which support auth but does not require it _IF TOKEN IS AVAILABLE_
      3. We don't want to send token for endpoints which don't require tokens (opposite of #1)
    */
    if (apiRequest.requireAuth != false) {
      String token = await getMyToken(mandatory: apiRequest.requireAuth ?? false);
      if (token != "") {
        // throw Exception("Authed endpoint called while no token exists!");
        headers[HttpHeaders.authorizationHeader] = "Bearer $token";
      }
    }

    final String hash;
    if (apiRequest.shouldCache) {
      // let's simple serialize the api call using { user id + method + uri + body value }
      hash = apiRequest.getHash();
      String? responseBody = getCache(hash);
      if (responseBody != null) {
        dev.log('API Response <- Cache', name: runtimeType.toString());
        return await compute(bodyToJson, responseBody);
      }
    } else {
      hash = ""; // to avoid compiler being kinda dumb
    }

    switch (apiRequest.method) {
      case HttpMethod.get:
        response = await client.get(apiRequest.uri, headers: headers).timeout(
          apiRequest.timeout,
          onTimeout: () {
            return http.Response(jsonEncode(RequestTimeOut()), 408);
          },
        );
        break;
      case HttpMethod.post:
        if (apiRequest.hasBody) {
          response = await client.post(apiRequest.uri, headers: headers, body: json.encode(apiRequest.body!.toJson())).timeout(
                apiRequest.timeout,
                onTimeout: () => http.Response(jsonEncode(RequestTimeOut()), 408),
              );
        } else {
          response = await client.post(apiRequest.uri, headers: headers).timeout(
                apiRequest.timeout,
                onTimeout: () => http.Response(jsonEncode(RequestTimeOut()), 408),
              ); // we should not be using POST without body in general
        }
        break;
      case HttpMethod.put:
        if (apiRequest.hasBody) {
          response = await client.put(apiRequest.uri, headers: headers, body: json.encode(apiRequest.body!.toJson())).timeout(
                apiRequest.timeout,
                onTimeout: () => http.Response(jsonEncode(RequestTimeOut()), 408),
              );
        } else {
          response = await client.put(apiRequest.uri, headers: headers).timeout(
                apiRequest.timeout,
                onTimeout: () => http.Response(jsonEncode(RequestTimeOut()), 408),
              ); // we should not be using PUT without body in general
        }
        break;
      case HttpMethod.delete:
        if (apiRequest.hasBody) {
          response = await client.delete(apiRequest.uri, headers: headers, body: json.encode(apiRequest.body!.toJson())).timeout(
                apiRequest.timeout,
                onTimeout: () => http.Response(jsonEncode(RequestTimeOut()), 408),
              ); // we should not be using DELETE with body in general
        } else {
          response = await client.delete(apiRequest.uri, headers: headers).timeout(
                apiRequest.timeout,
                onTimeout: () => http.Response(jsonEncode(RequestTimeOut()), 408),
              );
        }
        break;
      default:
        throw Exception("HttpMethod: ${apiRequest.method} is NOT supported!");
    }

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        // we should not need to cache except 2xx responses
        if (apiRequest.shouldCache) {
          await setCache(hash, response, apiRequest.cacheDuration);
        }
        // now return
        return await compute(bodyToJson, response.body);
      case HttpStatus.noContent:
        return ApiResponse(null, null, null, 1.0, 0);
      case HttpStatus.badRequest:
        return Future.error(ErrorResponse(["Server Not Responding", "Please try again later"], response.statusCode));
      case HttpStatus.notFound:
        return Future.error(ErrorResponse(["Not Found", "Please try again later"], response.statusCode));
      default:
        print("HttpStatus is NOT ok; generating Future.error | ${response.toString()}");
        ApiResponse apiResponse = await compute(bodyToJson, response.body);
        return Future.error(ErrorResponse(apiResponse.errors, response.statusCode));

      // throw Exception("HttpStatus is NOT ok | $response");
    }
  }

  Future<void> setCache(String hash, http.Response response, int cacheDuration) async {
    return await hive.setResponse(hash, response, cacheDuration);
  }

  String? getCache(String hash) {
    return hive.getResponse(hash);
  }

  Future<void> bustCache(String hash) async {
    await hive.bustResponse(hash);
  }
}

Future<String> getMyToken({bool mandatory = true}) async {
  if (mandatory || TokenStorage().isLoggedIn) {
    return await TokenStorage().getValidIdToken();
  } else {
    return "";
  }
}

User? getCurrentUser() {
  return TokenStorage().getCurrentUser();
}

ApiResponse bodyToJson(String body) {
  return ApiResponse.fromJson(jsonDecode(body));
}
