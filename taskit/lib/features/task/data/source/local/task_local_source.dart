import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/source/local/itask_local_source.dart';
import 'package:taskit/shared/data/source/local/drift/dao/category.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../../shared/data/source/local/drift/dao/subtask.dart';
import '../../../../../shared/data/source/local/drift/dao/task.dart';
import '../../../../../shared/data/source/local/drift/database/database.dart';

final taskLocalSourceProvider = Provider<ITaskLocalSource>((ref) {
  final taskDao = ref.watch(taskDaoProvider);
  final subtaskDao = ref.watch(subtaskDaoProvider);
  final categoryDao = ref.watch(categoryDaoProvider);
  final db = ref.watch(appDatabaseProvider);
  return TaskLocalSource(taskDao, subtaskDao, categoryDao, db);
});

class TaskLocalSource implements ITaskLocalSource {
  final TaskDao _taskDao;
  final SubtaskDao _subtaskDao;
  final CategoryDao _categoryDao;
  final AppDatabase _db;

  TaskLocalSource(this._taskDao, this._subtaskDao, this._categoryDao, this._db);

  // ================================
  // ========== WATCH ==============
  // ================================
  //#region WATCH TASK
  @override
  Stream<List<TaskTableData>> watchAllTasks() => _taskDao.watchAllTasks();

  @override
  Stream<List<SubtaskTableData>> watchAllSubtasks() =>
      _subtaskDao.watchAllSubtasks();

  @override
  Stream<List<CategoryTableData>> watchAllCategories() =>
      _categoryDao.watchAllCategories();

  @override
  Stream<TaskTableData?> watchTaskByLocalId(int localId) =>
      _taskDao.watchTaskByLocalId(localId);

  //#endregion
  // ================================
  // ========== UPDATE ==============
  // ================================
  //region UPDATE TASK
  @override
  Future<void> updateTaskStatus(int localId, String status) async {
    try {
      await _db.transaction(() async {
        final task = await _taskDao.getTaskByLocalId(localId);
        if (task == null) return 0;

        final String statusUpdate;
        if (status != 'completed' && task.dueDate != null) {
          statusUpdate = 'scheduled';
        } else if (status != 'completed' && task.dueDate == null) {
          statusUpdate = 'pending';
        } else {
          statusUpdate = 'completed';
        }

        logger.i('task update status $statusUpdate');
        if (statusUpdate == 'completed') {
          await _subtaskDao.updateToCompletedSubtasks(localId);
        } else {
          await _subtaskDao.updateToUncompletedSubtasks(localId);
        }
        return await _taskDao.updateTaskStatus(localId, statusUpdate);
      });
    } catch (e, s) {
      logger.e('Update task error: $e, $s');
    }
  }

  @override
  Future<void> updateTaskStatusWithoutSync(int localId, String status) async {
    try {
      await _db.transaction(() async {
        final task = await _taskDao.getTaskByLocalId(localId);
        if (task == null) return 0;

        final String statusUpdate;
        if (status != 'completed' && task.dueDate != null) {
          statusUpdate = 'scheduled';
        } else if (status != 'completed' && task.dueDate == null) {
          statusUpdate = 'pending';
        } else {
          statusUpdate = 'completed';
        }

        logger.i('task update status $statusUpdate');
        if (statusUpdate == 'completed') {
          await _subtaskDao.updateToCompletedSubtasks(localId);
        } else {
          await _subtaskDao.updateToUncompletedSubtasks(localId);
        }
        return await _taskDao.updateTaskStatusWithoutSync(
            localId, statusUpdate);
      });
    } catch (e, s) {
      logger.e('Update task error: $e, $s');
    }
  }

  @override
  Future<void> updateSubtaskStatus(int localId) async {
    try {
      return await _db.transaction(() async {
        final subtask = await _subtaskDao.getSubtasksByLocalId(localId);
        if (subtask == null) return;

        await _subtaskDao.updateSubtaskStatus(localId, !subtask.isCompleted);

        final uncompletedSubtaskList = await _subtaskDao
            .findUncompletedSubtaskByTaskLocalId(subtask.taskLocalId);

        final task = await _taskDao.getTaskByLocalId(subtask.taskLocalId);
        if (task == null) return;

        final newTaskStatus = uncompletedSubtaskList.isEmpty
            ? 'completed'
            : (task.dueDate != null ? 'scheduled' : 'pending');
        if (task.status != newTaskStatus) {
          await _taskDao.updateTaskStatus(subtask.taskLocalId, newTaskStatus);
        }
      });
    } catch (e, s) {
      logger.e('Update subtask status error: $e, $s');
    }
  }

