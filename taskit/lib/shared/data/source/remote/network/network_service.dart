import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/source/remote/network/dio_options.dart';

import 'network_service_interceptor.dart';



final networkServiceProvider=Provider<Dio>(
    (ref){
      final options=buildBaseOptions();
      final dio=Dio(options);
      dio.interceptors.add(LoggingInterceptor());
      return dio;
    }
);


