import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories:true)
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    required String message,
    required T data,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(Map<String, dynamic> json,T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json,fromJsonT);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    required String email,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
