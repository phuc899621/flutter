import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database.dart';
import '../table/task.dart';

part 'task.g.dart';

final taskDaoProvider = Provider<TaskDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return TaskDao(db);
});

@DriftAccessor(tables: [TaskTable])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  /*
  * Stream all tasks
  * */
  Stream<List<TaskTableData>> watchAllTasks() => select(taskTable).watch();

  /*
  * ReadTask
  * */
  //get home by remoteId
  Future<TaskTableData?> getTaskByRemoteId(String remoteId) =>
      (select(taskTable)..where((tbl) => tbl.remoteId.equals(remoteId)))
          .getSingleOrNull();
  //get task by localId
  Future<TaskTableData?> getTaskByLocalId(int localId) =>
      (select(taskTable)..where((tbl) => tbl.localId.equals(localId)))
          .getSingleOrNull();

  Future<List<TaskTableData>> getAllTasks() => select(taskTable).get();

  /*
  * Insert Task
  * */
  Future<int> insertTask(TaskTableCompanion task) =>
      into(taskTable).insert(task);
  Future<void> insertAllTasks(List<TaskTableCompanion> tasks) => batch((batch) {
        batch.insertAll(taskTable, tasks);
      });

  /*
  * Delete Task
  * */
  Future<int> deleteTask() => delete(taskTable).go();

  /*
  * Update Task
  * */
  Future<int> updateTask({
    required int localId,
    String? title,
    String? status,
  }) async {
    final task = await (select(taskTable)
          ..where((tbl) => tbl.localId.equals(localId)))
        .getSingleOrNull();
    if (task == null) return 0;

    final titleUpdate = title;

    final String? statusUpdate;
    if (status != null) {
      if (status != 'completed' && task.dueDate != null) {
        statusUpdate = 'scheduled';
      } else if (status != 'completed' && task.dueDate == null) {
        statusUpdate = 'pending';
      } else {
        statusUpdate = 'completed';
      }
    } else {
      statusUpdate = status;
    }

    return (update(taskTable)..where((tbl) => tbl.localId.equals(localId)))
        .write(
      TaskTableCompanion(
        title: titleUpdate != null ? Value(titleUpdate) : const Value.absent(),
        status:
            statusUpdate != null ? Value(statusUpdate) : const Value.absent(),
      ),
    );
  }
}
