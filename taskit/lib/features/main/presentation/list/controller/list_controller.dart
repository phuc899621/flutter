import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/list/state/list_state.dart';
import 'package:taskit/shared/extension/string.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../task/application/task_service.dart';
import '../../../../task/domain/entities/task_entity.dart';
import '../../../../task/domain/entities/task_status_enum.dart';

final listControllerProvider =
    NotifierProvider<ListController, ListState>(ListController.new);

class ListController extends Notifier<ListState> {
  late StreamSubscription _taskSub;

  @override
  ListState build() {
    _startTaskListener();
    return const ListState();
  }

  void _startTaskListener() {
    _taskSub = ref.watch(taskServiceProvider).watchAllTasks().listen((tasks) {
      state = state.copyWith(
          filteringTask: _filteringTasks(tasks),
          allTask: tasks,
          filteringPendingTask: _filteringPendingTasks(tasks),
          filteringCompletedTask: _filteringCompletedTasks(tasks),
          filteringScheduledTask: _filteringScheduledTasks(tasks));
    });
  }

  void onCheck(int localId) =>
      ref.read(taskServiceProvider).updateTaskStatus(localId);

  void onSubtaskCheck(int localId) =>
      ref.read(taskServiceProvider).updateSubtaskStatus(localId);

  void onDelete(int localId) =>
      ref.read(taskServiceProvider).deleteTask(localId);

  void onSubtaskDelete(int localId) =>
      ref.read(taskServiceProvider).deleteSubtask(localId);

  void onEdit(int localId) {}

  void setSearchText(String text) {
    logger.i('Search text: $text');
    state = state.copyWith(searchText: text);
  }

  void callUpdateFilteringTask() {
    state = state.copyWith(
        filteringTask: _filteringTasks(state.allTask),
        filteringPendingTask: _filteringPendingTasks(state.allTask),
        filteringCompletedTask: _filteringCompletedTasks(state.allTask),
        filteringScheduledTask: _filteringScheduledTasks(state.allTask));
  }

  List<TaskEntity> _filteringTasks(List<TaskEntity> tasks) {
    logger.i('Filtering tasks: ${state.searchText}');
    return tasks.where((task) {
      final matchesText = state.searchText.trim().isEmpty
          ? true
          : task.title.containIgnoreCase(state.searchText);
      return matchesText;
    }).toList();
  }

  List<TaskEntity> _filteringPendingTasks(List<TaskEntity> tasks) {
    logger.i('Filtering tasks: ${state.searchText}');
    return tasks.where((task) {
      final matchesText = state.searchText.trim().isEmpty
          ? true
          : task.title.containIgnoreCase(state.searchText);
      return matchesText && task.status == TaskStatus.pending;
    }).toList();
  }

  List<TaskEntity> _filteringCompletedTasks(List<TaskEntity> tasks) {
    logger.i('Filtering tasks: ${state.searchText}');
    return tasks.where((task) {
      final matchesText = state.searchText.trim().isEmpty
          ? true
          : task.title.containIgnoreCase(state.searchText);
      return matchesText && task.status == TaskStatus.completed;
    }).toList();
  }

  List<TaskEntity> _filteringScheduledTasks(List<TaskEntity> tasks) {
    logger.i('Filtering tasks: ${state.searchText}');
    return tasks.where((task) {
      final matchesText = state.searchText.trim().isEmpty
          ? true
          : task.title.containIgnoreCase(state.searchText);
      return matchesText && task.status == TaskStatus.scheduled;
    }).toList();
  }
}
