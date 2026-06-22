import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../shared/data/source/local/drift/database/database.dart';
import '../../../../../../shared/data/source/local/drift/table/subtask.dart';

part 'subtask.g.dart';

final subtaskDaoProvider = Provider<SubtaskDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SubtaskDao(db);
});

@DriftAccessor(tables: [SubtaskTable])
class SubtaskDao extends DatabaseAccessor<AppDatabase> with _$SubtaskDaoMixin {
  SubtaskDao(super.db);

  //region WATCH
  Stream<List<SubtaskTableData>> watchAllSubtasks() =>
      select(subtaskTable).watch();

  //endregion

  //region READ
  Future<List<SubtaskTableData>> findByTaskId(int taskLocalId) => (select(
    subtaskTable,
  )..where((tbl) => tbl.taskLocalId.equals(taskLocalId))).get();

  Future<List<SubtaskTableData>> findSyncedByTaskId(
    int taskLocalId,
    bool synced,
  ) =>
      (select(subtaskTable)..where(
            (tbl) =>
                tbl.taskLocalId.equals(taskLocalId) & tbl.synced.equals(synced),
          ))
          .get();

  Future<SubtaskTableData?> findById(int localId) => (select(
    subtaskTable,
  )..where((tbl) => tbl.localId.equals(localId))).getSingleOrNull();

  Future<List<SubtaskTableData>> findIncompleteByTaskId(int taskLocalId) =>
      (select(subtaskTable)..where(
            (tbl) =>
                tbl.taskLocalId.equals(taskLocalId) &
                tbl.completed.equals(false),
          ))
          .get();

  //endregion

  //region INSERT
  Future<void> insertMany(List<SubtaskTableCompanion> subtasks) =>
      batch((batch) {
        batch.insertAll(subtaskTable, subtasks);
      });

  Future<int> insertOne(SubtaskTableCompanion subtask) =>
      into(subtaskTable).insert(subtask);

  //endregion

  //region UPDATE

  Future<int> updateStatus(int localId, bool isCompleted) =>
      (update(subtaskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        SubtaskTableCompanion(
          completed: Value(isCompleted),
          synced: Value(false),
          completedAt: Value(isCompleted ? _utcNow : null),
          updatedAt: Value(_utcNow),
        ),
      );

  Future<int> updateDelete(int localId) =>
      (update(subtaskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        SubtaskTableCompanion(
          synced: Value(false),
          deleted: Value(true),
          updatedAt: Value(_utcNow),
        ),
      );

  Future<void> updateById(int localId, SubtaskTableCompanion companion) =>
      (update(
        subtaskTable,
      )..where((tbl) => tbl.localId.equals(localId))).write(companion);

  Future<int> updateSynced(int localId, bool isSync) =>
      (update(subtaskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        SubtaskTableCompanion(synced: Value(isSync), updatedAt: Value(_utcNow)),
      );

  Future<void> updateCompletedByTaskId(int taskLocalId, bool completed) =>
      (update(subtaskTable)..where(
            (tbl) =>
                tbl.taskLocalId.equals(taskLocalId) &
                tbl.completed.equals(!completed),
          ))
          .write(
            SubtaskTableCompanion(
              completed: Value(completed),
              synced: Value(false),
              completedAt: completed ? Value(_utcNow) : Value(null),
              updatedAt: Value(_utcNow),
            ),
          );

  Future<void> updateTitle(int localId, String title) =>
      (update(subtaskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        SubtaskTableCompanion(
          title: Value(title),
          synced: Value(false),
          updatedAt: Value(_utcNow),
        ),
      );

  Future<void> updateMany(List<SubtaskTableCompanion> subtasks) =>
      batch((batch) {
        for (var subtask in subtasks) {
          batch.update(
            subtaskTable,
            subtask,
            where: (tbl) => tbl.localId.equals(subtask.localId.value),
          );
        }
      });

  Future<void> markManyAsSynced(List<int> localIds) => batch((batch) {
    for (var localId in localIds) {
      batch.update(
        subtaskTable,
        SubtaskTableCompanion(synced: Value(true), updatedAt: Value(_utcNow)),
        where: (tbl) => tbl.localId.equals(localId),
      );
    }
  });

  Future<void> updateByTaskId(int taskId, SubtaskTableCompanion companion) =>
      (update(
        subtaskTable,
      )..where((tbl) => tbl.taskLocalId.equals(taskId))).write(companion);

  Future<void> updateManySame(
    List<int> localIds,
    SubtaskTableCompanion companion,
  ) => (update(
    subtaskTable,
  )..where((tbl) => tbl.localId.isIn(localIds))).write(companion);

  Future<void> updateManyDifference(
    List<SubtaskTableCompanion> companions,
  ) async {
    await batch((batch) {
      for (final companion in companions) {
        batch.update(
          subtaskTable,
          companion,
          where: (tbl) => tbl.localId.equals(companion.localId.value),
        );
      }
    });
  }

  //endregion

  //region DELETE
  Future<int> deleteById(int id) =>
      (delete(subtaskTable)..where((item) => item.localId.equals(id))).go();

  Future<int> deleteByTaskId(int taskLocalId) => (delete(
    subtaskTable,
  )..where((item) => item.taskLocalId.equals(taskLocalId))).go();

  //endregion

  DateTime get _utcNow => DateTime.now().toUtc();
}
