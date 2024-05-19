import 'package:commons/services/api/constants/service.dart';
import 'package:commons/services/api/constants/endpoint.dart';
import 'package:commons/services/api/constants/http_method.dart';
import 'package:commons/services/api/requests/api_base_request.dart';
import 'package:commons/services/api/requests/login/token_refresh_body.dart';

class TokenRefreshRequest extends ApiBaseRequest {
  TokenRefreshRequest(String token)
      : super(service: Service.user, endpoint: Endpoint.tokenRefresh, method: HttpMethod.post, requireAuth: false, hasBody: true) {
    body = TokenRefreshBody(token);
  }
}
