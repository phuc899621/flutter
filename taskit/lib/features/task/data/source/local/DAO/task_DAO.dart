import 'package:floor/floor.dart';

import '../../../model/task.dart';

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
