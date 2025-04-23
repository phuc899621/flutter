import 'package:dio/dio.dart';


class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Ghi lại thông tin yêu cầu
    print('Request: ${options.method} ${options.uri}');
    print('Headers: ${options.headers}');
    print('Body: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Ghi lại thông tin phản hồi
    print('Response: ${response.statusCode} ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Ghi lại thông tin lỗi
    print('Error: ${err.response?.statusCode} ${err.message}');
    if (err.response != null) {
      print('Response data: ${err.response?.data}');
    }
    super.onError(err, handler);
  }
}