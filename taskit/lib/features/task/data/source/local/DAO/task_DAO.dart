import 'package:floor/floor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/task.dart';
import '../task_database.dart';

final taskDAOProvider = Provider<TaskDAO>((ref) {
  final database = ref.watch(taskDatabaseProvider);
  return database.taskDAO;
});

@dao
abstract class TaskDAO {
  @Insert()
  Future<void> insertTask(TaskModel task);
  @Query('SELECT * FROM tasks')
  Future<List<TaskModel>> getAllTasks();
  @Query('DELETE FROM tasks')
  Future<void> deleteAllTasks();
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllTasks(List<TaskModel> tasks);
}
