import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/source/local/drift/table/subtask.dart';

import '../../../../../../shared/data/source/local/drift/database/database.dart';
import '../../../../../../shared/data/source/local/drift/table/category.dart';
import '../../../../../../shared/data/source/local/drift/table/task.dart';

part 'task.g.dart';

final taskDaoProvider = Provider<TaskDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return TaskDao(db);
});

class TaskDetailTableData {
  final TaskTableData data;
  final List<SubtaskTableData> subtasks;
  final CategoryTableData category;

  TaskDetailTableData({
    required this.data,
    required this.subtasks,
    required this.category,
  });
}

class TaskInsertDetail {
  final TaskTableCompanion task;
  final List<SubtaskTableCompanion> subtasks;
  final String categoryRemoteId;

  TaskInsertDetail({
    required this.task,
    required this.subtasks,
    required this.categoryRemoteId,
  });
}

@DriftAccessor(tables: [TaskTable, SubtaskTable, CategoryTable])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  ///Base query for task detail
  JoinedSelectStatement<HasResultSet, dynamic> _baseDetailQuery() {
    return select(taskTable).join([
      leftOuterJoin(
        subtaskTable,
        subtaskTable.taskLocalId.equalsExp(taskTable.localId) &
            subtaskTable.deleted.equals(false),
      ),

      innerJoin(
        categoryTable,
        categoryTable.localId.equalsExp(taskTable.categoryLocalId) &
            categoryTable.deleted.equals(false),
      ),
    ]);
  }

  Map<int, List<TypedResult>> _groupRowsByTaskId(List<TypedResult> rows) {
    final groupedRows = <int, List<TypedResult>>{};

    for (final row in rows) {
      final task = row.readTable(taskTable);

      groupedRows.putIfAbsent(task.localId, () => []).add(row);
    }

    return groupedRows;
  }

  ///Map task rows to TaskDetailTableData including category and subtasks Information
  TaskDetailTableData _mapTaskDetail(List<TypedResult> taskRows) {
    final firstRow = taskRows.first;
    final task = firstRow.readTable(taskTable);
    final category = firstRow.readTable(categoryTable);
    final seen = <int>{};
    final subtasks = taskRows
        .map((row) => row.readTableOrNull(subtaskTable))
        .whereType<SubtaskTableData>()
        .where((subtask) => seen.add(subtask.localId))
        .toList();

    return TaskDetailTableData(
      data: task,
      subtasks: subtasks,
      category: category,
    );
  }

  ({DateTime start, DateTime end}) _dayRange(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);

    final end = start.add(const Duration(days: 1));

    return (start: start, end: end);
  }

  //region WATCH
  Stream<List<TaskDetailTableData>> watchDetail(int userLocalId) {
    final query = _baseDetailQuery()
      ..where(
        taskTable.deleted.equals(false) &
            taskTable.userLocalId.equals(userLocalId),
      );

    return query.watch().map((rows) {
      final groupedRows = _groupRowsByTaskId(rows);

      return groupedRows.values.map(_mapTaskDetail).toList();
    });
  }

  Stream<TaskDetailTableData?> watchById(int localId, int userLocalId) {
    final query = _baseDetailQuery()
      ..where(
        taskTable.localId.equals(localId) &
            taskTable.deleted.equals(false) &
            taskTable.userLocalId.equals(userLocalId),
      );
    return query.watch().map((rows) {
      if (rows.isEmpty) return null;
      return _mapTaskDetail(rows);
    });
  }

  Stream<List<TaskDetailTableData>> watchByDueDate(
    DateTime? dueDate,
    int userLocalId,
  ) {
    final query = _baseDetailQuery()
      ..where(
        taskTable.deleted.equals(false) &
            taskTable.userLocalId.equals(userLocalId),
      );
    if (dueDate == null) {
      query.where(taskTable.dueDate.isNull());
    } else {
      final range = _dayRange(dueDate);
      query.where(
        taskTable.dueDate.isBiggerOrEqualValue(range.start) &
            taskTable.dueDate.isSmallerOrEqualValue(range.end),
      );
    }
    return query.watch().map((rows) {
      final groupedRows = _groupRowsByTaskId(rows);
      return groupedRows.values.map(_mapTaskDetail).toList();
    });
  }

  //endregion

  //region READ
  Future<TaskTableData?> findByRemoteId(String remoteId, int userLocalId) =>
      (select(taskTable)..where(
            (tbl) =>
                tbl.remoteId.equals(remoteId) &
                tbl.deleted.equals(false) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .getSingleOrNull();

  Future<TaskDetailTableData?> findDetailById(
    int localId,
    int userLocalId,
  ) async {
    final query =
        (select(taskTable).join([
          leftOuterJoin(
            subtaskTable,
            subtaskTable.taskLocalId.equalsExp(taskTable.localId) &
                subtaskTable.deleted.equals(false),
          ),
          leftOuterJoin(
            categoryTable,
            categoryTable.localId.equalsExp(taskTable.categoryLocalId) &
                categoryTable.deleted.equals(false),
          ),
        ])..where(
          taskTable.localId.equals(localId) &
              taskTable.deleted.equals(false) &
              taskTable.userLocalId.equals(userLocalId),
        ));
    final rows = await query.get();
    if (rows.isEmpty) return null;
    final task = rows.first.readTable(taskTable);
    final category = rows.first.readTableOrNull(categoryTable);
    if (category == null) return null;
    final subtasks = rows
        .map((r) => r.readTableOrNull(subtaskTable))
        .whereType<SubtaskTableData>()
        .toList();
    return TaskDetailTableData(
      data: task,
      subtasks: subtasks,
      category: category,
    );
  }

  Future<TaskTableData?> findById(int localId, int userLocalId) =>
      (select(taskTable)..where(
            (tbl) =>
                tbl.localId.equals(localId) &
                tbl.deleted.equals(false) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .getSingleOrNull();

  Future<List<TaskTableData>> findAll(int userLocalId) => (select(
    taskTable,
  )..where((tbl) => tbl.userLocalId.equals(userLocalId))).get();

  Future<List<TaskTableData>> findByCategoryId(
    int categoryLocalId,
    int userLocalId,
  ) =>
      (select(taskTable)..where(
            (tbl) =>
                tbl.categoryLocalId.equals(categoryLocalId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .get();

  Future<List<TaskDetailTableData>> findUnsynced(int userLocalId) async {
    final query = _baseDetailQuery()
      ..where(
        taskTable.synced.equals(false) &
            taskTable.deleted.equals(false) &
            taskTable.userLocalId.equals(userLocalId),
      );
    final rows = await query.get();
    final groupedRows = _groupRowsByTaskId(rows);
    return groupedRows.values.map(_mapTaskDetail).toList();
  }

  Future<List<TaskDetailTableData>> findUnsyncedDeleted(int userLocalId) async {
    final query = _baseDetailQuery()
      ..where(
        taskTable.userLocalId.equals(userLocalId) &
            taskTable.synced.equals(false) &
            taskTable.deleted.equals(true),
      );
    final rows = await query.get();
    final groupedRows = _groupRowsByTaskId(rows);
    return groupedRows.values.map(_mapTaskDetail).toList();
  }

  //endregion

  //region INSERT
  Future<int> insertOne(TaskTableCompanion task) =>
      into(taskTable).insert(task);

  Future<void> insertMany(List<TaskTableCompanion> tasks) => batch((batch) {
    batch.insertAll(taskTable, tasks);
  });

  //endregion

  //region UPDATE
  Future<int> updateById(
    int localId,
    int userLocalId,
    TaskTableCompanion task,
  ) => (update(
    taskTable,
  )..where((tbl) => tbl.localId.equals(localId))).write(task);

  Future<int> updateTaskStatus(int localId, String status) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          status: Value(status),
          updatedAt: Value(DateTime.now()),
          completedAt: Value(status == 'completed' ? DateTime.now() : null),
        ),
      );

  Future<int> updateTaskStatusWithoutSync(int localId, String status) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          status: Value(status),
          updatedAt: Value(DateTime.now()),
          synced: Value(false),
          completedAt: Value(status == 'completed' ? DateTime.now() : null),
        ),
      );

  Future<void> updateTaskTitleWithoutSync(int localId, String title) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          title: Value(title),
          synced: Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateTaskDescription(int localId, String description) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          description: Value(description),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateTaskDescriptionWithoutSync(
    int localId,
    String description,
  ) => (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
    TaskTableCompanion(
      description: Value(description),
      synced: Value(false),
      updatedAt: Value(DateTime.now()),
    ),
  );

  Future<void> updateTaskPriority(int localId, String priority) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          priority: Value(priority),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateTaskPriorityWithoutSync(int localId, String priority) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          priority: Value(priority),
          synced: Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateTaskCategory(int localId, int categoryLocalId) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          categoryLocalId: Value(categoryLocalId),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateTaskCategoryWithoutSync(
    int localId,
    int categoryLocalId,
  ) => (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
    TaskTableCompanion(
      categoryLocalId: Value(categoryLocalId),
      synced: Value(false),
      updatedAt: Value(DateTime.now()),
    ),
  );

  Future<void> updateTaskDueDate(int localId, DateTime? dueDate) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          dueDate: Value(dueDate),
          hasTime: dueDate == null ? Value(false) : Value.absent(),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateTaskDueDateWithoutSync(int localId, DateTime? dueDate) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          dueDate: Value(dueDate),
          synced: Value(false),
          hasTime: dueDate == null ? Value(false) : Value.absent(),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateTaskHasTime(int localId, bool hasTime) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          hasTime: Value(hasTime),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateTaskHasTimeWithoutSync(int localId, bool hasTime) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(
          hasTime: Value(hasTime),
          synced: Value(false),
          updatedAt: Value(DateTime.now()),
        ),
      );

  Future<void> updateTask(TaskTableCompanion task) => (update(
    taskTable,
  )..where((tbl) => tbl.localId.equals(task.localId.value))).write(task);

  Future<void> updateTaskSync(int localId) =>
      (update(taskTable)..where((tbl) => tbl.localId.equals(localId))).write(
        TaskTableCompanion(synced: Value(true)),
      );

  //endregion
  Future<void> upsertOne(TaskInsertDetail detail) async {
    await transaction(() async {
      final remoteIdValue = detail.task.remoteId.present
          ? detail.task.remoteId.value
          : null;
      if (remoteIdValue == null) return;
      var category =
          await (select(categoryTable)..where(
                (tbl) =>
                    tbl.remoteId.equals(detail.categoryRemoteId) &
                    tbl.userLocalId.equals(detail.task.userLocalId.value) &
                    tbl.deleted.equals(false),
              ))
              .getSingleOrNull();
      category ??=
          await (select(categoryTable)..where(
                (tbl) =>
                    tbl.isDefault.equals(true) &
                    tbl.userLocalId.equals(detail.task.userLocalId.value) &
                    tbl.deleted.equals(false),
              ))
              .getSingle();
      await into(taskTable).insert(
        detail.task.copyWith(categoryLocalId: Value(category.localId)),
        onConflict: DoUpdate((_) => detail.task, target: [taskTable.remoteId]),
      );

      final taskRecord = await (select(
        taskTable,
      )..where((t) => t.remoteId.equals(remoteIdValue))).getSingle();

      if (detail.subtasks.isNotEmpty) {
        await batch((b) {
          for (final subtask in detail.subtasks) {
            final subtaskWithId = subtask.copyWith(
              taskLocalId: Value(taskRecord.localId),
            );

            b.insert(
              subtaskTable,
              subtaskWithId,
              onConflict: DoUpdate(
                (_) => subtaskWithId,
                target: [subtaskTable.remoteId],
              ),
            );
          }
        });
      }
    });
  }

  Future<void> reconcile({
    required int userLocalId,
    required List<TaskTableCompanion> tasks,
  }) async {
    final upsertTasks = tasks.where((e) => !(e.deleted.value)).toList();

    final deleteTasksIds = tasks
        .where((e) => e.deleted.value)
        .map((e) => e.remoteId.value)
        .whereType<String>()
        .toList();

    await transaction(() async {
      if (upsertTasks.isNotEmpty) {
        await batch((batch) {
          for (final companion in upsertTasks) {
            batch.insert(
              taskTable,
              companion,
              onConflict: DoUpdate(
                (_) => companion,
                target: [taskTable.remoteId],
              ),
            );
          }
        });
      }

      if (deleteTasksIds.isNotEmpty) {
        await (delete(taskTable)..where(
              (tbl) =>
                  tbl.userLocalId.equals(userLocalId) &
                  tbl.remoteId.isIn(deleteTasksIds),
            ))
            .go();
      }
    });
  }

  Future<void> updateMultipleDifferent(
    int userLocalId,
    List<TaskTableCompanion> companions,
  ) => batch((b) {
    for (final companion in companions) {
      b.update(
        taskTable,
        companion,
        where: (tbl) =>
            tbl.userLocalId.equals(userLocalId) &
            tbl.localId.equals(companion.localId.value),
      );
    }
  });

  //region BATCH
  Future<void> upsertAll(List<TaskInsertDetail> details) async {
    await transaction(() async {
      for (final detail in details) {
        final remoteIdValue = detail.task.remoteId.present
            ? detail.task.remoteId.value
            : null;
        if (remoteIdValue == null) continue;
        var category =
            await (select(categoryTable)..where(
                  (tbl) =>
                      tbl.remoteId.equals(detail.categoryRemoteId) &
                      tbl.userLocalId.equals(detail.task.userLocalId.value) &
                      tbl.deleted.equals(false),
                ))
                .getSingleOrNull();
        category ??=
            await (select(categoryTable)..where(
                  (tbl) =>
                      tbl.isDefault.equals(true) &
                      tbl.userLocalId.equals(detail.task.userLocalId.value) &
                      tbl.deleted.equals(false),
                ))
                .getSingle();

        await into(taskTable).insert(
          detail.task.copyWith(categoryLocalId: Value(category.localId)),
          onConflict: DoUpdate(
            (_) => detail.task,
            target: [taskTable.remoteId],
          ),
        );

        final taskRecord = await (select(
          taskTable,
        )..where((t) => t.remoteId.equals(remoteIdValue))).getSingle();

        if (detail.subtasks.isNotEmpty) {
          await batch((b) {
            for (final subtask in detail.subtasks) {
              final subtaskWithId = subtask.copyWith(
                taskLocalId: Value(taskRecord.localId),
              );
              b.insert(
                subtaskTable,
                subtaskWithId,
                onConflict: DoUpdate(
                  (_) => subtaskWithId,
                  target: [subtaskTable.remoteId],
                ),
              );
            }
          });
        }
      }
    });
  }

  //endregion
  //region DELETE
  Future<int> deleteById(int localId, int userLocalId) =>
      (delete(taskTable)..where(
            (tbl) =>
                tbl.localId.equals(localId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .go();

  Future<int> deleteByRemoteId(String remoteId, int userLocalId) =>
      (delete(taskTable)..where(
            (tbl) =>
                tbl.remoteId.equals(remoteId) &
                tbl.userLocalId.equals(userLocalId),
          ))
          .go();

  Future<void> deleteMultipleByRemoteIds(
    int userLocalId,
    List<String> remoteIds,
  ) =>
      (delete(taskTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.remoteId.isIn(remoteIds),
          ))
          .go();

  Future<void> deleteMultipleByLocalIds(int userLocalId, List<int> localIds) =>
      (delete(taskTable)..where(
            (tbl) =>
                tbl.userLocalId.equals(userLocalId) &
                tbl.localId.isIn(localIds),
          ))
          .go();
  //endregion
}
