import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/main/domain/entity/message.dart';

part 'ai_state.freezed.dart';

@freezed
sealed class AiState with _$AiState {
  const factory AiState(
      {@Default(false) bool isLoading,
      @Default([]) List<Message> message,
      bool? isReceiveAiMessage}) = _AiState;
}
