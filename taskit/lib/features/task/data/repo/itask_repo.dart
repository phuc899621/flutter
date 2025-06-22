import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/entities/task_status_enum.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/entities/subtask_entity.dart';

abstract interface class ITaskRepo {
  //================================
  //========== WATCH ================
  //================================
  Stream<List<TaskEntity>> watchAllTasks();

  Stream<List<CategoryEntity>> watchAllCategories();

  //================================
  //========== UPDATE ================
  //================================
  Future<void> updateTaskStatus(int localId, TaskStatus status);

  Future<void> updateSubtaskStatus({required int localId});

  //================================
  //========== READ ================
  //================================
  Future<TaskEntity> getTaskById(int localId);

  Future<List<SubtaskEntity>> getSubtaskByTaskLocalId(int taskLocalId);

  Future<List<CategoryEntity>> getAICategory(String title);

  Future<CategoryEntity?> getCategoryByName(String name);

  //================================
  //========== INSERT ================
  //================================
  Future<int> insertCategory(CategoryEntity category);

  Future<int> insertTask(TaskEntity task);
}
