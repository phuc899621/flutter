import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repo/itask_repo.dart';
import '../data/repo/task_repo.dart';
import '../domain/entities/task_entity.dart';
import 'itask_service.dart';

final taskServiceProvider = Provider<ITaskService>((ref) {
  return TaskService(ref.watch(taskRepoProvider));
});

class TaskService implements ITaskService {
  final ITaskRepo _iTaskRepo;
  TaskService(this._iTaskRepo);
  @override
  Stream<List<TaskEntity>> watchAllTasks() {
    return _iTaskRepo.watchAllTasks();
  }

  @override
  Stream<List<TaskEntity>> watchScheduledTasks() {
    return _iTaskRepo.watchAllTasks().map(
        (tasks) => tasks.where((task) => task.type == 'schedule').toList());
  }
}
