import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/application/auth_service.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';

import '../../../../application/token_service.dart';

class AuthInterceptor extends Interceptor {
  final TokenService _tokenService;
  final AuthService _authService;
  final Ref _ref;
  final Dio _dio;

  AuthInterceptor(this._tokenService, this._authService, this._dio, this._ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenService.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await _tokenService.getRefreshToken();
      if (refreshToken != null) {
        try {
          await _authService.refreshToken();
          final opts = err.requestOptions;
          final token = await _tokenService.getAccessToken();
          opts.headers['Authorization'] = 'Bearer $token';
          final response = await _dio.fetch(opts);
          return handler.resolve(response);
        } catch (e) {
          await _ref.read(authControllerProvider.notifier).logout();
        }
      }
    }
    handler.next(err);
  }
}
