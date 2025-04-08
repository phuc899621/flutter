import 'package:dio/dio.dart';
import 'package:taskit/config/app.dart';

BaseOptions buildBaseOptions(){
  return BaseOptions(
    baseUrl: AppConfigs.baseUrl,
    connectTimeout: const Duration(seconds: 100),
    receiveTimeout: const Duration(seconds: 100),
    sendTimeout: const Duration(seconds: 100),
    contentType:Headers.jsonContentType
  );
}