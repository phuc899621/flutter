import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/timeline/state/timeline_state.dart';
import 'package:taskit/features/task/application/task_service.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/log/logger_provider.dart';

final timelineControllerProvider =
    NotifierProvider<TimelineController, TimelineState>(TimelineController.new);

class TimelineController extends Notifier<TimelineState> {
  late StreamSubscription _taskSubscription;

  @override
  TimelineState build() {
    startListener();
    return TimelineState();
  }

  void startListener() {
    _taskSubscription =
        ref.watch(taskServiceProvider).watchAllTasks().listen((tasks) {
      state = state.copyWith(allTasks: tasks);
      logger.i('dates $tasks');
    });
  }

  void onCheck(int localId) {
    logger.i("Check $localId");
    ref.read(taskServiceProvider).updateTaskStatus(localId);
  }

  void onSubtaskCheck(int localId) =>
      ref.read(taskServiceProvider).updateSubtaskStatus(localId);

  void onDelete(int localId) =>
      ref.read(taskServiceProvider).deleteTask(localId);

  void onSubtaskDelete(int localId) =>
      ref.read(taskServiceProvider).deleteSubtask(localId);

  void setFocusDate(DateTime focusDate) {
    state = state.copyWith(
      focusDate: focusDate,
      tasks: _getTaskByDate(focusDate),
    );
  }

  List<TaskEntity> _getTaskByDate(DateTime focusDate) {
    final tasks = state.allTasks.where((task) {
      final dueDate = task.dueDate;
      logger.i('date $dueDate');
      return dueDate != null && dueDate.isSameDay(focusDate);
    }).toList();
    logger.i('date $tasks');
    return tasks;
  }
}
