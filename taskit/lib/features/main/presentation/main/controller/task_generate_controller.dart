import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/main/state/task_generate_state.dart';

final taskGenerateControllerProvider =
    AutoDisposeNotifierProvider<TaskGenerateController, TaskGenerateState>(
        TaskGenerateController.new);

class TaskGenerateController extends AutoDisposeNotifier<TaskGenerateState> {
  @override
  TaskGenerateState build() {
    return TaskGenerateState();
  }

  void setIsListening(bool isListening) =>
      state = state.copyWith(isListening: isListening);

  void setIsGenerating(bool isGenerating) =>
      state = state.copyWith(isGenerating: isGenerating);

  void setText(String text) {
    if (text != state.text) {
      state = state.copyWith(text: text);
    }
  }

  void setIsEditing(bool isEditing) =>
      state = state.copyWith(isEditing: isEditing);
}
