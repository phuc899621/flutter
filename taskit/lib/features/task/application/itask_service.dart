import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';

import '../../../shared/exception/failure.dart';
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
  Future<Result<List<CategoryEntity>, Failure>> getAICategory(String title);

  /*
  * Insert
  * */
  Future<int> insertCategory(CategoryEntity category); //return localId
}
