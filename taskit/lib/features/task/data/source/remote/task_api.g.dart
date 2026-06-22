// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_api.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _TaskApi implements TaskApi {
  _TaskApi(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<DataResponse<List<String>>> getAiCategory(
    String token,
    AiCategoryReq categoryReq,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = categoryReq;
    final _options = _setStreamType<DataResponse<List<String>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/ai/category',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<String>> _value;
    try {
      _value = DataResponse<List<String>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json.map<String>((i) => i as String).toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<TaskRes>> createTask(AddTaskReq addTaskReq) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = addTaskReq;
    final _options = _setStreamType<DataResponse<TaskRes>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/tasks',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<TaskRes> _value;
    try {
      _value = DataResponse<TaskRes>.fromJson(
        _result.data!,
        (json) => TaskRes.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<UpdateTaskRes>> updateTask(
    String taskId,
    UpdateTaskReq updateTaskReq,
  ) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = updateTaskReq;
    final _options = _setStreamType<DataResponse<UpdateTaskRes>>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/tasks/${taskId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<UpdateTaskRes> _value;
    try {
      _value = DataResponse<UpdateTaskRes>.fromJson(
        _result.data!,
        (json) => UpdateTaskRes.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<BaseData>> deleteTask(String taskId) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<BaseData>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/tasks/${taskId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<BaseData> _value;
    try {
      _value = DataResponse<BaseData>.fromJson(
        _result.data!,
        (json) => BaseData.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<TasksSyncRes>> syncTasks(TasksSyncReq tasks) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = tasks;
    final _options = _setStreamType<DataResponse<TasksSyncRes>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/tasks/sync',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<TasksSyncRes> _value;
    try {
      _value = DataResponse<TasksSyncRes>.fromJson(
        _result.data!,
        (json) => TasksSyncRes.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<List<DeletedTasksSyncRes>>> syncDeletedTasks(
    DeletedTasksSyncReq tasks,
  ) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = tasks;
    final _options = _setStreamType<DataResponse<List<DeletedTasksSyncRes>>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/tasks/sync',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<DeletedTasksSyncRes>> _value;
    try {
      _value = DataResponse<List<DeletedTasksSyncRes>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<DeletedTasksSyncRes>(
                    (i) =>
                        DeletedTasksSyncRes.fromJson(i as Map<String, dynamic>),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<List<TaskRes>>> pullTasks(String? lastSyncTime) async {
    final _extra = <String, dynamic>{'requireAuth': true};
    final queryParameters = <String, dynamic>{r'lastSyncTime': lastSyncTime};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<List<TaskRes>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/tasks/pull',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<TaskRes>> _value;
    try {
      _value = DataResponse<List<TaskRes>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<TaskRes>(
                    (i) => TaskRes.fromJson(i as Map<String, dynamic>),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
