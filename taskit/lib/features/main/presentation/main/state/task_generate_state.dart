import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_generate_state.freezed.dart';

@freezed
sealed class TaskGenerateState with _$TaskGenerateState {
  const factory TaskGenerateState({
    @Default(false) bool isListening,
    @Default(false) bool isGenerating,
    @Default('') String text,
    bool? isGenerateSuccess,
    String? error,
    @Default(false) bool isEditing,
  }) = _TaskGenerateState;
}
