import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/data/repository/itoken_repository.dart';
import 'package:taskit/shared/data/repository/token_repository.dart';

import '../../../shared/exception/failure.dart';
import '../data/repo/itask_repo.dart';
import '../data/repo/task_repo.dart';
import '../domain/entities/category_entity.dart';
import '../domain/entities/task_entity.dart';
import '../domain/entities/task_status_enum.dart';
import 'itask_service.dart';

final taskServiceProvider = Provider<ITaskService>((ref) {
  return TaskService(
      ref.watch(taskRepoProvider), ref.watch(tokenRepositoryProvider));
});

class TaskService implements ITaskService {
  final ITaskRepo _iTaskRepo;
  final ITokenRepository _iTokenRepo;

  TaskService(this._iTaskRepo, this._iTokenRepo);

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
    return _iTaskRepo.watchAllCategories().map((categories) {
      final callCategories = categories.firstWhere(
          (element) => element.name.toLowerCase() == "any", orElse: () {
        return CategoryEntity(name: "Any", localId: -1);
      });
      final restCategories = categories
          .where((element) => element.name.toLowerCase() != "any")
          .toList();
      return [callCategories, ...restCategories];
    });
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
  * Read
  * */
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

  /*
  * Insert
  * */
  @override
  Future<void> insertCategory(CategoryEntity category) {
    return _iTaskRepo.insertCategory(category);
  }
}
