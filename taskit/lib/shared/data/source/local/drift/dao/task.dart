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

  Stream<TaskTableData?> watchTaskByLocalId(int localId) =>
      (select(taskTable)..where((tbl) => tbl.localId.equals(localId)))
          .watchSingleOrNull();

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

  Future<int> deleteTaskByLocalId(int localId) =>
      (delete(taskTable)..where((tbl) => tbl.localId.equals(localId))).go();

  //endregion

  // ================================
  // ========== UPDATE ==============
  // ================================
  //region UPDATE
  Future<int> updateTaskStatus(int localId, String status) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
            status: Value(status),
            updatedAt: Value(DateTime.now()),
            completedAt: Value(status == 'completed' ? DateTime.now() : null)),
      );

  Future<void> updateTaskTitle(int localId, String title) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId)))
          .write(TaskTableCompanion(
        title: Value(title),
        updatedAt: Value(DateTime.now()),
      ));

  Future<void> updateTaskDescription(int localId, String description) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
          TaskTableCompanion(
              description: Value(description),
              updatedAt: Value(DateTime.now())));

  Future<void> updateTaskPriority(int localId, String priority) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId)))
          .write(TaskTableCompanion(
        priority: Value(priority),
        updatedAt: Value(DateTime.now()),
      ));

  Future<void> updateTaskCategory(int localId, int categoryLocalId) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId)))
          .write(TaskTableCompanion(
        categoryLocalId: Value(categoryLocalId),
        updatedAt: Value(DateTime.now()),
      ));

  Future<void> updateTaskDueDate(int localId, DateTime? dueDate) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId)))
          .write(TaskTableCompanion(
        dueDate: Value(dueDate),
        hasTime: dueDate == null ? Value(false) : Value.absent(),
        updatedAt: Value(DateTime.now()),
      ));

  Future<void> updateTaskHasTime(int localId, bool hasTime) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId)))
          .write(TaskTableCompanion(
        hasTime: Value(hasTime),
        updatedAt: Value(DateTime.now()),
      ));

//endregion
}
