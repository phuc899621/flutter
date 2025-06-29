import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/list/state/list_state.dart';
import 'package:taskit/features/task/domain/entities/category_entity.dart';
import 'package:taskit/features/task/domain/entities/filter_date_option_enum.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/shared/extension/date_time.dart';
import 'package:taskit/shared/extension/string.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../task/application/task_service.dart';
import '../../../../task/domain/entities/order_option_enum.dart';
import '../../../../task/domain/entities/task_entity.dart';
import '../../../../task/domain/entities/task_status_enum.dart';

final listControllerProvider =
    NotifierProvider<ListController, ListState>(ListController.new);
final shouldFocusSearchTextFieldProvider = StateProvider<bool>((ref) => false);

class ListController extends Notifier<ListState> {
  late StreamSubscription _taskSub;
  ValueChanged<bool>? onFiltering;

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

  void setFilteringCallback(ValueChanged<bool> callback) =>
      onFiltering = callback;

  void onCheck(int localId) =>
      ref.read(taskServiceProvider).updateTaskStatus(localId);

  void onSubtaskCheck(int localId) =>
      ref.read(taskServiceProvider).updateSubtaskStatus(localId);

  void onDelete(int localId) =>
      ref.read(taskServiceProvider).deleteTask(localId);

  void onSubtaskDelete(int localId) =>
      ref.read(taskServiceProvider).deleteSubtask(localId);

  void onEdit(int localId) {}

  void setOrderByOption(OrderByOption option) {
    state = state.copyWith(orderByOption: option);
    callUpdateFilteringTask();
  }

  void setFilteringCategories(List<CategoryEntity> categories) {
    state = state.copyWith(filteringCategories: categories);
  }

  void setFilteringPriorities(List<TaskPriority> priorities) {
    state = state.copyWith(filteringPriorities: priorities);
  }

  void setFilteringDateOption(FilterDateOption option) {
    state = state.copyWith(filteringDateOption: option);
  }

  void setFilteringStartDate(DateTime? date) {
    state = state.copyWith(filteringStartDate: date);
  }

  void setFilteringEndDate(DateTime? date) {
    state = state.copyWith(filteringEndDate: date);
  }

  void setSearchText(String text) {
    logger.i('Search text: $text');
    state = state.copyWith(searchText: text);
  }

  void setIsFiltering(bool isFiltering) {
    state = state.copyWith(isFiltering: isFiltering);
    callUpdateFilteringTask();
  }

  void callUpdateFilteringTask() {
    state = state.copyWith(
        filteringTask: _filteringTasks(
          state.allTask,
        ),
        filteringPendingTask: _filteringPendingTasks(state.allTask),
        filteringCompletedTask: _filteringCompletedTasks(state.allTask),
        filteringScheduledTask: _filteringScheduledTasks(state.allTask));
  }

  List<TaskEntity> _filteringTasks(List<TaskEntity> allTasks) {
    logger.i('Filtering tasks: ${state.searchText}');
    final filteringTasks = allTasks.where((task) {
      final matchesText = state.searchText.trim().isEmpty
          ? true
          : task.title.containIgnoreCase(state.searchText);
      final matchCategories = _matchCategories(task);
      final matchPriorities = _matchPriorities(task);
      final matchDate = _matchDate(task);
      return matchesText && matchCategories && matchPriorities && matchDate;
    }).toList();
    _orderingsTasks(filteringTasks);
    return filteringTasks;
  }

  void _orderingsTasks(List<TaskEntity> filteringTasks) {
    switch (state.orderByOption) {
      case OrderByOption.titleAtoZ:
        filteringTasks
            .sort((task1, task2) => task1.title.compareTo(task2.title));
        break;
      case OrderByOption.titleZtoA:
        filteringTasks
            .sort((task1, task2) => task2.title.compareTo(task1.title));
        break;
      case OrderByOption.dueDateSoonToLate:
        filteringTasks.sort((task1, task2) {
          if (task1.dueDate == null && task2.dueDate == null) {
            return 0;
          }
          if (task1.dueDate == null) {
            return 1;
          }
          if (task2.dueDate == null) {
            return -1;
          }
          return task1.dueDate!.compareTo(task2.dueDate!);
        });
        break;
      case OrderByOption.dueDateLateToSoon:
        filteringTasks.sort((task1, task2) {
          if (task1.dueDate == null && task2.dueDate == null) {
            return 0;
          }
          if (task1.dueDate == null) {
            return 1;
          }
          if (task2.dueDate == null) {
            return -1;
          }
          return task2.dueDate!.compareTo(task1.dueDate!);
        });
        break;
      case OrderByOption.priorityLowToHigh:
        filteringTasks.sort((task1, task2) =>
            task1.priority.index.compareTo(task2.priority.index));
        break;
      case OrderByOption.priorityHighToLow:
        filteringTasks.sort((task1, task2) =>
            task2.priority.index.compareTo(task1.priority.index));
        break;
      case OrderByOption.categoryAtoZ:
        filteringTasks.sort((task1, task2) =>
            task1.category.name.compareTo(task2.category.name));
        break;
      case OrderByOption.categoryZtoA:
        filteringTasks.sort((task1, task2) =>
            task2.category.name.compareTo(task1.category.name));
        break;
      case OrderByOption.defaultOption:
        break;
    }
  }

