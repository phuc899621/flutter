// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_api.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _CategoryApi implements CategoryApi {
  _CategoryApi(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<DataResponse<List<CategoryRes>>> fetch(String syncTime) async {
    final _extra = <String, dynamic>{'requireAuth': true};
    final queryParameters = <String, dynamic>{r'lastSyncTime': syncTime};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<List<CategoryRes>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/categories',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<CategoryRes>> _value;
    try {
      _value = DataResponse<List<CategoryRes>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<CategoryRes>(
                    (i) => CategoryRes.fromJson(i as Map<String, dynamic>),
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
  Future<DataResponse<AddCategoryRes>> create(
    AddCategoryReq addCategoryReq,
  ) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = addCategoryReq;
    final _options = _setStreamType<DataResponse<AddCategoryRes>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/categories',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<AddCategoryRes> _value;
    try {
      _value = DataResponse<AddCategoryRes>.fromJson(
        _result.data!,
        (json) => AddCategoryRes.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<CategoryRes>> update(
    UpdateCategoryReq request,
    String id,
  ) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<DataResponse<CategoryRes>>(
      Options(method: 'PUT', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/categories/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<CategoryRes> _value;
    try {
      _value = DataResponse<CategoryRes>.fromJson(
        _result.data!,
        (json) => CategoryRes.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<MessageResponse> delete(String id) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<MessageResponse>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/categories/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late MessageResponse _value;
    try {
      _value = MessageResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<CategoriesSyncRes>> syncCategories(
    CategoriesSyncReq categories,
  ) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = categories;
    final _options = _setStreamType<DataResponse<CategoriesSyncRes>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/categories/sync',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<CategoriesSyncRes> _value;
    try {
      _value = DataResponse<CategoriesSyncRes>.fromJson(
        _result.data!,
        (json) => CategoriesSyncRes.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<List<DeletedCategoriesSyncRes>>> syncDeleteCategories(
    DeletedCategoriesSyncReq categories,
  ) async {
    final _extra = <String, dynamic>{
      'requireAuth': true,
      'requireSession': true,
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = categories;
    final _options =
        _setStreamType<DataResponse<List<DeletedCategoriesSyncRes>>>(
          Options(method: 'DELETE', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/categories/sync',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<DeletedCategoriesSyncRes>> _value;
    try {
      _value = DataResponse<List<DeletedCategoriesSyncRes>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<DeletedCategoriesSyncRes>(
                    (i) => DeletedCategoriesSyncRes.fromJson(
                      i as Map<String, dynamic>,
                    ),
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
  Future<DataResponse<List<CategoryRes>>> pullCategories(
    String? lastSyncTime,
  ) async {
    final _extra = <String, dynamic>{'requireAuth': true};
    final queryParameters = <String, dynamic>{r'lastSyncTime': lastSyncTime};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<List<CategoryRes>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/categories/pull',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<CategoryRes>> _value;
    try {
      _value = DataResponse<List<CategoryRes>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<CategoryRes>(
                    (i) => CategoryRes.fromJson(i as Map<String, dynamic>),
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
