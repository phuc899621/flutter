import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/req/login/login_request.dart';
import 'package:taskit/features/auth/data/dto/req/logout/logout_request.dart';
import 'package:taskit/features/auth/data/mapper/login_mapper.dart';
import 'package:taskit/features/auth/data/repo/auth_repo.dart';
import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';
import 'package:taskit/shared/application/credential_service.dart';
import 'package:taskit/shared/data/mapper/result_mapper.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';
import 'package:taskit/shared/domain/entities/message_result.dart';

import '../dto/req/refresh_token/refresh_token_request.dart';
import '../source/remote/auth_api.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  final authApi = ref.watch(authApiProvider);
  final authRefreshApi = ref.watch(authRefreshApiProvider);
  final storage = ref.watch(credentialServiceProvider);
  return AuthRepoImpl(authApi, authRefreshApi, storage);
});

class AuthRepoImpl with DioExceptionMapper implements AuthRepo {
  final AuthApi _authApi;
  final AuthApi _authRefreshApi;
  final CredentialService _storage;

  AuthRepoImpl(this._authApi, this._authRefreshApi, this._storage);

  /*
  * Login
  * */
  //region LOGIN
  @override
  Future<MessageResult> login(CredentialsLoginEntity data) async {
    return callSafe(() async {
      final response = await _authApi.login(data.toDto());
      await _storage.saveTokens(
        response.data.accessToken,
        response.data.refreshToken,
        response.data.sessionId,
      );
      return response.toMessage();
    }, errorMessage: "An unexpected error occurred when login");
  }

  @override
  Future<MessageResult> loginWithGoogle(String idToken) {
    return callSafe(() async {
      final response = await _authApi.loginWithGoogle(
        GoogleLoginRequest(token: idToken),
      );
      await _storage.saveTokens(
        response.data.accessToken,
        response.data.refreshToken,
        response.data.sessionId,
      );
      return response.toMessage();
    }, errorMessage: "An unexpected error occurred when login");
  }

  @override
  Future<MessageResult> refreshToken() => callSafe(() async {
    final token = await _storage.getRefreshToken();
    final sessionId = await _storage.getSessionId();
    return callSafe(() async {
      final response = await _authRefreshApi.refreshToken(
        RefreshTokenRequest(refreshToken: token!, sessionId: sessionId!),
      );
      await _storage.saveTokens(response.data.accessToken, token, sessionId);
      return response.toMessage();
    });
  });

  @override
  Future<MessageResult> logout() async => callSafe(() async {
    final token = await _storage.getRefreshToken();
    final sessionId = await _storage.getSessionId();
    final response = await _authApi.logout(
      LogoutRequest(refreshToken: token!, sessionId: sessionId!),
    );
    await _storage.deleteTokens();
    return response.toResult();
  }, errorMessage: "An unexpected error occurred when logout");

  //endregion
}
