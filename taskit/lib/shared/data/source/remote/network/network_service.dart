import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/source/remote/network/dio_options.dart';

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
    AuthInterceptor(tokenService, dio, ref),
  ]);
  return dio;
});
