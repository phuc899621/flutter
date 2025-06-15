import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../task/domain/entities/task_entity.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  factory HomeState({
    String? error,
    @Default(false) bool isScheduledLoading,
    @Default(false) bool isDeadLineLoading,
    @Default(false) bool isToDoLoading,
    @Default([]) List<TaskEntity> scheduledTasks,
    @Default([]) List<TaskEntity> allTasks,
    TaskEntity? selectedTask,
  }) = _HomeState;
}
