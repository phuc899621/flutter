import 'package:dio/dio.dart';

import '../../../../config/app/app_config.dart';

BaseOptions buildBaseOptions() {
  return BaseOptions(
    baseUrl: AppConfigs.baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    sendTimeout: const Duration(seconds: 5),
    contentType: Headers.jsonContentType,
  );
}
