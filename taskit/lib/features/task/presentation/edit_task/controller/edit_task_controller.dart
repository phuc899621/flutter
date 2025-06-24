import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/task_service.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/task_priority_enum.dart';
import '../state/edit_task_state.dart';

final editTaskControllerProvider =
    AutoDisposeNotifierProvider<EditTaskController, EditTaskState>(
        EditTaskController.new);

class EditTaskController extends AutoDisposeNotifier<EditTaskState> {
  StreamSubscription? _taskSub;
  late StreamSubscription _categorySub;
  late StreamSubscription _subtaskSub;

  @override
  EditTaskState build() {
    _fetchCategory();
    return EditTaskState();
  }

  void dispose() {
    _taskSub?.cancel();
    _categorySub.cancel();
    _subtaskSub.cancel();
  }

  void updateTitle(String title) => ref
      .read(taskServiceProvider)
      .updateTaskTitle(state.task?.localId ?? -1, title);

  void updateDescription(String description) => ref
      .read(taskServiceProvider)
      .updateTaskDescription(state.task?.localId ?? -1, description);

  void updatePriority(TaskPriority priority) => ref
      .read(taskServiceProvider)
      .updateTaskPriority(state.task?.localId ?? -1, priority);

  void updateCategory(CategoryEntity category) => ref
      .read(taskServiceProvider)
      .updateTaskCategory(state.task?.localId ?? -1, category.localId);

  void updateDueDate(DateTime? dueDate) => ref
      .read(taskServiceProvider)
      .updateTaskDueDate(state.task?.localId ?? -1, dueDate);

  void updateDueTime(TimeOfDay? dueTime) {
    final task = state.task;
    if (task == null) return;
    final dueDate = task.dueDate;
    if (dueDate == null) return;
    if (dueTime == null) {
      ref
          .read(taskServiceProvider)
          .updateTaskHasTime(state.task?.localId ?? -1, false);
      return;
    }
    final newDueDate = DateTime(
        dueDate.year, dueDate.month, dueDate.day, dueTime.hour, dueTime.minute);
    ref
        .read(taskServiceProvider)
        .updateTaskDueDate(state.task?.localId ?? -1, newDueDate);
    ref
        .read(taskServiceProvider)
        .updateTaskHasTime(state.task?.localId ?? -1, true);
  }

  void updateSubtaskTitle(int localId, String title) {
    ref.read(taskServiceProvider).updateSubtaskTitle(localId, title);
  }

  void deleteSubtask(int localId) {
    ref.read(taskServiceProvider).deleteSubtask(localId);
  }

  void insertSubtasks() {
    final task = state.task;
    if (task != null) {
      ref.read(taskServiceProvider).insertSubtask(task.localId);
    }
  }

  void fetchTask(int localId) {
    if (_taskSub != null) return;
    _taskSub = ref
        .read(taskServiceProvider)
        .watchTaskByLocalId(localId)
        .listen((task) {
      state = state.copyWith(task: task);
    });
  }

  void _fetchCategory() {
    _categorySub =
        ref.read(taskServiceProvider).watchAllCategories().listen((categories) {
      state = state.copyWith(categories: categories);
    });
  }
}
