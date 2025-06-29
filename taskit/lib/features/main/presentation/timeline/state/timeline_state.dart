import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../task/domain/entities/task_entity.dart';

part 'timeline_state.freezed.dart';

@freezed
sealed class TimelineState with _$TimelineState {
  const factory TimelineState({
    @Default([]) List<TaskEntity> tasks,
    @Default([]) List<TaskEntity> allTasks,
    @Default(true) bool isLoading,
    DateTime? focusDate,
  }) = _TimelineState;
}
