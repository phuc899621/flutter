import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/timeline/state/timeline_state.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/usecases/subtask/delete_subtask_usecase.dart';
import 'package:taskit/features/task/presentation/providers/tasks_provider.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../task/domain/entities/subtask_entity.dart';
import '../../../../task/domain/usecases/subtask/update_subtask_status_usecase.dart';
import '../../../../task/domain/usecases/task/delete_task_usecase.dart';
import '../../../../task/domain/usecases/task/update_task_status_usecase.dart';

final timelineControllerProvider =
    NotifierProvider<TimelineController, TimelineState>(TimelineController.new);

class TimelineController extends Notifier<TimelineState> {
  late StreamSubscription _taskSubscription;
  late final ProviderSubscription _authSub;

  @override
  TimelineState build() {
    ref.listen(tasksProvider, (_, next) {
      next.whenData((tasks) {
        state = state.copyWith(
          allTasks: tasks,
          tasks: _getTaskByDate(state.focusDate ?? DateTime.now(), tasks),
        );
        logger.i('[Timeline] tasks: $tasks');
      });
    });

    return TimelineState();
  }

  void onCheck(TaskEntity entity) => ref
      .read(updateTaskStatusUseCaseProvider)
      .call(
        entity.copyWith(
          status: entity.status == TaskStatus.completed
              ? TaskStatus.pending
              : TaskStatus.completed,
        ),
      );

  void onSubtaskCheck(SubtaskEntity entity) =>
      ref.read(updateSubtaskStatusUseCaseProvider).call(entity);

  void onDelete(TaskEntity task) =>
      ref.read(deleteTaskUseCaseProvider).call(task);

  void onSubtaskDelete(SubtaskEntity subtask) =>
      ref.read(deleteSubtaskUseCaseProvider).call(subtask);

  void setFocusDate(DateTime focusDate) {
    state = state.copyWith(
      focusDate: focusDate,
      tasks: _getTaskByDate(focusDate, state.allTasks),
    );
  }

  List<TaskEntity> _getTaskByDate(
    DateTime focusDate,
    List<TaskEntity> allTasks,
  ) {
    final tasks = allTasks.where((task) {
      final dueDate = task.dueDate;
      logger.i('date $dueDate');
      return dueDate != null && dueDate.isSameDay(focusDate);
    }).toList();
    logger.i('date $tasks');
    return tasks;
  }
}
