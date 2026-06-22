import 'package:drift/drift.dart';
import 'package:taskit/features/task/data/mapper/subtask_local_mapper.dart';
import 'package:taskit/features/task/data/mapper/task_local_mapper.dart';
import 'package:taskit/features/task/data/source/local/subtask/subtask.dart';
import 'package:taskit/features/task/data/source/local/task/task.dart';
import 'package:taskit/features/task/data/source/local/task/task_local_source.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../../category/data/source/local/category.dart';
import '../../../../domain/entities/task_entity.dart';

class TaskLocalSourceImpl implements TaskLocalSource {
  final TaskDao _taskDao;
  final SubtaskDao _subtaskDao;
  final CategoryDao _categoryDao;
  final AppDatabase _db;

  TaskLocalSourceImpl(
    this._db,
    this._taskDao,
    this._subtaskDao,
    this._categoryDao,
  );

  //region WATCH
  @override
  Stream<List<TaskEntity>> watchTasks(int userLocalId) => _taskDao
      .watchDetail(userLocalId)
      .map((data) => data.map((e) => e.toEntity()).toList());

  @override
  Stream<List<TaskEntity>> watchTasksByDueDate(
    DateTime? dueDate,
    int userLocalId,
  ) => _taskDao
      .watchByDueDate(dueDate, userLocalId)
      .map((data) => data.map((e) => e.toEntity()).toList());

  @override
  Stream<TaskEntity?> watchTaskByLocalId(int localId, int userLocalId) =>
      _taskDao.watchById(localId, userLocalId).map((data) => data?.toEntity());

  //endregion
  //region INSERT
  @override
  Future<int> insertTask(TaskEntity task) async {
    final taskLocalId = await _db.transaction(() async {
      final taskCompanion = task.toInsertCompanion();
      final taskLocalId = await _taskDao.insertOne(taskCompanion);
      final subtaskCompanions = task.subtasks
          .map((subtask) => subtask.toInsertCompanion(taskLocalId))
          .toList();
      await _subtaskDao.insertMany(subtaskCompanions);
      return taskLocalId;
    });
    return taskLocalId;
  }

  @override
  Future<void> insertTaskFromAi(TaskEntity task) {
    try {
      logger.d('[TaskLocalSourceImpl] Insert task local from AI : $task');
      return _taskDao.insertOne(task.toInsertCompanion());
    } catch (e) {
      logger.e('Insert task error: $e');
      return Future.value();
    }
  }

  //endregion

  //region GET
  @override
  Future<TaskEntity?> getTaskByLocalId(int localId, int userLocalId) async {
    final taskDetailData = await _taskDao.findDetailById(localId, userLocalId);
    return taskDetailData?.toEntity();
  }

  @override
  Future<List<TaskEntity>> getUnsyncedTasks(int userLocalId) async =>
      (await _taskDao.findUnsynced(
        userLocalId,
      )).map((e) => e.toEntity()).toList();

  @override
  Future<List<TaskEntity>> getUnsyncedDeletedTasks(int userLocalId) async =>
      (await _taskDao.findUnsyncedDeleted(
        userLocalId,
      )).map((e) => e.toEntity()).toList();

  //endregion

  //region UPDATE
  @override
  Future<void> markTaskAsSynced(int localId, int userLocalId) async {
    await _taskDao.updateById(
      localId,
      userLocalId,
      TaskTableCompanion(synced: const Value(true), updatedAt: Value(_utcNow)),
    );
  }

  @override
  Future<void> markTaskAsDeleted(int localId, int userLocalId) async {
    await _taskDao.updateById(
      localId,
      userLocalId,
      TaskTableCompanion(deleted: const Value(true), updatedAt: Value(_utcNow)),
    );
    await _subtaskDao.updateByTaskId(
      localId,
      SubtaskTableCompanion(
        deleted: const Value(true),
        updatedAt: Value(_utcNow),
      ),
    );
  }

  @override
  Future<void> markInsertTaskAsSynced(
    int localId,
    String remoteId,
    int userLocalId,
  ) => _taskDao.updateById(
    localId,
    userLocalId,
    TaskTableCompanion(
      synced: const Value(true),
      remoteId: Value(remoteId),
      updatedAt: Value(_utcNow),
    ),
  );

