import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'network_service_interceptor.dart';

final networkServiceProvider=Provider<Dio>(
    (ref){
      final options=BaseOptions(
        baseUrl: 'http://143.198.84.219:8080',
        connectTimeout: const Duration(seconds: 100),
        receiveTimeout: const Duration(seconds: 100),
        sendTimeout: const Duration(seconds: 100),
      );

      final dio=Dio(options);
      //final networkServiceInterceptor=ref.watch(networkServiceInterceptorProvider(dio));
      /*dio.interceptors.addAll([
        HttpFormatter(loggingFilter: (request, response, error) => kDebugMode),
        networkServiceInterceptor
      ]);*/
      return dio;
    }
);