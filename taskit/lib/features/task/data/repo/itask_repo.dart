import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/entities/task_status_enum.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/entities/subtask_entity.dart';

abstract interface class ITaskRepo {
  /*
  * Watch
  * */
  Stream<List<TaskEntity>> watchAllTasks();

  Stream<List<CategoryEntity>> watchAllCategories();

  /*
  * Update
  * */
  Future<void> updateTaskStatus({required int localId, TaskStatus? status});

  Future<void> updateSubtaskStatus({required int localId});

  /*
  * Read
  * */
  Future<TaskEntity> getTaskById(int localId);

  Future<List<SubtaskEntity>> getSubtaskByTaskLocalId(int taskLocalId);

  Future<List<CategoryEntity>> getAICategory(String title);

  /*
  * Insert
  * */
  Future<int> insertCategory(CategoryEntity category);

  Future<TaskEntity> insertTask(TaskEntity task);
}
