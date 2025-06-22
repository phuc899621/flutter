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

  //#endregion
  // ================================
  // ========== UPDATE ==============
  // ================================
  //region UPDATE TASK
  @override
  Future<void> updateTaskStatus(int localId, String status) =>
      _taskDao.updateTaskStatus(localId, status);

  @override
  Future<void> updateSubtask(
          {required int localId, bool? isCompleted, String? title}) =>
      _subtaskDao.updateSubtask(
          localId: localId, isCompleted: isCompleted, title: title);

  @override
  Future<void> updateSubtaskStatus({required int localId}) =>
      _subtaskDao.updateSubtaskStatus(localId: localId);

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

  //endregion

  // ================================
  // ========== INSERT ==============
  // ================================
  //region INSERT TASK
  @override
  Future<int> insertCategory(CategoryTableCompanion category) =>
      _categoryDao.insertCategory(category);

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
//endregion
}
