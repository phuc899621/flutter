import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';

import '../../../shared/exception/failure.dart';
import '../../category/domain/entities/category_entity.dart';
import '../domain/entities/ai_task_entity.dart';
import '../domain/entities/subtask_entity.dart';

abstract interface class ITaskService {
  //================================
  //========== WATCH ===============
  //================================
  Stream<List<TaskEntity>> watchAllTasks(int userLocalId);

  Stream<List<TaskEntity>> watchTodayTask(int userLocalId);

  Stream<List<TaskEntity>> watchTomorrowTask(int userLocalId);

  Stream<List<TaskEntity>> watchThisWeekTask(int userLocalId);

  Stream<List<TaskEntity>> watchPendingTask(int userLocalId);

  Stream<List<TaskEntity>> watchCompletedTodayTask(int userLocalId);

  Stream<List<TaskEntity>> watchCompletedThisWeekTask(int userLocalId);

  Stream<List<TaskEntity>> watchThisWeekOverDueTask(int userLocalId);

  Stream<List<TaskEntity>> watchTodayOverDueTask(int userLocalId);

  Stream<TaskEntity?> watchTaskByLocalId(int localId, int userLocalId);

  Stream<List<SubtaskEntity>> watchSubtasksByTaskLocalId(int localId);

  Stream<List<TaskEntity>> watchTaskByDueDate(
    DateTime dueDate,
    int userLocalId,
  );

  //================================
  //========== UPDATE =============
  //================================
  Future<void> updateTaskStatus(int localId, int userLocalId);

  Future<void> updateSubtaskStatus(int localId);

  Future<void> updateTaskTitle(int localId, String title);

  Future<void> updateTaskDescription(int localId, String description);

  Future<void> updateTaskPriority(int localId, TaskPriority priority);

  Future<void> updateTaskCategory(
    int localId,
    int categoryLocalId,
    int userLocalId,
  );

  Future<void> updateTaskDueDate(int localId, DateTime? dueDate);

  Future<void> updateTaskHasTime(int localId, bool hasTime);

  Future<void> updateSubtaskTitle(int localId, String title);

  //================================
  //========== READ ==============
  //================================
  Future<Result<List<CategoryEntity>, Failure>> getAICategory(
    String title,
    int userLocalId,
  );

  //================================
  //========== INSERT ==============
  //================================/*
  Future<Result<int, Failure>> insertTask(TaskEntity task); //return localId
  Future<void> insertSubtask(int taskLocalId);

  //================================
  //========== DELETE ==============
  //================================
  Future<void> deleteTask(int localId);

  Future<void> deleteSubtask(int localId);

  //================================
  //========== AI  ================
  //================================

  Future<Result<AiTaskEntity, Failure>> generateAiTask(
    String text,
    int userLocalId,
  );

  Future<Result<String, Failure>> getAiAnswer(String question, String language);
}
