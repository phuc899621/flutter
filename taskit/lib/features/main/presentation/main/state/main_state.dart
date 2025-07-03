import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
sealed class MainState with _$MainState {
  const factory MainState({
    String? generateTaskText,
    String? error,
  }) = _MainState;
}
