import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/source/remote/auth_api.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/shared/data/source/remote/network/dio_options.dart';

import '../../../../../features/auth/data/dto/req/refresh_token/refresh_token_request.dart';
import '../../../../application/token_service_impl.dart';
import 'auth_interceptor.dart';
import 'logging_interceptor.dart';

final basicDioProvider = Provider<Dio>((ref) {
  final dio = Dio(buildBaseOptions());
  dio.interceptors.add(LoggingInterceptor());
  return dio;
});

final networkServiceProvider = Provider<Dio>((ref) {
  final options = buildBaseOptions();
  final dio = Dio(options);
  final tokenService = ref.read(tokenServiceProvider);
  dio.interceptors.addAll([
    LoggingInterceptor(),
    AuthInterceptor(
      tokenService,
      dio,
      onRefreshToken: (refreshToken, sessionId) async {
        final authApi = ref.read(authRefreshApiProvider);
        final result = await authApi.refreshToken(
          RefreshTokenRequest(refreshToken: refreshToken, sessionId: sessionId),
        );
        await tokenService.saveTokens(
          result.data.accessToken,
          refreshToken,
          sessionId,
        );
      },
      onAuthExpired: () {
        ref.read(authControllerProvider.notifier).logout();
      },
    ),
  ]);
  return dio;
});
