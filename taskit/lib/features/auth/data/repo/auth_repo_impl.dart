import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/req/login/login_request.dart';
import 'package:taskit/features/auth/data/dto/req/logout/logout_request.dart';
import 'package:taskit/features/auth/data/mapper/login_mapper.dart';
import 'package:taskit/features/auth/data/repo/auth_repo.dart';
import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';
import 'package:taskit/shared/application/credential_service.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/data/mapper/result_mapper.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';

import '../../../../shared/log/logger_provider.dart';
import '../dto/req/refresh_token/refresh_token_request.dart';
import '../source/remote/auth_api.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  final authApi = ref.watch(authApiProvider);
  final authRefreshApi = ref.watch(authRefreshApiProvider);
  final storage = ref.watch(credentialServiceProvider);
  final sessionStorage = ref.watch(sessionServiceProvider);
  return AuthRepoImpl(authApi, authRefreshApi, storage, sessionStorage);
});

class AuthRepoImpl with DioExceptionMapper implements AuthRepo {
  final AuthApi _authApi;
  final AuthApi _authRefreshApi;
  final CredentialService _storage;
  final SessionService _sessionStorage;

  AuthRepoImpl(
    this._authApi,
    this._authRefreshApi,
    this._storage,
    this._sessionStorage,
  );

  /*
  * Login
  * */
  //region LOGIN
  @override
  Future<MessageResult> login(CredentialsLoginEntity data) =>
      callSafe(() async {
        logger.i('[AuthRepo] initial login for user ${data.email}');
        final response = await _authApi.login(data.toDto());
        await _storage.saveTokens(
          response.data.accessToken,
          response.data.refreshToken,
          response.data.sessionId,
        );
        logger.d('[AuthRepo]: Login successful, tokens persisted locally.');
        return response.toMessage();
      }, errorMessage: "Login failed");

  @override
  Future<MessageResult> loginWithGoogle(String idToken) {
    return callSafe(() async {
      logger.i(
        '[AuthRepo] initial login with google for user with idToken $idToken',
      );
      final response = await _authApi.loginWithGoogle(
        GoogleLoginRequest(token: idToken),
      );
      await _storage.saveTokens(
        response.data.accessToken,
        response.data.refreshToken,
        response.data.sessionId,
      );
      logger.d('[AuthRepo]: Login successful, tokens persisted locally.');
      return response.toMessage();
    }, errorMessage: "Login with Google failed");
  }

  @override
  Future<MessageResult> refreshToken() => callSafe(() async {
    logger.i('[AuthRepo] refreshing token');
    final token = await _storage.getRefreshToken();
    final sessionId = await _storage.getSessionId();
    if (token == null || sessionId == null) {
      logger.w(
        '[AuthRepo]: Refresh Token aborting, no refresh token or session id found\n'
        'Token: $token\n'
        'SessionId: $sessionId',
      );
      throw Exception('No refresh token or session id found');
    }
    final response = await _authRefreshApi.refreshToken(
      RefreshTokenRequest(refreshToken: token, sessionId: sessionId),
    );
    await _storage.saveTokens(response.data.accessToken, token, sessionId);
    logger.d('[AuthRepo]: Token refreshed, tokens persisted locally.');
    return response.toMessage();
  });

  @override
  Future<void> logout() async => callSafe(() async {
    logger.i('[AuthRepo] logging out');
    final token = await _storage.getRefreshToken();
    final sessionId = await _storage.getSessionId();
    if (token != null && sessionId != null) {
      try {
        await _authApi.logout(
          LogoutRequest(refreshToken: token!, sessionId: sessionId!),
        );
        logger.d('[AuthRepo]: Logout successful, tokens deleted locally.');
      } catch (e) {
        logger.e('[AuthRepo]: Logout failed, tokens not deleted locally.');
      }
    }
    await _storage.deleteTokens();
    await _sessionStorage.deleteActiveUserId();
    await _sessionStorage.deleteLastSyncTime();
  }, errorMessage: "Logout failed");

  //endregion
}