  bool _matchCategories(TaskEntity task) {
    return state.filteringCategories.isEmpty
        ? true
        : state.filteringCategories.contains(task.category);
  }

  bool _matchPriorities(TaskEntity task) {
    return state.filteringPriorities.isEmpty
        ? true
        : state.filteringPriorities.contains(task.priority);
  }

  bool _matchDate(TaskEntity task) {
    final dueDate = task.dueDate;
    switch (state.filteringDateOption) {
      case FilterDateOption.today:
        return dueDate == null ? false : dueDate.isToday();
      case FilterDateOption.tomorrow:
        return dueDate == null ? false : dueDate.isTomorrow();
      case FilterDateOption.yesterday:
        return dueDate == null ? false : dueDate.isYesterday();
      case FilterDateOption.thisWeek:
        return dueDate == null ? false : dueDate.isThisWeek();
      case FilterDateOption.nextWeek:
        return dueDate == null ? false : dueDate.isNextWeek();
      case FilterDateOption.lastWeek:
        return dueDate == null ? false : dueDate.isLastWeek();
      case FilterDateOption.thisMonth:
        return dueDate == null ? false : dueDate.isThisMonth();
      case FilterDateOption.nextMonth:
        return dueDate == null ? false : dueDate.isNextMonth();
      case FilterDateOption.lastMonth:
        return dueDate == null ? false : dueDate.isLastMonth();
      case FilterDateOption.custom:
        {
          if (dueDate == null) return false;
          final startDate = state.filteringStartDate;
          final endDate = state.filteringEndDate;
          if (startDate == null && endDate == null) return false;
          if (startDate != null && endDate != null) {
            return dueDate.isBetweenInclusive(startDate, endDate);
          }
          if (endDate != null) return dueDate.isSameDayOrBefore(endDate);
          if (startDate != null) return dueDate.isSameDayOrAfter(startDate);
          return true;
        }
      default:
        return true;
    }
  }

  List<TaskEntity> _filteringPendingTasks(List<TaskEntity> tasks) {
    logger.i('Filtering tasks: ${state.searchText}');
    final filteringPendingTask = tasks.where((task) {
      final matchesText = state.searchText.trim().isEmpty
          ? true
          : task.title.containIgnoreCase(state.searchText);
      final matchCategories = _matchCategories(task);
      final matchPriorities = _matchPriorities(task);
      final matchDate = _matchDate(task);
      return matchesText &&
          matchCategories &&
          matchPriorities &&
          matchDate &&
          task.status == TaskStatus.pending;
    }).toList();
    _orderingsTasks(filteringPendingTask);
    return filteringPendingTask;
  }

  List<TaskEntity> _filteringCompletedTasks(List<TaskEntity> tasks) {
    logger.i('Filtering tasks: ${state.searchText}');
    final filteringCompletedTask = tasks.where((task) {
      final matchesText = state.searchText.trim().isEmpty
          ? true
          : task.title.containIgnoreCase(state.searchText);
      final matchCategories = _matchCategories(task);
      final matchPriorities = _matchPriorities(task);
      final matchDate = _matchDate(task);
      return matchesText &&
          matchCategories &&
          matchPriorities &&
          matchDate &&
          task.status == TaskStatus.completed;
    }).toList();
    _orderingsTasks(filteringCompletedTask);
    return filteringCompletedTask;
  }

  List<TaskEntity> _filteringScheduledTasks(List<TaskEntity> tasks) {
    logger.i('Filtering tasks: ${state.searchText}');
    final filteringScheduledTask = tasks.where((task) {
      final matchesText = state.searchText.trim().isEmpty
          ? true
          : task.title.containIgnoreCase(state.searchText);
      final matchCategories = _matchCategories(task);
      final matchPriorities = _matchPriorities(task);
      final matchDate = _matchDate(task);
      return matchesText &&
          matchCategories &&
          matchPriorities &&
          matchDate &&
          task.status == TaskStatus.scheduled;
    }).toList();
    _orderingsTasks(filteringScheduledTask);
    return filteringScheduledTask;
  }
}
