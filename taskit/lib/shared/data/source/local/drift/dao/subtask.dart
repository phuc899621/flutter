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
  Future<int> updateSubtask(
      {required localId, bool? isCompleted, String? title}) async {
    final subtask = await (select(subtaskTable)
          ..where((tbl) => tbl.localId.equals(localId)))
        .getSingleOrNull();

    if (subtask == null) return 0;
    final returnInt = await (update(subtaskTable)
          ..where((tbl) => tbl.localId.equals(localId)))
        .write(SubtaskTableCompanion(
      isCompleted:
          isCompleted != null ? Value(isCompleted) : const Value.absent(),
      title:
          title != null && title.isEmpty ? Value(title) : const Value.absent(),
      updatedAt: Value(DateTime.now()),
      completedAt: isCompleted != null && isCompleted
          ? Value(DateTime.now())
          : const Value.absent(),
    ));
    if (isCompleted != null) _checkAndUpdateTaskStatus(subtask.taskLocalId);
    return returnInt;
  }

  Future<int> updateSubtaskStatus({required localId}) async {
    final subtask = await (select(subtaskTable)
          ..where((tbl) => tbl.localId.equals(localId)))
        .getSingleOrNull();
    if (subtask == null) return 0;

    final returnInt = await (update(subtaskTable)
          ..where((tbl) => tbl.localId.equals(localId)))
        .write(SubtaskTableCompanion(
      isCompleted: Value(!subtask.isCompleted),
    ));

    _checkAndUpdateTaskStatus(subtask.taskLocalId);
    return returnInt;
  }

  //endregion

  // ================================
  // ========== DELETE ==============
  // ================================
  //region DELETE
  Future<int> deleteSubtaskById(int id) =>
      (delete(subtaskTable)..where((item) => item.localId.equals(id))).go();

  //endregion
  /*
  * Check
  * */
  Future<void> _checkAndUpdateTaskStatus(int taskLocalId) async {
    final inCompleted = await (select(subtaskTable)
          ..where((tbl) =>
              tbl.taskLocalId.equals(taskLocalId) &
              tbl.isCompleted.equals(false)))
        .get();

    //get task by taskLocalId
    final task = await (select(taskTable)
          ..where((tbl) => tbl.localId.equals(taskLocalId)))
        .getSingleOrNull();
    if (task == null) return;

    final newStatus = inCompleted.isEmpty
        ? 'completed'
        : (task.dueDate != null ? 'scheduled' : 'pending');
    //call update task status
    await (update(taskTable)..where((tbl) => tbl.localId.equals(taskLocalId)))
        .write(
      TaskTableCompanion(
        status: Value(newStatus),
        updatedAt: Value(DateTime.now()),
        completedAt: Value(newStatus == 'completed' ? DateTime.now() : null),
      ),
    );
  }
}
