import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/shared/extension/date_time.dart';

import '../../../shared/exception/failure.dart';
import '../../../shared/log/logger_provider.dart';
import '../data/repo/itask_repo.dart';
import '../data/repo/task_repo.dart';
import '../domain/entities/category_entity.dart';
import '../domain/entities/subtask_entity.dart';
import '../domain/entities/task_entity.dart';
import '../domain/entities/task_status_enum.dart';
import 'itask_service.dart';

final taskServiceProvider = Provider<ITaskService>((ref) {
  final iTaskRepo = ref.watch(taskRepoProvider);
  return TaskService(iTaskRepo);
});

class TaskService implements ITaskService {
  final ITaskRepo _iTaskRepo;

  TaskService(this._iTaskRepo);

  //================================
  //========== WATCH ==============
  //================================
  //region WATCH
  @override
  Stream<List<TaskEntity>> watchAllTasks() {
    return _iTaskRepo.watchAllTasks();
  }

  @override
  Stream<List<TaskEntity>> watchTodayTask() {
    return watchAllTasks().map((tasks) {
      return tasks.where((task) {
        final due = task.dueDate;
        final completed = task.completedAt;
        final hasTime = task.hasTime;
        if (due == null || !due.isToday() || completed != null) {
          return false;
        }
        if (hasTime) return due.isAfter(DateTime.now());
        return true;
      }).toList();
    });
  }

