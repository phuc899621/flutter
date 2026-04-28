import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/source/remote/auth_api.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/shared/application/credential_service.dart';
import 'package:taskit/shared/data/source/remote/network/dio_options.dart';

import '../../../../../features/auth/data/dto/req/refresh_token/refresh_token_request.dart';
import '../../../../application/network_status_provider.dart';
import '../../../../constants/network_status.dart';
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
  final _storage = ref.read(credentialServiceProvider);
  dio.interceptors.addAll([
    LoggingInterceptor(),
    AuthInterceptor(
      _storage,
      dio,
      onRefreshToken: (refreshToken, sessionId) async {
        final authApi = ref.read(authRefreshApiProvider);
        final result = await authApi.refreshToken(
          RefreshTokenRequest(refreshToken: refreshToken, sessionId: sessionId),
        );
        await _storage.saveTokens(
          result.data.accessToken,
          refreshToken,
          sessionId,
        );
      },
      onAuthExpired: () {
        ref.read(authControllerProvider.notifier).logout();
      },
      onInternetChecker: () =>
          ref.read(networkStatusProvider).value == NetworkStatus.online,
    ),
  ]);
  return dio;
});
