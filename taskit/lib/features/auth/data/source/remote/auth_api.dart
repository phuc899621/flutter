import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../shared/data/dto/response/base_response.dart';
import '../../../../../shared/data/dto/response/base_response_data.dart';
import '../../../../../shared/data/source/remote/network/network_service.dart';
import '../../dto/req/forgot_pass/forgot_pass.dart';
import '../../dto/req/forgot_pass/forgot_pass_verify.dart';
import '../../dto/req/forgot_pass/reset_pass.dart';
import '../../dto/req/login/login_request.dart';
import '../../dto/req/signup/signup_request.dart';
import '../../dto/req/signup/signup_verify_request.dart';
import '../../dto/res/forgot_pass/verify.dart';
import '../../dto/res/login/login_data.dart';
import '../../dto/res/login/login_verify_data.dart';
import '../../dto/res/signup/signup_data.dart';

part 'auth_api.g.dart';

final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return AuthApi(dio);
});

@RestApi()
sealed class AuthApi {
  factory AuthApi(Dio dio) => _AuthApi(dio);
  /*
  * Login
  * */
  @POST('/user/auth/login')
  Future<BaseResponse<LoginData>> login(@Body() LoginRequest data);
  @GET('/user/auth/login/verify')
  Future<BaseResponse<LoginVerifyData>> checkLogin(
      @Header('Authorization') String token);
  @POST('/user/auth/signup')
  /*
  * Signup
  * */
  Future<BaseResponse<SignupData>> signup(@Body() SignupRequest data);
  @POST('/user/auth/signup-verify')
  Future<BaseResponse<SignupData>> signupVerify(
      @Body() SignupVerifyRequest data);
  @POST('/user/auth/forgot-password')
  /*
  * Forgot Password
  * */
  Future<BaseResponse<BaseData>> forgotPass(@Body() ForgotPassRequest data);
  @POST('/user/auth/forgot-password/verify')
  Future<BaseResponse<ForgotPassData>> forgotPassVerify(
      @Body() ForgotPassVerifyRequest data);
  @POST('/user/auth/forgot-password/reset')
  Future<BaseResponse<BaseData>> resetPass(
      @Body() ResetPassRequest data, @Header('Reset-Token') String token);
}
