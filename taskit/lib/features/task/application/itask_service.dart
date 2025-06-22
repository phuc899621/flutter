import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';

import '../../../shared/exception/failure.dart';
import '../domain/entities/category_entity.dart';

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

  //================================
  //========== SUBTASK =============
  //================================
  Future<void> updateTaskStatus(int localId);

  Future<void> updateSubtaskStatus(int localId);

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
}
