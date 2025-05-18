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
  Future<List<TaskTableData>> getTasks() => select(taskTable).get();
  Future<int> insertTask(TaskTableCompanion task) =>
      into(taskTable).insert(task);
  Future<bool> updateTask(TaskTableCompanion task) =>
      update(taskTable).replace(task);
  Future<int> deleteTask() => delete(taskTable).go();
  Future<void> insertAllTasks(List<TaskTableCompanion> tasks) => batch((batch) {
        batch.insertAll(taskTable, tasks);
      });
}
