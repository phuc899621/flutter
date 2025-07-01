import 'package:taskit/shared/data/source/local/drift/database/database.dart';

abstract interface class ITaskLocalSource {
  // ================================
  // ========== WATCH ==============
  // ================================
  Stream<List<TaskTableData>> watchAllTasks();

  Stream<List<SubtaskTableData>> watchAllSubtasks();

  Stream<List<CategoryTableData>> watchAllCategories();

  Stream<TaskTableData?> watchTaskByLocalId(int localId);

  // ================================
  // ========== UPDATE ==============
  // ================================
  Future<void> updateTaskStatus(int localId, String status);

  Future<void> updateSubtaskStatus(int localId);

  Future<void> updateTaskTitle(int localId, String title);

  Future<void> updateTaskDescription(int localId, String description);

  Future<void> updateTaskCategory(int localId, int categoryLocalId);

  Future<void> updateTaskPriority(int localId, String priority);

  Future<void> updateTaskDueDate(int localId, DateTime? dueDate);

  Future<void> updateTaskHasTime(int localId, bool hasTime);

  Future<void> updateSubtaskTitle(int localId, String title);

  Future<void> updateSyncAddTaskAndSubtask(
      TaskTableCompanion task, List<SubtaskTableCompanion> subtask);

  Future<void> updateSyncTask(int localId);

  Future<void> updateSyncSubtasks(List<int> localIds);

  Future<void> updateSyncSubtasksFromSubtasksTblCompanion(
      List<SubtaskTableCompanion> subtask);

  Future<void> updateSyncAddCategory(int localId, String remoteId);

  // ================================
  // ========== READ ==============
  // ================================
  Future<List<CategoryTableData>> getCategories();

  Future<TaskTableData?> getTaskByLocalId(int localId);

  Future<CategoryTableData?> getCategoryByLocalId(int localId);

  Future<List<SubtaskTableData>> getSubtaskByTaskLocalId(int taskLocalId);

  Future<CategoryTableData?> getCategoryByName(String name);

  Future<SubtaskTableData?> getSubtaskByLocalId(int localId);

  // ================================
  // ========== INSERT ==============
  // ================================
  Future<int> insertCategory(CategoryTableCompanion category);

  Future<int> insertTask(TaskTableCompanion task,
      List<SubtaskTableCompanion> subtasks, CategoryTableCompanion category);

  Future<int> insertSubtask(SubtaskTableCompanion subtask);

  //================================
  //========== DELETE ==============
  //================================
  Future<void> deleteTaskByLocalId(int id);

  Future<void> deleteSubtaskByLocalId(int id);
}
