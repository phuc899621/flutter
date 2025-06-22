import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/source/local/drift/table/subtask.dart';

import '../database/database.dart';
import '../table/task.dart';

part 'task.g.dart';

final taskDaoProvider = Provider<TaskDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return TaskDao(db);
});

@DriftAccessor(tables: [TaskTable, SubtaskTable])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  // ================================
  // ========== WATCH ==============
  // ================================
  //region WATCH
  Stream<List<TaskTableData>> watchAllTasks() => select(taskTable).watch();

  //endregion

  // ================================
  // ========== READ ==============
  // ================================
  //region READ
  Future<TaskTableData?> getTaskByRemoteId(String remoteId) =>
      (select(taskTable)..where((tbl) => tbl.remoteId.equals(remoteId)))
          .getSingleOrNull();

  Future<TaskTableData?> getTaskByLocalId(int localId) =>
      (select(taskTable)..where((tbl) => tbl.localId.equals(localId)))
          .getSingleOrNull();

  Future<List<TaskTableData>> getAllTasks() => select(taskTable).get();

  //endregion

  // ================================
  // ========== INSERT ==============
  // ================================
  //region INSERT
  Future<int> insertTask(TaskTableCompanion task) =>
      into(taskTable).insert(task);

  Future<void> insertAllTasks(List<TaskTableCompanion> tasks) => batch((batch) {
        batch.insertAll(taskTable, tasks);
      });

  //endregion

  // ================================
  // ========== DELETE ==============
  // ================================
  //region DELETE
  Future<int> deleteTask() => delete(taskTable).go();

  //endregion

  // ================================
  // ========== UPDATE ==============
  // ================================
  //region UPDATE
  Future<int> updateTaskStatus(int localId, String status) async {
    final task = await (select(taskTable)
          ..where((tbl) => tbl.localId.equals(localId)))
        .getSingleOrNull();
    if (task == null) return 0;

    final String statusUpdate;
    if (status != 'completed' && task.dueDate != null) {
      statusUpdate = 'scheduled';
    } else if (status != 'completed' && task.dueDate == null) {
      statusUpdate = 'pending';
    } else {
      statusUpdate = 'completed';
    }
    if (statusUpdate == 'completed') {
      await (update(subtaskTable)
            ..where((tbl) =>
                tbl.taskLocalId.equals(localId) &
                tbl.isCompleted.equals(false)))
          .write(SubtaskTableCompanion(
        isCompleted: Value(true),
        updatedAt: Value(DateTime.now()),
        completedAt: Value(DateTime.now()),
      ));
    } else {
      await (update(subtaskTable)
            ..where((tbl) =>
                tbl.taskLocalId.equals(localId) & tbl.isCompleted.equals(true)))
          .write(SubtaskTableCompanion(
        isCompleted: Value(false),
        updatedAt: Value(DateTime.now()),
        completedAt: Value(DateTime.now()),
      ));
    }
    return (update(taskTable)..where((tbl) => tbl.localId.equals(localId)))
        .write(
      TaskTableCompanion(
          status: Value(statusUpdate),
          updatedAt: Value(DateTime.now()),
          completedAt:
              Value(statusUpdate == 'completed' ? DateTime.now() : null)),
    );
  }
//endregion
}
