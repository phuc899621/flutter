import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/network/dio_options.dart';

import 'network_service_interceptor.dart';



final networkServiceProvider=Provider<Dio>(
    (ref){
      final options=buildBaseOptions();
      final dio=Dio(options);
      //final networkServiceInterceptor=ref.watch(networkServiceInterceptorProvider(dio));
      /*dio.interceptors.addAll([
        HttpFormatter(loggingFilter: (request, response, error) => kDebugMode),
        networkServiceInterceptor
      ]);*/
      dio.interceptors.add(LoggingInterceptor());
      return dio;
    }
);


