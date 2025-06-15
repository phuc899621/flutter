import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repo/itask_repo.dart';
import '../data/repo/task_repo.dart';
import '../domain/entities/category_entity.dart';
import '../domain/entities/task_entity.dart';
import '../domain/entities/task_status_enum.dart';
import 'itask_service.dart';

final taskServiceProvider = Provider<ITaskService>((ref) {
  return TaskService(ref.watch(taskRepoProvider));
});

class TaskService implements ITaskService {
  final ITaskRepo _iTaskRepo;
  TaskService(this._iTaskRepo);
  /*
  * Watch
  * */
  @override
  Stream<List<TaskEntity>> watchAllTasks() {
    return _iTaskRepo.watchAllTasks();
  }

  @override
  Stream<List<TaskEntity>> watchScheduledTasks() {
    return _iTaskRepo.watchAllTasks();
  }

  @override
  Stream<List<CategoryEntity>> watchAllCategories() {
    return _iTaskRepo.watchAllCategories();
  }

  /*
  * Update
  * */
  @override
  Future<void> updateTaskStatus(int localId) async {
    final task = await _iTaskRepo.getTaskById(localId);
    if (task.status != TaskStatus.completed) {
      return _iTaskRepo.updateTaskStatus(
          localId: localId, status: TaskStatus.completed);
    }
    if (task.dueDate != null) {
      return _iTaskRepo.updateTaskStatus(
          localId: localId, status: TaskStatus.scheduled);
    }
    return _iTaskRepo.updateTaskStatus(
        localId: localId, status: TaskStatus.pending);
  }

  @override
  Future<void> updateSubtaskStatus(int localId) {
    return _iTaskRepo.updateSubtaskStatus(localId: localId);
  }

  /*
  * Insert
  * */
  @override
  Future<void> insertCategory(CategoryEntity category) {
    return _iTaskRepo.insertCategory(category);
  }
}
