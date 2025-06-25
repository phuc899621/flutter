import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../task/domain/entities/task_entity.dart';

part 'list_state.freezed.dart';

@freezed
sealed class ListState with _$ListState {
  const factory ListState({
    @Default(true) bool isLoading,
    @Default([]) List<TaskEntity> allTask,
    @Default([]) List<TaskEntity> filteringTask,
    @Default([]) List<TaskEntity> filteringPendingTask,
    @Default([]) List<TaskEntity> filteringCompletedTask,
    @Default([]) List<TaskEntity> filteringScheduledTask,
    @Default('') String searchText,
  }) = _ListState;
}
