import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/main/state/main_state.dart';

final mainControllerProvider =
    NotifierProvider<MainController, MainState>(MainController.new);

class MainController extends Notifier<MainState> {
  @override
  MainState build() => MainState();

  void setGenerateTaskText(String text) =>
      state = state.copyWith(generateTaskText: text);

  void setError(String text) => state = state.copyWith(error: text);
}
