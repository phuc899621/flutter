import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_result.freezed.dart';

@freezed
abstract class MessageResult with _$MessageResult {
  const factory MessageResult({required String message}) = _MessageResult;
}
