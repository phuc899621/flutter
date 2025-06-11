import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database.dart';
import '../table/subtask.dart';

part 'subtask.g.dart';

final subtaskDaoProvider = Provider<SubtaskDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SubtaskDao(db);
});

@DriftAccessor(tables: [SubtaskTable])
class SubtaskDao extends DatabaseAccessor<AppDatabase> with _$SubtaskDaoMixin {
  SubtaskDao(super.db);
  Future<List<SubtaskTableData>> getSubtasks() => select(subtaskTable).get();
  Future<int> insertSubtask(SubtaskTableCompanion subtask) =>
      into(subtaskTable).insert(subtask);
  Future<bool> updateSubtask(SubtaskTableCompanion subtask) =>
      update(subtaskTable).replace(subtask);
  Future<int> deleteSubtaskById(int id) =>
      (delete(subtaskTable)..where((item) => item.localId.equals(id))).go();

  Future<void> insertAllSubtasks(List<SubtaskTableCompanion> subtasks) =>
      batch((batch) {
        batch.insertAll(subtaskTable, subtasks);
      });
  Stream<List<SubtaskTableData>> watchAllSubtasks() =>
      select(subtaskTable).watch();
}
