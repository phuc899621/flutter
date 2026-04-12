import 'package:dio/dio.dart';

import '../../../../config/app/app_config.dart';

BaseOptions buildBaseOptions(){
  return BaseOptions(
    baseUrl: AppConfigs.baseUrl,
    connectTimeout: const Duration(seconds: 500),
    receiveTimeout: const Duration(seconds: 500),
    sendTimeout: const Duration(seconds: 100),
    contentType:Headers.jsonContentType
  );
}