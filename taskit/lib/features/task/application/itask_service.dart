import 'package:taskit/features/task/domain/entities/task_entity.dart';

import '../domain/entities/category_entity.dart';

abstract interface class ITaskService {
  /*
  * Watch
  * */
  Stream<List<TaskEntity>> watchAllTasks();
  Stream<List<TaskEntity>> watchScheduledTasks();
  Stream<List<CategoryEntity>> watchAllCategories();
  /*
  * Update
  * */
  Future<void> updateTaskStatus(int localId);
  Future<void> updateSubtaskStatus(int localId);
  /*
  * Read
  * */
  /*
  * Insert
  * */
  Future<void> insertCategory(CategoryEntity category);
}