  @override
  Future<void> updateSubtaskStatusWithoutSync(int localId) async {
    try {
      return await _db.transaction(() async {
        final subtask = await _subtaskDao.getSubtasksByLocalId(localId);
        if (subtask == null) return;

        await _subtaskDao.updateSubtaskStatus(localId, !subtask.isCompleted);

        final uncompletedSubtaskList = await _subtaskDao
            .findUncompletedSubtaskByTaskLocalId(subtask.taskLocalId);

        final task = await _taskDao.getTaskByLocalId(subtask.taskLocalId);
        if (task == null) return;

        final newTaskStatus = uncompletedSubtaskList.isEmpty
            ? 'completed'
            : (task.dueDate != null ? 'scheduled' : 'pending');
        if (task.status != newTaskStatus) {
          await _taskDao.updateTaskStatusWithoutSync(
              subtask.taskLocalId, newTaskStatus);
        }
      });
    } catch (e, s) {
      logger.e('Update subtask status error: $e, $s');
    }
  }

  @override
  Future<void> updateTaskTitle(int localId, String title) =>
      _taskDao.updateTaskTitle(localId, title);

  @override
  Future<void> updateTaskTitleWithoutSync(int localId, String title) =>
      _taskDao.updateTaskTitleWithoutSync(localId, title);

  @override
  Future<void> updateTaskDescription(int localId, String description) =>
      _taskDao.updateTaskDescription(localId, description);

  @override
  Future<void> updateTaskDescriptionWithoutSync(
          int localId, String description) =>
      _taskDao.updateTaskDescriptionWithoutSync(localId, description);

  @override
  Future<void> updateTaskPriority(int localId, String priority) =>
      _taskDao.updateTaskPriority(localId, priority);

  @override
  Future<void> updateTaskPriorityWithoutSync(int localId, String priority) =>
      _taskDao.updateTaskPriorityWithoutSync(localId, priority);

  @override
  Future<void> updateTaskCategory(int localId, int categoryLocalId) =>
      _taskDao.updateTaskCategory(localId, categoryLocalId);

  @override
  Future<void> updateTaskCategoryWithoutSync(
          int localId, int categoryLocalId) =>
      _taskDao.updateTaskCategoryWithoutSync(localId, categoryLocalId);

  @override
  Future<void> updateTaskDueDate(int localId, DateTime? dueDate) async {
    final task = await _taskDao.getTaskByLocalId(localId);
    logger.i('task status: $task');
    if (task == null) return;
    if (task.status == 'completed') {
      return _taskDao.updateTaskDueDate(localId, dueDate);
    }
    await _taskDao.updateTaskDueDate(localId, dueDate);
    return updateTaskStatus(localId, 'pending');
  }

  @override
  Future<void> updateTaskDueDateWithoutSync(
      int localId, DateTime? dueDate) async {
    final task = await _taskDao.getTaskByLocalId(localId);
    logger.i('task status: $task');
    if (task == null) return;
    if (task.status == 'completed') {
      return _taskDao.updateTaskDueDateWithoutSync(localId, dueDate);
    }
    await _taskDao.updateTaskDueDateWithoutSync(localId, dueDate);
    return updateTaskStatusWithoutSync(localId, 'pending');
  }

  @override
  Future<void> updateTaskHasTime(int localId, bool hasTime) async {
    if ((await _taskDao.getTaskByLocalId(localId))?.dueDate == null) return;
    await _taskDao.updateTaskHasTime(localId, hasTime);
  }

  @override
  Future<void> updateTaskHasTimeWithoutSync(int localId, bool hasTime) async {
    if ((await _taskDao.getTaskByLocalId(localId))?.dueDate == null) return;
    await _taskDao.updateTaskHasTimeWithoutSync(localId, hasTime);
  }

  @override
  Future<void> updateSubtaskTitle(int localId, String title) =>
      _subtaskDao.updateSubtaskTitle(localId, title);

  @override
  Future<void> updateSubtaskTitleWithoutSync(int localId, String title) =>
      _subtaskDao.updateSubtaskTitleWithoutSync(localId, title);

  //endregion
  // ================================
  // ========== READ ==============
  // ================================
  //region READ TASK
  @override
  Future<TaskTableData?> getTaskByLocalId(int localId) =>
      _taskDao.getTaskByLocalId(localId);

  @override
  Future<CategoryTableData?> getCategoryByLocalId(int localId) =>
      _categoryDao.getCategoryByLocalId(localId);

  @override
  Future<List<CategoryTableData>> getCategories() =>
      _categoryDao.getCategories();

  @override
  Future<List<SubtaskTableData>> getSubtaskByTaskLocalId(int taskLocalId) =>
      _subtaskDao.findSubtasksByTaskLocalId(taskLocalId);

  @override
  Future<CategoryTableData?> getCategoryByName(String name) =>
      _categoryDao.findByName(name);

  @override
  Future<SubtaskTableData?> getSubtaskByLocalId(int localId) =>
      _subtaskDao.getSubtasksByLocalId(localId);