  @override
  Stream<List<TaskEntity>> watchTomorrowTask() {
    return watchAllTasks().map((tasks) {
      return tasks.where((task) {
        final due = task.dueDate;
        final status = task.status;
        if (due == null ||
            !due.isTomorrow() ||
            status == TaskStatus.completed) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Stream<List<TaskEntity>> watchThisWeekTask() {
    return watchAllTasks().map((tasks) {
      return tasks.where((task) {
        final due = task.dueDate;
        final status = task.status;
        final completed = task.completedAt;
        final hasTime = task.hasTime;
        if (due == null || !due.isThisWeek() || completed != null) {
          return false;
        }
        if (hasTime) return due.isAfter(DateTime.now());
        return true;
      }).toList();
    });
  }

  @override
  Stream<List<TaskEntity>> watchPendingTask() {
    return watchAllTasks().map((tasks) {
      return tasks.where((task) {
        return task.status == TaskStatus.pending;
      }).toList();
    });
  }

  @override
  Stream<List<TaskEntity>> watchCompletedTodayTask() {
    return watchAllTasks().map((tasks) {
      return tasks.where((task) {
        final completed = task.completedAt;
        final due = task.dueDate;
        final hasTime = task.hasTime;
        debugPrint("Completed: $task");
        if (completed == null || !completed.isToday()) return false;
        if (due == null) return true;
        if (!hasTime) return true;
        return !completed.isAfter(due);
      }).toList();
    });
  }

  @override
  Stream<List<TaskEntity>> watchCompletedThisWeekTask() {
    return watchAllTasks().map((tasks) {
      return tasks.where((task) {
        final completed = task.completedAt;
        final status = task.status;
        final due = task.dueDate;
        final hasTime = task.hasTime;
        if (completed == null || !completed.isThisWeek()) return false;
        if (due == null) return true;
        return !completed.isAfter(due);
      }).toList();
    });
  }

  @override
  Stream<List<TaskEntity>> watchThisWeekOverDueTask() {
    return watchAllTasks().map((tasks) {
      return tasks.where((task) {
        final due = task.dueDate;
        final completed = task.completedAt;
        if (due == null || !due.isThisWeek()) return false;
        if (task.hasTime) {
          return due.isBefore(DateTime.now()) &&
              (completed == null || completed.isAfter(due));
        }
        return due.isDayBefore(DateTime.now()) &&
            (completed == null || completed.isDayAfter(due));
      }).toList();
    });
  }

  @override
  Stream<List<TaskEntity>> watchTodayOverDueTask() {
    return watchAllTasks().map((tasks) {
      return tasks.where((task) {
        final due = task.dueDate;
        final completed = task.completedAt;
        if (due == null || !due.isToday()) return false;
        return task.hasTime &&
            due.isBefore(DateTime.now()) &&
            (completed == null || completed.isAfter(due));
      }).toList();
    });
  }

  @override
  Stream<List<CategoryEntity>> watchAllCategories() {
    return _iTaskRepo.watchAllCategories().map((categories) {
      final callCategories = categories.firstWhere(
          (element) => element.name.toLowerCase() == "any", orElse: () {
        return CategoryEntity(name: "Any", localId: -1, userLocalId: -1);
      });
      final restCategories = categories
          .where((element) => element.name.toLowerCase() != "any")
          .toList();
      return [callCategories, ...restCategories];
    });
  }

  @override
  Stream<TaskEntity?> watchTaskByLocalId(int localId) =>
      _iTaskRepo.watchAllTasks().map((tasks) => tasks.firstWhereOrNull(
            (element) => element.localId == localId,
          ));

  @override
  Stream<List<SubtaskEntity>> watchSubtasksByTaskLocalId(int localId) =>
      _iTaskRepo.watchAllSubtasks().map((subtasks) {
        return subtasks
            .where((element) => element.taskLocalId == localId)
            .toList();
      });

  @override
  Stream<List<TaskEntity>> watchTaskByDueDate(DateTime dueDate) =>
      watchAllTasks().map((tasks) {
        return tasks
            .where((element) => element.dueDate?.isSameDay(dueDate) ?? false)
            .toList();
      });

  //endregion

  //================================
  //========== UPDATE ==============
  //================================
  //region UPDATE
  @override
  Future<void> updateTaskStatus(int localId) async {
    final task = await _iTaskRepo.getTaskById(localId);
    if (task.status != TaskStatus.completed) {
      return _iTaskRepo.updateTaskStatus(localId, TaskStatus.completed);
    }
    if (task.dueDate != null) {
      return _iTaskRepo.updateTaskStatus(localId, TaskStatus.scheduled);
    }
    return _iTaskRepo.updateTaskStatus(localId, TaskStatus.pending);
  }

  @override
  Future<void> updateSubtaskStatus(int localId) =>
      _iTaskRepo.updateSubtaskStatus(localId);

  @override
  Future<void> updateTaskTitle(int localId, String title) =>
      _iTaskRepo.updateTaskTitle(localId, title);

  @override
  Future<void> updateTaskDescription(int localId, String description) =>
      _iTaskRepo.updateTaskDescription(localId, description);

  @override
  Future<void> updateTaskPriority(int localId, TaskPriority priority) =>
      _iTaskRepo.updateTaskPriority(localId, priority);

  @override
  Future<void> updateTaskCategory(int localId, int categoryLocalId) =>
      _iTaskRepo.updateTaskCategory(localId, categoryLocalId);

  @override
  Future<void> updateTaskDueDate(int localId, DateTime? dueDate) =>
      _iTaskRepo.updateTaskDueDate(localId, dueDate);

  @override
  Future<void> updateTaskHasTime(int localId, bool hasTime) =>
      _iTaskRepo.updateTaskHasTime(localId, hasTime);

  @override
  Future<void> updateSubtaskTitle(int localId, String title) =>
      _iTaskRepo.updateSubtaskTitle(localId, title);

  //endregion

  //================================
  //========== READ ===============
  //================================
  //region READ
  @override
  Future<Result<List<CategoryEntity>, Failure>> getAICategory(
      String title) async {
    try {
      final result = await _iTaskRepo.getAICategory(title);
      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at category AI"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  Future<CategoryEntity?> getCategoryByName(String name) async =>
      await _iTaskRepo.getCategoryByName(name);

  //endregion

  //================================
  //========== INSERT ==============
  //================================
  //region INSERT
  @override
  Future<int> insertCategory(CategoryEntity category) async =>
      await _iTaskRepo.insertCategory(category);

  @override
  Future<Result<int, Failure>> insertTask(TaskEntity task) async {
    try {
      logger.i('Task: $task');
      final result = await _iTaskRepo.insertTask(task);
      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<void> insertSubtask(int taskLocalId) =>
      _iTaskRepo.insertSubtask(taskLocalId);

  //endregion
  //================================
  //========== DELETE ==============
  //================================
  //region DELETE
  @override
  Future<void> deleteTask(int localId) => _iTaskRepo.deleteTask(localId);

  @override
  Future<void> deleteSubtask(int localId) => _iTaskRepo.deleteSubtask(localId);
//endregion
}
