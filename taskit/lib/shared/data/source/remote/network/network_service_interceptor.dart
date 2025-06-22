import 'package:dio/dio.dart';
import 'package:taskit/shared/log/logger_provider.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Ghi lại thông tin yêu cầu
    logger.i('Request: ${options.method} ${options.uri}');
    logger.i('Headers: ${options.headers}');
    logger.i('Body: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Ghi lại thông tin phản hồi
    logger.i('Response: ${response.statusCode} ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Ghi lại thông tin lỗi
    logger.e('Error: ${err.response?.statusCode} ${err.message}');
    if (err.response != null) {
      logger.e('Response data: ${err.response?.data}');
    }
    super.onError(err, handler);
  }
}
