import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_response.freezed.dart';
part 'data_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class DataResponse<T> with _$DataResponse<T> {
  const factory DataResponse({required String message, required T data}) =
      _DataResponse<T>;

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$DataResponseFromJson(json, fromJsonT);
}
