import 'package:commons/services/api/collections/base_api_service.dart';
import 'package:commons/services/api/constants/message.dart';
import 'package:commons/services/api/requests/login/constants/otp_type.dart';
import 'package:commons/services/api/requests/login/login_request.dart';
import 'package:commons/services/api/requests/login/otp_request.dart';
import 'package:commons/services/api/requests/login/token_refresh_request.dart';
import 'package:commons/services/api/responses/api_response.dart';
import 'package:commons/services/api/responses/auth/auth_response.dart';

class LoginService extends BaseApiService {
  Future<AuthResponse> doLogin(OtpType type, String loginId, String code) async {
    ApiResponse apiResponse = await apiClient.call(LoginRequest(type, loginId, code));
    // return await compute(bodyToResponse, apiRespßonse.data!);
    if (apiResponse.data == null) {
      throw Exception("AuthResponse Body -> Data is empty");
    }
    return AuthResponse.fromJson(apiResponse.data!);
  }

  AuthResponse bodyToResponse(Map<String, dynamic> data) {
    return AuthResponse.fromJson(data);
  }

  Future<Message> requestOtp(OtpType type, String loginId) async {
    ApiResponse apiResponse = await apiClient.call(OtpRequest(type, loginId));
    return apiResponse.message ?? Message.OTP_GENERATED;
    // return await compute(bodyToResponse, apiResponse.data!);
  }

  Future<AuthResponse> refreshToken(String refreshToken) async {
    ApiResponse apiResponse = await apiClient.call(TokenRefreshRequest(refreshToken));
    if (apiResponse.data == null) {
      throw Exception("AuthResponse Body -> Data is empty");
    }
    return AuthResponse.fromJson(apiResponse.data!);
  }
}
