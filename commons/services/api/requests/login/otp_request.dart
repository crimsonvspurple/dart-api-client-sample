import 'package:commons/services/api/constants/service.dart';
import 'package:commons/services/api/constants/endpoint.dart';
import 'package:commons/services/api/constants/http_method.dart';
import 'package:commons/services/api/requests/api_base_request.dart';
import 'package:commons/services/api/requests/login/auth_body.dart';
import 'package:commons/utils/misc/common_validators.dart';

import 'constants/otp_type.dart';

class OtpRequest extends ApiBaseRequest {
  OtpRequest(OtpType type, String loginId) : super(service: Service.user, endpoint: Endpoint.auth, method: HttpMethod.post, requireAuth: false, hasBody: true) {
    switch (type) {
      case OtpType.phone:
        body = AuthBody(CommonValidator.validateMobile(loginId), null, null);
        break;
      case OtpType.email:
        body = AuthBody(null, CommonValidator.validateEmail(loginId), null);
        break;
    }
  }
}
