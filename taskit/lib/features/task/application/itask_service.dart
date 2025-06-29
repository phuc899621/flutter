import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';

import '../../../shared/exception/failure.dart';
import '../domain/entities/category_entity.dart';
import '../domain/entities/subtask_entity.dart';

abstract interface class ITaskService {
  //================================
  //========== WATCH ===============
  //================================
  Stream<List<TaskEntity>> watchAllTasks();

  Stream<List<TaskEntity>> watchTodayTask();

  Stream<List<TaskEntity>> watchTomorrowTask();

  Stream<List<TaskEntity>> watchThisWeekTask();

  Stream<List<TaskEntity>> watchPendingTask();

  Stream<List<TaskEntity>> watchCompletedTodayTask();

  Stream<List<TaskEntity>> watchCompletedThisWeekTask();

  Stream<List<TaskEntity>> watchThisWeekOverDueTask();

  Stream<List<TaskEntity>> watchTodayOverDueTask();

  Stream<List<CategoryEntity>> watchAllCategories();

  Stream<TaskEntity> watchTaskByLocalId(int localId);

  Stream<List<SubtaskEntity>> watchSubtasksByTaskLocalId(int localId);

  Stream<List<TaskEntity>> watchTaskByDueDate(DateTime dueDate);

  //================================
  //========== UPDATE =============
  //================================
  Future<void> updateTaskStatus(int localId);

  Future<void> updateSubtaskStatus(int localId);

  Future<void> updateTaskTitle(int localId, String title);

  Future<void> updateTaskDescription(int localId, String description);

  Future<void> updateTaskPriority(int localId, TaskPriority priority);

  Future<void> updateTaskCategory(int localId, int categoryLocalId);

  Future<void> updateTaskDueDate(int localId, DateTime? dueDate);

  Future<void> updateTaskHasTime(int localId, bool hasTime);

  Future<void> updateSubtaskTitle(int localId, String title);

  //================================
  //========== READ ==============
  //================================
  Future<Result<List<CategoryEntity>, Failure>> getAICategory(String title);

  Future<CategoryEntity?> getCategoryByName(String name);

  //================================
  //========== INSERT ==============
  //================================/*
  Future<int> insertCategory(CategoryEntity category); //return localId
  Future<Result<int, Failure>> insertTask(TaskEntity task); //return localId
  Future<void> insertSubtask(int taskLocalId);

  //================================
  //========== DELETE ==============
  //================================
  Future<void> deleteTask(int localId);

  Future<void> deleteSubtask(int localId);
}
