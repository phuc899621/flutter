import 'package:taskit/shared/data/source/local/drift/database/database.dart';

abstract interface class ITaskLocalSource {
  /*
  * Watch*/
  Stream<List<TaskTableData>> watchAllTasks();

  Stream<List<SubtaskTableData>> watchAllSubtasks();

  Stream<List<CategoryTableData>> watchAllCategories();

  /*
  * Update
  * */
  Future<void> updateTask(
      {required int localId, String? title, String? status});

  Future<void> updateSubtask(
      {required int localId, bool? isCompleted, String? title});

  Future<void> updateSubtaskStatus({required int localId});

  /*
  * Read
  * */
  Future<List<CategoryTableData>> getCategories();

  Future<TaskTableData?> getTaskByLocalId(int localId);

  Future<CategoryTableData?> getCategoryByLocalId(int localId);

  Future<List<SubtaskTableData>> getSubtaskByTaskLocalId(int taskLocalId);

  /*
  * Insert
  * */
  Future<int> insertCategory(CategoryTableCompanion category);
}