  //endregion

  // ================================
  // ========== INSERT ==============
  // ================================
  //region INSERT TASK
  @override
  Future<int> insertCategory(CategoryTableCompanion category) async {
    try {
      logger.i('Insert category: $category');
      final categoryWithSameName =
          await _categoryDao.findByName(category.name.value);
      if (categoryWithSameName != null) return -1;
      return _categoryDao.insertCategory(category);
    } catch (e) {
      logger.e('Insert category error: $e');
      return Future.value(-1);
    }
  }

  @override
  Future<int> insertTask(
      TaskTableCompanion task,
      List<SubtaskTableCompanion> subtasks,
      CategoryTableCompanion category) async {
    try {
      return await _db.transaction(() async {
        //find and add category Id for task
        if (task.categoryLocalId.value < 0) {
          if (category.name.value.toLowerCase() != 'any') {
            task = task.copyWith(
                categoryLocalId: Value(await _categoryDao.insertCategory(
                    category.copyWith(localId: Value.absent()))));
          } else {
            final categoryAnyId = await _categoryDao.findByName('any');
            if (categoryAnyId == null) {
              task = task.copyWith(
                  categoryLocalId: Value(await _categoryDao.insertCategory(
                      category.copyWith(localId: Value.absent()))));
            } else {
              task =
                  task.copyWith(categoryLocalId: Value(categoryAnyId.localId));
            }
          }
        }
        final taskLocalId = await _taskDao.insertTask(task);
        await _subtaskDao.insertAllSubtasks(subtasks
            .map((e) => e.copyWith(taskLocalId: Value(taskLocalId)))
            .toList());
        return taskLocalId;
      });
    } catch (e) {
      logger.e('Insert task error: $e');
      return 0;
    }
  }

  @override
  Future<int> insertSubtask(SubtaskTableCompanion subtask) async {
    try {
      return await _db.transaction(() async {
        await _subtaskDao.insertSubtask(subtask);
        final task = await _taskDao.getTaskByLocalId(subtask.taskLocalId.value);
        if (task == null) {
          throw Exception('Task not found, cannot insert subtask');
        }
        final uncompletedSubtaskList = await _subtaskDao
            .findUncompletedSubtaskByTaskLocalId(subtask.taskLocalId.value);
        final newTaskStatus = uncompletedSubtaskList.isEmpty
            ? 'completed'
            : (task.dueDate != null ? 'scheduled' : 'pending');
        if (task.status != newTaskStatus) {
          await _taskDao.updateTaskStatus(
              subtask.taskLocalId.value, newTaskStatus);
        }
        return subtask.localId.value;
      });
    } catch (e) {
      logger.e('Insert subtask error: $e');
      return -1;
    }
  }

  //endregion

  // ================================
  // ========== DELETE ==============
  // ================================
  //region DELETE
  @override
  Future<void> deleteTaskByLocalId(int id) => _taskDao.deleteTaskByLocalId(id);

  @override
  Future<void> deleteSubtaskByLocalId(int id) =>
      _subtaskDao.deleteSubtaskById(id);

//endregion

// ================================
// ========== SYNC ==============
// ================================
//region SYNC Task
  @override
  Future<void> updateSyncAddTaskAndSubtask(
      TaskTableCompanion task, List<SubtaskTableCompanion> subtask) async {
    try {
      return await _db.transaction(() async {
        await _taskDao.updateTask(task);
        await _subtaskDao.updateListSubtask(subtask);
      });
    } catch (e) {
      logger.e('Insert task error: $e');
    }
  }

  @override
  Future<void> updateSyncTask(int localId) async {
    try {
      logger.i('updateSyncTask $localId');
      return await _taskDao.updateTaskSync(localId);
    } catch (e) {
      logger.e('Sync task error: $e');
    }
  }

  @override
  Future<void> updateSyncSubtasks(List<int> localIds) async {
    try {
      logger.i('updateSyncSubtask $localIds');
      return _subtaskDao.updateSyncSubtasks(localIds);
    } catch (e) {
      logger.e('Sync task error: $e');
    }
  }

  @override
  Future<void> updateSyncSubtasksFromSubtasksTblCompanion(
      List<SubtaskTableCompanion> subtasks) async {
    try {
      logger.i('updateSyncSubtask $subtasks');
      return _subtaskDao.updateListSubtask(subtasks);
    } catch (e) {
      logger.e('Sync task error: $e');
    }
  }

  @override
  Future<void> updateSyncAddCategory(int localId, String remoteId) {
    try {
      logger.i('updateSyncCategory $localId');
      return _categoryDao.updateSyncAddCategory(localId, remoteId);
    } catch (e) {
      logger.e('Sync task error: $e');
      return Future.value();
    }
  }
//endregion
}
