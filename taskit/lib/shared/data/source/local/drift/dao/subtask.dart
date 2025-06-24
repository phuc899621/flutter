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

  // ================================
  // ========== WATCH ==============
  // ================================
  //region WATCH
  Stream<List<SubtaskTableData>> watchAllSubtasks() =>
      select(subtaskTable).watch();

  //endregion

  // ================================
  // ========== READ ==============
  // ================================
  //region READ
  Future<List<SubtaskTableData>> fetchSubtasks() => select(subtaskTable).get();

  Future<List<SubtaskTableData>> findSubtasksByTaskLocalId(int taskLocalId) =>
      (select(subtaskTable)
            ..where((tbl) => tbl.taskLocalId.equals(taskLocalId)))
          .get();

  Future<SubtaskTableData?> getSubtasksByLocalId(int localId) =>
      (select(subtaskTable)..where((tbl) => tbl.localId.equals(localId)))
          .getSingleOrNull();

  Future<List<SubtaskTableData>> findUncompletedSubtaskByTaskLocalId(
          int taskLocalId) =>
      (select(subtaskTable)
            ..where((tbl) =>
                tbl.taskLocalId.equals(taskLocalId) &
                tbl.isCompleted.equals(false)))
          .get();

  //endregion

  // ================================
  // ========== INSERT ==============
  // ================================
  //region INSERT
  Future<void> insertAllSubtasks(List<SubtaskTableCompanion> subtasks) =>
      batch((batch) {
        batch.insertAll(subtaskTable, subtasks);
      });

  Future<int> insertSubtask(SubtaskTableCompanion subtask) =>
      into(subtaskTable).insert(subtask);

  //endregion

  // ================================
  // ========== UPDATE ==============
  // ================================
  //region UPDATE

  Future<int> updateSubtaskStatus(int localId, bool isCompleted) =>
      (update(subtaskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        SubtaskTableCompanion(
          isCompleted: Value(isCompleted),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateToCompletedSubtasks(int localId) => (update(subtaskTable)
            ..where((tbl) =>
                tbl.taskLocalId.equals(localId) &
                tbl.isCompleted.equals(false)))
          .write(SubtaskTableCompanion(
        isCompleted: Value(true),
        completedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ));

  Future<void> updateToUncompletedSubtasks(int localId) => (update(subtaskTable)
            ..where((tbl) =>
                tbl.taskLocalId.equals(localId) & tbl.isCompleted.equals(true)))
          .write(SubtaskTableCompanion(
        isCompleted: Value(false),
        completedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ));

  Future<void> updateSubtaskTitle(int localId, String title) =>
      (update(subtaskTable)..where((tbl) => tbl.localId.equals(localId)))
          .write(SubtaskTableCompanion(
        title: Value(title),
        updatedAt: Value(DateTime.now()),
      ));

  //endregion

  // ================================
  // ========== DELETE ==============
  // ================================
  //region DELETE
  Future<int> deleteSubtaskById(int id) =>
      (delete(subtaskTable)..where((item) => item.localId.equals(id))).go();

  Future<int> deleteSubtasksByTaskLocalId(int taskLocalId) =>
      (delete(subtaskTable)
            ..where((item) => item.taskLocalId.equals(taskLocalId)))
          .go();
//endregion
}
