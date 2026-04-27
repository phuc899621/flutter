import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:taskit/shared/application/credential_service.dart';

import '../../../../constants/auth_extra.dart';

class AuthInterceptor extends Interceptor {
  final CredentialService _storage;
  final Dio _dio;
  final Future<void> Function(String refreshToken, String sessionId)
  onRefreshToken;
  final VoidCallback onAuthExpired;
  Future<void>? _refreshFuture;

  AuthInterceptor(
    this._storage,
    this._dio, {
    required this.onRefreshToken,
    required this.onAuthExpired,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requireAuth = options.extra[AuthExtra.requireAuth.name] ?? false;
    if (requireAuth) {
      final token = await _storage.getAccessToken();
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final autoRefresh =
        err.requestOptions.extra[AuthExtra.refresh.name] ?? true;
    if (err.type == DioExceptionType.badResponse &&
        err.response?.statusCode == 401 &&
        autoRefresh) {
      final refreshToken = await _storage.getRefreshToken();
      final sessionId = await _storage.getSessionId();
      if (refreshToken == null || sessionId == null) {
        onAuthExpired();
        return handler.next(err);
      }
      try {
        _refreshFuture ??= onRefreshToken(refreshToken, sessionId);
        await _refreshFuture;
        _refreshFuture = null;

        final opts = err.requestOptions;
        final token = await _storage.getAccessToken();
        opts.headers['Authorization'] = 'Bearer $token';
        final response = await _dio.fetch(opts);
        return handler.resolve(response);
      } catch (e) {
        _refreshFuture = null;
        if (e is DioException &&
            e.type == DioExceptionType.badResponse &&
            e.response?.statusCode == 401) {
          onAuthExpired();
        }
        return handler.reject(err);
      }
    }
    handler.next(err);
  }
}
