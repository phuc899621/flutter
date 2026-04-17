import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/req/login/login_request.dart';
import 'package:taskit/features/auth/data/dto/res/login/login_data.dart';
import 'package:taskit/features/auth/data/mapper/forgot_password_mapper.dart';
import 'package:taskit/features/auth/data/mapper/signup_mapper.dart';
import 'package:taskit/features/auth/data/source/local/auth_local.dart';
import 'package:taskit/features/auth/domain/entities/signup/signup_entity.dart';
import 'package:taskit/features/auth/domain/repo/auth_repo.dart';
import 'package:taskit/shared/application/itoken_service.dart';
import 'package:taskit/shared/application/token_service.dart';
import 'package:taskit/shared/data/dto/response/data_response.dart';
import 'package:taskit/shared/data/mapper/result_mapper.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';
import 'package:taskit/shared/domain/entities/data_result.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';
import 'package:taskit/shared/helpers/base_response_helper.dart';

import '../../domain/entities/forgot_pass/forgot_pass_entity.dart';
import '../dto/res/login/login_verify_data.dart';
import '../source/local/auth_local_impl.dart';
import '../source/remote/auth_api.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  final authApi = ref.watch(authApiProvider);
  final iTokenService = ref.watch(tokenServiceProvider);
  final iAuthLocalDataSource = ref.watch(authLocalDataSourceProvider);
  return AuthRepoImpl(authApi, iTokenService, iAuthLocalDataSource);
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
  Future<DataResponse<LoginData>> login(LoginRequest data) async {
    return callSafe(() async {
      final response = await _authApi.login(data);
      final responseData = BaseResponseHelper.requireData(response);
      await _authLocalDataSource.cacheLogin(responseData);
      return response;
    }, errorMessage: "An unexpected error occurred when login");
  }

  @override
  Future<DataResponse<LoginVerifyData>> checkLogin() async {
    final token = await _iTokenService.getToken();
    return callSafe(
      () async => await _authApi.checkLogin('Bearer $token'),
      errorMessage: "An unexpected error occurred when verify login",
    );
  }

  //endregion

  /*
  * Sign Up
  * */
  @override
  Future<MessageResult> signup(SignupRegisterEntity data) async {
    return callSafe(
      () async => (await _authApi.signup(data.toDto())).toResult(),
      errorMessage: "An unexpected error occurred when sign up",
    );
  }

  @override
  Future<MessageResult> signupVerify(SignupVerifyEntity data) async {
    return callSafe(
      () async => (await _authApi.signupVerify(data.toDto())).toResult(),
      errorMessage: "An unexpected error occurred when verify signup",
    );
  }

  @override
  Future<MessageResult> signupResend(SignupResendEntity data) async {
    return callSafe(
      () async => (await _authApi.signupResend(data.toDto())).toResult(),
      errorMessage: "An unexpected error occurred when resend signup",
    );
  }

  /*
  * Forgot Password
  * */
  @override
  Future<MessageResult> forgotPass(ForgotPasswordEntity data) async {
    return callSafe(
      () async => (await _authApi.forgotPass(data.toDto())).toResult(),
      errorMessage: "An unexpected error occurred when sending forgot password",
    );
  }

  @override
  Future<MessageResult> forgotPassReset(ForgotPasswordResetEntity data) async {
    return callSafe(
      () async => (await _authApi.forgotPassReset(data.toDto())).toResult(),
      errorMessage: "An unexpected error occurred when reset password",
    );
  }

  @override
  Future<DataResult<ForgotPasswordVerifyResultEntity>> forgotPassVerify(
    ForgotPasswordVerifyEntity data,
  ) async {
    return callSafe(
      () async {
        final response = await _authApi.forgotPassVerify(data.toDto());
        return response.toResult(response.data.toEntity());
      },
      errorMessage:
          "An unexpected error occurred when verify for forgot password",
    );
  }

  @override
  Future<MessageResult> forgotPassResend(
    ForgotPasswordResendEntity data,
  ) async {
    return callSafe(
      () async => (await _authApi.forgotPassResend(data.toDto())).toResult(),
      errorMessage:
          "An unexpected error occurred when resend otp for forgot password",
    );
  }
}
