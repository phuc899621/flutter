import 'package:freezed_annotation/freezed_annotation.dart';

part 'default_result.freezed.dart';

@freezed
abstract class DefaultResult with _$DefaultResult {
  const factory DefaultResult({required String message}) = _DefaultResult;
}