  @override
  Future<void> upsertOne(TaskEntity task) async {
    await _taskDao.upsertOne(
      TaskInsertDetail(
        categoryRemoteId: task.category.remoteId!,
        task: TaskTableCompanion(
          remoteId: Value(task.remoteId),
          title: Value(task.title),
          description: Value(task.description),
          deleted: Value(task.deleted),
          dueDate: Value(task.dueDate),
          synced: Value(task.synced),
          reminderAt: Value(task.reminderAt),
          status: Value(task.status.name),
          userLocalId: Value(task.userLocalId),
          completedAt: Value(task.completedAt),
          hasTime: Value(task.hasTime),
          updatedAt: Value(task.updatedAt),
          priority: Value(task.priority.name),
          createdAt: Value(task.createdAt),
        ),
        subtasks: task.subtasks
            .map(
              (subtask) => SubtaskTableCompanion(
                remoteId: Value(subtask.remoteId),
                title: Value(subtask.title),
                completedAt: Value(subtask.completedAt),
                deleted: Value(subtask.deleted),
                synced: Value(subtask.synced),
                updatedAt: Value(subtask.updatedAt),
                createdAt: Value(subtask.createdAt),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<void> upsertAll(List<TaskEntity> tasks) async {
    await _taskDao.upsertAll(
      tasks
          .map(
            (task) => TaskInsertDetail(
              categoryRemoteId: task.category.remoteId!,
              task: TaskTableCompanion(
                remoteId: Value(task.remoteId),
                title: Value(task.title),
                description: Value(task.description),
                deleted: Value(task.deleted),
                dueDate: Value(task.dueDate),
                reminderAt: Value(task.reminderAt),
                synced: Value(task.synced),
                status: Value(task.status.name),
                userLocalId: Value(task.userLocalId),
                completedAt: Value(task.completedAt),
                hasTime: Value(task.hasTime),
                updatedAt: Value(task.updatedAt),
                priority: Value(task.priority.name),
                createdAt: Value(task.createdAt),
              ),
              subtasks: task.subtasks
                  .map(
                    (subtask) => SubtaskTableCompanion(
                      remoteId: Value(subtask.remoteId),
                      title: Value(subtask.title),
                      completedAt: Value(subtask.completedAt),
                      deleted: Value(subtask.deleted),
                      synced: Value(subtask.synced),
                      updatedAt: Value(subtask.updatedAt),
                      createdAt: Value(subtask.createdAt),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  @override
  Future<void> updateTask(TaskUpdateField field, TaskEntity task) async {
    final companion = switch (field) {
      TaskUpdateField.title => TaskTableCompanion(
        title: Value(task.title),
        synced: Value(false),
        updatedAt: Value(_utcNow),
      ),
      TaskUpdateField.description => TaskTableCompanion(
        description: Value(task.description),
        synced: Value(false),
        updatedAt: Value(_utcNow),
      ),
      TaskUpdateField.dueDate => TaskTableCompanion(
        dueDate: Value(task.dueDate),
        status: Value(
          task.status == TaskStatus.completed
              ? task.status.name
              : (task.dueDate == null
                    ? TaskStatus.pending.name
                    : TaskStatus.scheduled.name),
        ),
        completedAt: Value(
          task.status == TaskStatus.completed ? _utcNow : null,
        ),
        hasTime: Value(task.dueDate == null ? false : task.hasTime),
        synced: Value(false),
        updatedAt: Value(_utcNow),
      ),
      TaskUpdateField.priority => TaskTableCompanion(
        priority: Value(task.priority.name),
        synced: Value(false),
        updatedAt: Value(_utcNow),
      ),
      TaskUpdateField.status => TaskTableCompanion(
        status: Value(
          task.status == TaskStatus.completed
              ? task.status.name
              : (task.dueDate == null
                    ? TaskStatus.pending.name
                    : TaskStatus.scheduled.name),
        ),
        synced: Value(false),
        completedAt: Value(
          task.status == TaskStatus.completed ? _utcNow : null,
        ),
        updatedAt: Value(_utcNow),
      ),
      TaskUpdateField.category => TaskTableCompanion(
        categoryLocalId: Value(task.category.localId),
        synced: Value(false),
        updatedAt: Value(_utcNow),
      ),
      TaskUpdateField.reminder => TaskTableCompanion(
        reminderAt: Value(task.reminderAt),
        reminderOffset: Value(task.reminderOffset),
        reminderType: Value(task.reminderType),
        synced: Value(false),
        updatedAt: Value(_utcNow),
      ),
    };
    await _taskDao.updateById(task.localId, task.userLocalId, companion);
    logger.d('[TaskLocalSourceImpl] task update ${field.name}');
    switch (field) {
      case TaskUpdateField.status:
        await _db.transaction(() async {
          final status = task.status;
          final updateStatus = status == TaskStatus.completed
              ? status
              : (task.dueDate == null
                    ? TaskStatus.pending
                    : TaskStatus.scheduled);
          await _subtaskDao.updateCompletedByTaskId(
            task.localId,
            updateStatus == TaskStatus.completed ? true : false,
          );
          logger.d('[TaskLocalSourceImpl] updatedStatus: $updateStatus');
        });
        break;
      default:
        break;
    }
  }

  @override
  Future<void> reconcileTasks(int userLocalId, List<TaskEntity> tasks) async {
    final categoryRemoteIds = tasks
        .map((e) => e.category.remoteId)
        .whereType<String>()
        .toList();
    final categoryDatas = await _categoryDao.findByRemoteIds(
      categoryRemoteIds,
      userLocalId,
    );

    final categoryMap = {for (final c in categoryDatas) c.remoteId: c.localId};
    return await _taskDao.reconcile(
      userLocalId: userLocalId,
      tasks: tasks.where((e) => categoryMap[e.category.remoteId] != null).map((
        e,
      ) {
        final categoryLocalId = categoryMap[e.category.remoteId];
        return e.toReconcileCompanion(
          userLocalId,
          DateTime.now().toUtc(),
          categoryLocalId!,
        );
      }).toList(),
    );
  }

  @override
  Future<void> updateSyncTasks(List<TaskEntity> tasks, int userLocalId) {
    final taskCompanions = tasks
        .map(
          (e) => TaskTableCompanion(
            remoteId: Value(e.remoteId),
            synced: Value(true),
            updatedAt: Value(_utcNow),
          ),
        )
        .toList();
    return _taskDao.updateMultipleDifferent(userLocalId, taskCompanions);
  }

  @override
  Future<void> deleteTaskByLocalId(int localId, int userLocalId) =>
      _taskDao.deleteById(localId, userLocalId);

  @override
  Future<void> deleteTaskByRemoteId(String remoteId, int userLocalId) =>
      _taskDao.deleteByRemoteId(remoteId, userLocalId);

  @override
  Future<void> deleteTasksByRemoteIds(
    int userLocalId,
    List<String> remoteIds,
  ) => _taskDao.deleteMultipleByRemoteIds(userLocalId, remoteIds);

  @override
  Future<void> deleteTasksByLocalIds(int userLocalId, List<int> localIds) =>
      _taskDao.deleteMultipleByLocalIds(userLocalId, localIds);

  //endregion

  DateTime get _utcNow => DateTime.now().toUtc();
}
