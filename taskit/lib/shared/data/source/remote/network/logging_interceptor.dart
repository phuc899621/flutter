import 'package:dio/dio.dart';
import 'package:taskit/shared/log/logger_provider.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra['startTime'] = DateTime.now().millisecondsSinceEpoch;
    final origin = _getCallOrigin();
    logger.d(
      'REQUEST [$origin]\n'
      'Headers: ${options.headers}\n'
      'URL:    ${options.method} ${options.uri}\n'
      'Body:   ${options.data ?? 'empty'}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final duration = _getDuration(response.requestOptions);
    logger.i(
      'RESPONSE [$duration]\n'
      'Status: ${response.statusCode}\n'
      'URL:    ${response.requestOptions.uri}\n'
      'Data:   ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final duration = _getDuration(err.requestOptions);
    logger.e(
      'ERROR [$duration]\n'
      'Status: ${err.response?.statusCode ?? 'No Status'}\n'
      'URL:    ${err.requestOptions.uri}\n'
      'Msg:    ${err.message}\n'
      'Data:   ${err.response?.data}',
      error: err,
      stackTrace: err.stackTrace,
    );
    super.onError(err, handler);
  }

  String _getDuration(RequestOptions options) {
    final startTime = options.extra['startTime'] as int?;
    if (startTime == null) return '0ms';
    return '${DateTime.now().millisecondsSinceEpoch - startTime}ms';
  }

  String _getCallOrigin() {
    try {
      final lines = StackTrace.current.toString().split('\n');
      final originLine = lines.firstWhere(
        (line) =>
            line.contains('package:taskit') &&
            !line.contains('logging_interceptor.dart') &&
            !line.contains('dio'),
        orElse: () => '',
      );
      if (originLine.isEmpty) return 'unknown';
      return originLine.split('/').last.replaceAll(')', '').trim();
    } catch (_) {
      return 'unknown';
    }
  }
}
