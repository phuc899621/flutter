import 'package:drift/drift.dart';
import 'package:taskit/features/task/data/mapper/subtask_local_mapper.dart';
import 'package:taskit/features/task/data/source/local/subtask/subtask.dart';
import 'package:taskit/features/task/data/source/local/subtask/subtask_local_source.dart';
import 'package:taskit/features/task/data/source/local/task/task.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../../../shared/data/source/local/drift/database/database.dart';

class SubtaskLocalSourceImpl implements SubtaskLocalSource {
  final SubtaskDao _subtaskDao;
  final TaskDao _taskDao;
  final AppDatabase _db;

  SubtaskLocalSourceImpl(this._db, this._taskDao, this._subtaskDao);

  //region READ
  @override
  Future<SubtaskEntity?> getSubtaskByLocalId(int localId) async =>
      (await _subtaskDao.findById(localId))?.toEntity();

  @override
  Future<List<SubtaskEntity>> getSubtasksByTaskId(int taskId) {
    // TODO: implement getSubtasksByTaskId
    throw UnimplementedError();
  }

  //endregion
  @override
  Future<void> updateSubtask(
    SubtaskUpdateField field,
    SubtaskEntity subtask,
  ) async {
    final companion = switch (field) {
      SubtaskUpdateField.title => SubtaskTableCompanion(
        title: Value(subtask.title),
        synced: Value(false),
        updatedAt: Value(_utcNow),
      ),
      SubtaskUpdateField.completed => SubtaskTableCompanion(
        completed: Value(subtask.completed),
        completedAt: Value(subtask.completedAt),
        synced: Value(false),
        updatedAt: Value(_utcNow),
      ),
    };
    await _subtaskDao.updateById(subtask.localId, companion);
    logger.d('[SubtaskLocalSourceImpl] subtask update ${field.name}');
  }

  //region INSERT
  @override
  Future<int> insertSubtask(SubtaskEntity subtask, int userLocalId) async {
    try {
      return await _db.transaction(() async {
        logger.d('[SubtaskLocalSourceImpl] Insert subtask start: $subtask');
        final localId = await _subtaskDao.insertOne(
          subtask.toInsertCompanion(subtask.taskLocalId),
        );
        final task = await _taskDao.findById(subtask.taskLocalId, userLocalId);
        if (task == null) {
          throw Exception('Task not found, cannot insert subtask');
        }
        final uncompletedSubtaskList = await _subtaskDao.findIncompleteByTaskId(
          task.localId,
        );

        final newTaskStatus = uncompletedSubtaskList.isEmpty
            ? TaskStatus.completed
            : (task.dueDate != null
                  ? TaskStatus.scheduled
                  : TaskStatus.pending);
        if (task.status != newTaskStatus.toString()) {
          await _taskDao.updateTaskStatus(
            task.localId,
            newTaskStatus.toString(),
          );
          logger.i(
            '[SubtaskLocalSourceImpl] Update task status $newTaskStatus',
          );
        }
        return localId;
      });
    } catch (e) {
      logger.e('[SubtaskLocalSourceImpl] Insert subtask error: $e');
      return -1;
    }
  }

  //endregion

  //region UPDATE
  @override
  Future<void> markSubtasksAsSynced(List<int> ids) =>
      _subtaskDao.updateManySame(
        ids,
        SubtaskTableCompanion(synced: Value(true), updatedAt: Value(_utcNow)),
      );

  @override
  Future<void> markSubtaskAsSynced(int localId) =>
      _subtaskDao.updateSynced(localId, true);

  @override
  Future<void> markInsertSubtasksAsSynced(
    List<(int localId, String remoteId)> ids,
  ) => _subtaskDao.updateManyDifference(
    ids
        .map(
          (e) => SubtaskTableCompanion(
            localId: Value(e.$1),
            remoteId: Value(e.$2),
          ),
        )
        .toList(),
  );

  @override
  Future<void> markSubtaskAsDeleted(int localId) =>
      _subtaskDao.updateDelete(localId);

  @override
  Future<void> markSubtasksAsSyncedByTaskId(int taskLocalId) async {
    final subtasks = await _subtaskDao.findSyncedByTaskId(taskLocalId, false);
    await _subtaskDao.markManyAsSynced(subtasks.map((e) => e.localId).toList());
  }

  @override
  Future<void> deleteSubtask(int localId) => _subtaskDao.deleteById(localId);

  //endregion

  DateTime get _utcNow => DateTime.now().toUtc();
}
