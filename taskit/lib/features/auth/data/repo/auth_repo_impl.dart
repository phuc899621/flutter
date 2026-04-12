import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/req/login/login_request.dart';
import 'package:taskit/features/auth/data/dto/res/login/login_data.dart';
import 'package:taskit/features/auth/domain/repo/auth_repo.dart';
import 'package:taskit/features/auth/data/source/local/auth_local.dart';
import 'package:taskit/shared/application/itoken_service.dart';
import 'package:taskit/shared/application/token_service.dart';
import 'package:taskit/shared/data/dto/response/base_response.dart';
import 'package:taskit/shared/helpers/base_response_helper.dart';
import 'package:taskit/shared/log/logger_provider.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';
import '../../../../shared/data/dto/response/base_data.dart';
import '../../../../shared/exception/failure.dart';
import '../dto/req/forgot_pass/forgot_pass.dart';
import '../dto/req/forgot_pass/forgot_pass_verify.dart';
import '../dto/req/forgot_pass/reset_pass.dart';
import '../dto/req/signup/signup_request.dart';
import '../dto/req/signup/signup_verify_request.dart';
import '../dto/res/forgot_pass/verify.dart';
import '../dto/res/login/login_verify_data.dart';
import '../source/local/auth_local_impl.dart';
import '../source/remote/auth_api.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  final authApi = ref.watch(authApiProvider);
  final iTokenService = ref.watch(tokenServiceProvider);
  final iAuthLocalDataSource = ref.watch(authLocalDataSourceProvider);
  return AuthRepoImpl(
    authApi,
    iTokenService,
    iAuthLocalDataSource,
  );
});

class AuthRepoImpl with DioExceptionMapper implements AuthRepo {
  final AuthApi _authApi;
  final ITokenService _iTokenService;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl(this._authApi, this._iTokenService, this._authLocalDataSource);

  /*
  * Login
  * */
  //region LOGIN
  @override
  Future<BaseResponse<LoginData>> login(LoginRequest data) async {
    return callSafe(() async{
      final response = await _authApi.login(data);
      final responseData = BaseResponseHelper.requireData(response);
      await _authLocalDataSource.cacheLogin(responseData);
      return response;
    }, errorMessage: "An unexpected error occurred when login");
  }

  @override
  Future<BaseResponse<LoginVerifyData>> checkLogin() async {
    final token = await _iTokenService.getToken();
    return callSafe(() async =>await _authApi.checkLogin('Bearer $token')
    , errorMessage: "An unexpected error occurred when verify login");
  }
  //endregion

  /*
  * Sign Up
  * */
  @override
  Future<BaseResponse<BaseData>> signup(SignupRequest data) async {
    return callSafe(() async => await _authApi.signup(data),
        errorMessage: "An unexpected error occurred when sign up");
  }

  @override
  Future<BaseResponse<BaseData>> signupVerify(SignupVerifyRequest data) async {
    return callSafe(() async => await _authApi.signupVerify(data),
        errorMessage: "An unexpected error occurred when verify signup");
  }

  /*
  * Forgot Password
  * */
  @override
  Future<BaseResponse<BaseData>> forgotPass(ForgotPassRequest data) async {
    return callSafe(() async => await _authApi.forgotPass(data),
        errorMessage: "An unexpected error occurred when sending forgot password");
  }

  @override
  Future<BaseResponse<BaseData>> resetPass(
      ResetPassRequest data, String token) async {
    return callSafe(() async => await _authApi.resetPass(data, token),
        errorMessage: "An unexpected error occurred when reset password");
  }

  @override
  Future<BaseResponse<ForgotPassData>> forgotPassVerify(
      ForgotPassVerifyRequest data) async {
    return callSafe(() async => await _authApi.forgotPassVerify(data),
        errorMessage: "An unexpected error occurred when verify for forgot password");
  }
}
