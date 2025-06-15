import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/source/local/itask_local_source.dart';
import 'package:taskit/shared/data/source/local/drift/dao/category.dart';

import '../../../../../shared/data/source/local/drift/dao/subtask.dart';
import '../../../../../shared/data/source/local/drift/dao/task.dart';
import '../../../../../shared/data/source/local/drift/database/database.dart';

final taskLocalSourceProvider = Provider<ITaskLocalSource>((ref) {
  final taskDao = ref.watch(taskDaoProvider);
  final subtaskDao = ref.watch(subtaskDaoProvider);
  final categoryDao = ref.watch(categoryDaoProvider);
  return TaskLocalSource(taskDao, subtaskDao, categoryDao);
});

class TaskLocalSource implements ITaskLocalSource {
  final TaskDao _taskDao;
  final SubtaskDao _subtaskDao;
  final CategoryDao _categoryDao;

  TaskLocalSource(this._taskDao, this._subtaskDao, this._categoryDao);

  /*
  * Watch
  * */
  @override
  Stream<List<TaskTableData>> watchAllTasks() {
    return _taskDao.watchAllTasks();
  }

  @override
  Stream<List<SubtaskTableData>> watchAllSubtasks() {
    return _subtaskDao.watchAllSubtasks();
  }

  @override
  Stream<List<CategoryTableData>> watchAllCategories() {
    return _categoryDao.watchAllCategories();
  }

  /*
  * Update*/
  @override
  Future<void> updateTask(
      {required int localId, String? title, String? status}) {
    return _taskDao.updateTask(localId: localId, title: title, status: status);
  }

  @override
  Future<void> updateSubtask(
      {required int localId, bool? isCompleted, String? title}) {
    return _subtaskDao.updateSubtask(
        localId: localId, isCompleted: isCompleted, title: title);
  }

  @override
  Future<void> updateSubtaskStatus({required int localId}) {
    return _subtaskDao.updateSubtaskStatus(localId: localId);
  }

  /*
  * Read
  * */
  @override
  Future<TaskTableData?> getTaskByLocalId(int localId) async {
    return await _taskDao.getTaskByLocalId(localId);
  }

  @override
  Future<CategoryTableData?> getCategoryByLocalId(int localId) async {
    return await _categoryDao.getCategoryByLocalId(localId);
  }

  @override
  Future<List<CategoryTableData>> getCategories() async {
    return await _categoryDao.getCategories();
  }

  @override
  Future<List<SubtaskTableData>> getSubtaskByTaskLocalId(
      int taskLocalId) async {
    return await _subtaskDao.getSubtasksByTaskLocalId(taskLocalId);
  }

  /*
  * Insert
  * */
  @override
  Future<int> insertCategory(CategoryTableCompanion category) {
    return _categoryDao.insertCategory(category);
  }
}
