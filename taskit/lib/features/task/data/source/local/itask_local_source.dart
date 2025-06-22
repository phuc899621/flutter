import 'package:taskit/shared/data/source/local/drift/database/database.dart';

abstract interface class ITaskLocalSource {
  // ================================
  // ========== WATCH ==============
  // ================================
  Stream<List<TaskTableData>> watchAllTasks();

  Stream<List<SubtaskTableData>> watchAllSubtasks();

  Stream<List<CategoryTableData>> watchAllCategories();

  // ================================
  // ========== UPDATE ==============
  // ================================
  Future<void> updateTaskStatus(int localId, String status);

  Future<void> updateSubtask(
      {required int localId, bool? isCompleted, String? title});

  Future<void> updateSubtaskStatus({required int localId});

  // ================================
  // ========== READ ==============
  // ================================
  Future<List<CategoryTableData>> getCategories();

  Future<TaskTableData?> getTaskByLocalId(int localId);

  Future<CategoryTableData?> getCategoryByLocalId(int localId);

  Future<List<SubtaskTableData>> getSubtaskByTaskLocalId(int taskLocalId);

  Future<CategoryTableData?> getCategoryByName(String name);

  // ================================
  // ========== INSERT ==============
  // ================================
  Future<int> insertCategory(CategoryTableCompanion category);

  Future<int> insertTask(TaskTableCompanion task,
      List<SubtaskTableCompanion> subtasks, CategoryTableCompanion category);
}
