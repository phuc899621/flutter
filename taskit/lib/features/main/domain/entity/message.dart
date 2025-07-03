import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
sealed class Message with _$Message {
  const factory Message(
      {required String content,
      required bool isUser,
      required DateTime timestamp,
      required String id}) = _Message;
}
