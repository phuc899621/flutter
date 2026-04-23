import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_result.freezed.dart';

@freezed
abstract class DataResult<T> with _$DataResult<T> {
  const factory DataResult({required T data, required String message}) =
      _DataResult<T>;
}
