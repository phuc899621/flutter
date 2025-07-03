import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/ai/state/ai_state.dart';
import 'package:taskit/features/main/presentation/main/controller/main_controller.dart';
import 'package:taskit/features/task/application/task_service.dart';
import 'package:taskit/main_widget.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../domain/entity/message.dart';

final aiControllerProvider =
    AutoDisposeNotifierProvider<AiController, AiState>(AiController.new);

class AiController extends AutoDisposeNotifier<AiState> {
  @override
  AiState build() {
    // TODO: implement build
    return AiState();
  }

  void addMessage(Message message) {
    state = state.copyWith(message: [...state.message, message]);
  }

  void sendMessage(String s) async {
    try {
      state = state.copyWith(isLoading: true, isReceiveAiMessage: null);
      final errorController = ref.read(mainControllerProvider.notifier);
      final aiService = ref.read(taskServiceProvider);
      final languageCode = ref.read(languageCodeProvider);
      final result = await aiService.getAiAnswer(s, languageCode);
      logger.i('ask ai $result');
      result.when((value) {
        addMessage(Message(
            content: value,
            isUser: false,
            timestamp: DateTime.now(),
            id: DateTime.now().millisecondsSinceEpoch.toString()));
        state = state.copyWith(isLoading: false, isReceiveAiMessage: true);
      }, (error) {
        state = state.copyWith(isLoading: false);
        errorController.setError(error.message);
      });
    } catch (e) {
      logger.e(e);
      ref.read(mainControllerProvider.notifier).setError(e.toString());
      state = state.copyWith(isLoading: false);
    }
  }

  void setIspLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
