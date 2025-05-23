import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure implements Exception {
  const factory Failure({
    required String message,
    int? statusCode,
    Object? exception,
    @Default(StackTrace.empty) StackTrace stackTrace,
  }) = _Failure;
}