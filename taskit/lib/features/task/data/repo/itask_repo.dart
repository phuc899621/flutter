import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/features/task/domain/entities/task_status_enum.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/entities/subtask_entity.dart';

abstract interface class ITaskRepo {
  //================================
  //========== WATCH ================
  //================================
  Stream<List<TaskEntity>> watchAllTasks();

  Stream<List<CategoryEntity>> watchAllCategories();

  Stream<List<SubtaskEntity>> watchAllSubtasks();

  //================================
  //========== UPDATE ================
  //================================
  Future<void> updateTaskStatus(int localId, TaskStatus status);

  Future<void> updateSubtaskStatus(int localId);

  Future<void> updateTaskTitle(int localId, String title);

  Future<void> updateTaskDescription(int localId, String description);

  Future<void> updateTaskPriority(int localId, TaskPriority priority);

  Future<void> updateTaskCategory(int localId, int categoryLocalId);

  Future<void> updateTaskDueDate(int localId, DateTime? dueDate);

  Future<void> updateTaskHasTime(int localId, bool hasTime);

  Future<void> updateSubtaskTitle(int localId, String title);

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

  Future<void> insertSubtask(int taskLocalId);

  //================================
  //========== DELETE ================
  //================================
  Future<void> deleteTask(int localId);

  Future<void> deleteSubtask(int localId);

  //================================
  //========== INSERT REMOTE =======
  //================================

  Future<void> insertRemoteTask(int taskLocalId);
}
