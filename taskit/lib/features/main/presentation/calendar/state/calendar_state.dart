import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../task/domain/entities/task_entity.dart';

part 'calendar_state.freezed.dart';

@freezed
sealed class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default([]) List<TaskEntity> tasks,
  }) = _CalendarState;
}
