import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/main/controller/main_controller.dart';
import 'package:taskit/features/main/presentation/main/state/task_generate_state.dart';
import 'package:taskit/features/task/application/task_service.dart';

import '../../../../../shared/log/logger_provider.dart';

final taskGenerateControllerProvider =
    AutoDisposeNotifierProvider<TaskGenerateController, TaskGenerateState>(
        TaskGenerateController.new);

class TaskGenerateController extends AutoDisposeNotifier<TaskGenerateState> {
  @override
  TaskGenerateState build() {
    return TaskGenerateState();
  }

  void setIsListening(bool isListening) {
    logger.i('setIsListening: $isListening');
    if (isListening != state.isListening) {
      state = state.copyWith(isListening: isListening);
    }
  }

  void setIsGenerating(bool isGenerating) =>
      state = state.copyWith(isGenerating: isGenerating);

  void setText(String text) {
    if (text != state.text) {
      state = state.copyWith(text: text);
    }
  }

  void setIsEditing(bool isEditing) =>
      state = state.copyWith(isEditing: isEditing);

  void generateTask() async {
    try {
      final aiService = ref.read(taskServiceProvider);
      state = state.copyWith(
          isGenerating: true, error: null, isGenerateSuccess: false);
      if (state.text.isEmpty) {
        state = state.copyWith(isGenerating: false, error: 'Text is empty');
        return;
      }
      final result = await aiService.generateAiTask(state.text);
      result.when((success) {
        final text = 'Task generated successfully with title: ${success.title}';
        ref.read(mainControllerProvider.notifier).setGenerateTaskText(text);
        state = state.copyWith(
            isGenerating: false, error: null, isGenerateSuccess: true);
      }, (error) {
        state = state.copyWith(error: error.message, isGenerating: false);
      });
    } catch (e, s) {
      logger.e(e);
      state = state.copyWith(error: e.toString(), isGenerating: false);
    }
  }
}
