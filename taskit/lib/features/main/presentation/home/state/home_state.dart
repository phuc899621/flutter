import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../task/domain/entities/task_entity.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  factory HomeState(
      {String? error,
      @Default(false) bool isTodayTaskLoading,
      @Default(false) bool isTomorrowTaskLoading,
      @Default(false) bool isThisWeekLoading,
      @Default([]) List<TaskEntity> todayTasks,
      @Default([]) List<TaskEntity> pendingTasks,
      @Default([]) List<TaskEntity> todayCompletedTasks,
      @Default([]) List<TaskEntity> tomorrowTasks,
      @Default([]) List<TaskEntity> thisWeekTasks,
      @Default([]) List<TaskEntity> thisWeekOverDueTasks,
      @Default([]) List<TaskEntity> todayOverDueTasks,
      @Default([]) List<TaskEntity> thisWeekCompletedTasks,
      TaskEntity? selectedTask,
      @Default('') String userName}) = _HomeState;
}
