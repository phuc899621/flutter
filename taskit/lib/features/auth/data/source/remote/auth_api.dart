import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/auth/data/dto/req/logout/logout_request.dart';
import 'package:taskit/features/auth/data/dto/req/refresh_token/refresh_token_request.dart';
import 'package:taskit/features/auth/data/dto/res/login/refresh_token_data.dart';
import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';
import 'package:taskit/shared/data/dto/response/message_response.dart';

import '../../../../../shared/config/app/app_config.dart';
import '../../../../../shared/data/dto/response/data_response.dart';
import '../../../../../shared/data/source/remote/network/network_service.dart';
import '../../dto/req/forgot_pass/forgot_password_request.dart';
import '../../dto/req/login/login_request.dart';
import '../../dto/req/signup/signup_request.dart';
import '../../dto/res/forgot_pass/verify.dart';
import '../../dto/res/login/login_data.dart';
import '../../dto/res/login/login_verify_data.dart';

part 'auth_api.g.dart';

final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return AuthApi(dio);
});
final authRefreshApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(basicDioProvider);
  return AuthApi(dio);
});

@RestApi(baseUrl: AppConfigs.auth)
sealed class AuthApi {
  factory AuthApi(Dio dio) => _AuthApi(dio);

  /*
  * Login
  * */
  @POST('/login')
  Future<DataResponse<LoginData>> login(@Body() LoginRequest data);

  @GET('/login/verify')
  Future<DataResponse<LoginVerifyData>> checkLogin(
    @Header('Authorization') String token,
  );

  @GET('/me')
  Future<DataResponse<UserData>> fetchUser(
    @Header('Authorization') String accessToken,
  );

  @POST('/refresh')
  Future<DataResponse<RefreshTokenData>> refreshToken(
    @Body() RefreshTokenRequest request,
  );

  @POST('/logout')
  Future<MessageResponse> logout(@Body() LogoutRequest request);

  @POST('/signup')
  /*
  * Signup
  * */
  Future<MessageResponse> signup(@Body() SignupRequest data);

  @POST('/signup/verify')
  Future<MessageResponse> signupVerify(@Body() SignupRequest data);

  @POST('/signup/resend')
  Future<MessageResponse> signupResend(@Body() SignupRequest data);

  @POST('/forgot-password')
  /*
  * Forgot Password
  * */
  Future<MessageResponse> forgotPass(@Body() ForgotPassRequest data);

  @POST('/forgot-password/verify')
  Future<DataResponse<ForgotPassData>> forgotPassVerify(
    @Body() ForgotPassRequest data,
  );

  @POST('/forgot-password/resend')
  Future<MessageResponse> forgotPassResend(@Body() ForgotPassRequest data);

  @PUT('/forgot-password/reset')
  Future<MessageResponse> forgotPassReset(@Body() ForgotPassRequest data);
}
