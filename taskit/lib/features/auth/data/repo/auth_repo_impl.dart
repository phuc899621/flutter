import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taskit/features/auth/data/dto/req/login/login_request.dart';
import 'package:taskit/features/auth/data/dto/req/logout/logout_request.dart';
import 'package:taskit/features/auth/data/mapper/forgot_password_mapper.dart';
import 'package:taskit/features/auth/data/mapper/login_mapper.dart';
import 'package:taskit/features/auth/data/mapper/signup_mapper.dart';
import 'package:taskit/features/auth/data/repo/auth_repo.dart';
import 'package:taskit/features/auth/data/source/local/auth_local.dart';
import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';
import 'package:taskit/features/auth/domain/entities/signup/signup_entity.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';
import 'package:taskit/shared/application/token_service.dart';
import 'package:taskit/shared/application/token_service_impl.dart';
import 'package:taskit/shared/data/mapper/result_mapper.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';
import 'package:taskit/shared/domain/entities/data_result.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../shared/data/source/remote/google_sign_in.dart';
import '../../domain/entities/forgot_pass/forgot_pass_entity.dart';
import '../dto/req/refresh_token/refresh_token_request.dart';
import '../mapper/user_mapper.dart';
import '../source/remote/auth_api.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  final authApi = ref.watch(authApiProvider);
  final authRefreshApi = ref.watch(authRefreshApiProvider);
  final tokenService = ref.watch(tokenServiceProvider);
  final authLocalDataSource = ref.watch(authLocalDataSourceProvider);
  final googleSignIn = ref.watch(googleSignInProvider);
  return AuthRepoImpl(
    authApi,
    authRefreshApi,
    tokenService,
    authLocalDataSource,
    googleSignIn,
  );
});

class AuthRepoImpl with DioExceptionMapper implements AuthRepo {
  final AuthApi _authApi;
  final AuthApi _authRefreshApi;
  final TokenService _tokenService;
  final AuthLocalDataSource _authLocal;
  final GoogleSignIn _googleSignIn;

  AuthRepoImpl(
    this._authApi,
    this._authRefreshApi,
    this._tokenService,
    this._authLocal,
    this._googleSignIn,
  );

  /*
  * Login
  * */
  //region LOGIN
  @override
  Future<MessageResult> login(CredentialsLoginEntity data) async {
    return callSafe(() async {
      final response = await _authApi.login(data.toDto());
      await _tokenService.saveTokens(
        response.data.accessToken,
        response.data.refreshToken,
        response.data.sessionId,
      );
      //await _authLocalDataSource.cacheLogin(response.data);
      return response.toMessage();
    }, errorMessage: "An unexpected error occurred when login");
  }

  @override
  Future<MessageResult> loginWithGoogle() {
    return callSafe(() async {
      try {
        await _googleSignIn.signOut();
      } catch (e) {
        logger.e(e.toString());
      }
      final GoogleSignInAccount account;
      if (_googleSignIn.supportsAuthenticate()) {
        try {
          account = await _googleSignIn.authenticate();
        } catch (e) {
          throw Exception(e.toString());
        }
      } else {
        throw Exception('Google sign in not supported');
      }

      final idToken = account.authentication.idToken;
      if (idToken == null) {
        throw Exception('idToken is null');
      }
      final response = await _authApi.loginWithGoogle(
        GoogleLoginRequest(token: idToken),
      );
      await _tokenService.saveTokens(
        response.data.accessToken,
        response.data.refreshToken,
        response.data.sessionId,
      );
      return response.toMessage();
    }, errorMessage: "An unexpected error occurred when login");
  }

  @override
  Future<UserEntity?> fetchUserLocal() async {
    return callSafe(() async {
      final user = await _authLocal.getUser();
      return user?.toEntity();
    }, errorMessage: "An unexpected error occurred when verify login");
  }

  @override
  Future<DataResult<UserEntity>> fetchUser() async => callSafe(() async {
    return callSafe(() async {
      final response = await _authApi.fetchUser();
      logger.w('🚀 AuthRepoImpl: fetchUser success. User: ${response.data}');
      final userLocalData = await _authLocal.cacheUser(response.data);
      return response.toResult(
        UserEntity(
          localId: userLocalData,
          remoteId: response.data.id,
          name: response.data.name,
          email: response.data.email,
          avatar: response.data.avatar,
        ),
      );
    });
  });

  @override
  Future<MessageResult> refreshToken() => callSafe(() async {
    final token = await _tokenService.getRefreshToken();
    final sessionId = await _tokenService.getSessionId();
    return callSafe(() async {
      final response = await _authRefreshApi.refreshToken(
        RefreshTokenRequest(refreshToken: token!, sessionId: sessionId!),
      );
      await _tokenService.saveTokens(
        response.data.accessToken,
        token,
        sessionId,
      );
      return response.toMessage();
    });
  });

  @override
  Future<MessageResult> logout() async => callSafe(() async {
    final token = await _tokenService.getRefreshToken();
    final sessionId = await _tokenService.getSessionId();
    final response = await _authApi.logout(
      LogoutRequest(refreshToken: token!, sessionId: sessionId!),
    );
    await _tokenService.deleteTokens();
    return response.toResult();
  }, errorMessage: "An unexpected error occurred when logout");

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
