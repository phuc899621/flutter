import 'dart:async';

import 'package:taskit/features/task/data/dto/task/request/update_task_req.dart';
import 'package:taskit/features/task/data/dto/task/response/task_res.dart';
import 'package:taskit/features/task/data/repo/task_repo.dart';
import 'package:taskit/features/task/data/source/local/subtask/subtask_local_source.dart';
import 'package:taskit/features/task/data/source/local/task/task_local_source.dart';
import 'package:taskit/features/task/data/source/remote/ai_api.dart';
import 'package:taskit/features/task/data/source/remote/task_api.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';

import '../../../../shared/extension/date_time.dart';
import '../../../../shared/log/logger_provider.dart';
import '../dto/req/ai/ai_req.dart';
import '../dto/sync/request/deleted_tasks_sync_request.dart';
import '../dto/sync/request/tasks_sync_request.dart';
import '../mapper/task_remote_mapper.dart';

enum TaskFilter {
  all,
  today,
  tomorrow,
  thisWeek,
  pending,
  completedToday,
  completedThisWeek,
  todayOverDue,
  thisWeekOverDue,
}

class TaskRepoImpl with DioExceptionMapper implements TaskRepo {
  final TaskLocalSource _source;
  final SubtaskLocalSource _subtaskSource;
  final SessionService _sessionService;
  final TaskApi _api;
  final AiApi _aiApi;
  final Map<String, Timer> _updateTaskTimers = {};

  TaskRepoImpl(
    this._api,
    this._aiApi,
    this._source,
    this._subtaskSource,
    this._sessionService,
  );

  //region WATCH
  @override
  Stream<List<TaskEntity>> watchTasks(int userLocalId, TaskFilter filter) =>
      _source.watchTasks(userLocalId).map((entities) {
        switch (filter) {
          case TaskFilter.all:
            return entities;
          case TaskFilter.today:
            return entities.where((task) {
              final due = task.dueDate;
              final completed = task.completedAt;
              final hasTime = task.hasTime;
              if (due == null || !due.isToday() || completed != null) {
                return false;
              }
              if (hasTime) return due.isAfter(DateTime.now());
              return true;
            }).toList();
          case TaskFilter.tomorrow:
            return entities.where((task) {
              final due = task.dueDate;
              final status = task.status;
              if (due == null ||
                  !due.isTomorrow() ||
                  status == TaskStatus.completed) {
                return false;
              }
              return true;
            }).toList();
          case TaskFilter.thisWeek:
            return entities.where((task) {
              final due = task.dueDate;
              final completed = task.completedAt;
              final hasTime = task.hasTime;
              if (due == null || !due.isThisWeek() || completed != null) {
                return false;
              }
              if (hasTime) return due.isAfter(DateTime.now());
              return true;
            }).toList();
          case TaskFilter.pending:
            return entities
                .where((task) => task.status == TaskStatus.pending)
                .toList();
          case TaskFilter.completedToday:
            return entities.where((task) {
              final completed = task.completedAt;
              final due = task.dueDate;
              final hasTime = task.hasTime;
              if (completed == null || !completed.isToday()) return false;
              if (due == null) return true;
              if (!hasTime) return true;
              return !completed.isAfter(due);
            }).toList();
          case TaskFilter.completedThisWeek:
            return entities.where((task) {
              final completed = task.completedAt;
              final due = task.dueDate;
              if (completed == null || !completed.isThisWeek()) return false;
              if (due == null) return true;
              return !completed.isAfter(due);
            }).toList();
          case TaskFilter.todayOverDue:
            return entities.where((task) {
              final due = task.dueDate;
              final completed = task.completedAt;
              if (due == null || !due.isToday()) return false;
              return task.hasTime &&
                  due.isBefore(DateTime.now()) &&
                  (completed == null || completed.isAfter(due));
            }).toList();
          case TaskFilter.thisWeekOverDue:
            return entities.where((task) {
              final due = task.dueDate;
              final completed = task.completedAt;
              if (due == null || !due.isThisWeek()) return false;
              if (task.hasTime) {
                return due.isBefore(DateTime.now()) &&
                    (completed == null || completed.isAfter(due));
              }
              return due.isDayBefore(DateTime.now()) &&
                  (completed == null || completed.isDayAfter(due));
            }).toList();
        }
      });

  @override
  Stream<TaskEntity?> watchTaskByLocalId(int localId, int userLocalId) =>
      _source.watchTaskByLocalId(localId, userLocalId);

  @override
  Stream<List<TaskEntity>> watchTasksByDueDate(
    DateTime? dueDate,
    int userLocalId,
  ) => _source.watchTasksByDueDate(dueDate, userLocalId);

  //endregion
  //region INSERT
  @override
  Future<void> insertTask(TaskEntity task) async {
    final taskLocalId = await _source.insertTask(task);
    logger.d('[TaskRepoImpl] Task inserted locally with ID: $taskLocalId');
    unawaited(_insertTaskRemote(taskLocalId, task.userLocalId));
  }

  Future<void> _insertTaskRemote(int taskLocalId, int userLocalId) =>
      callSafe(() async {
        final taskDetail = await _source.getTaskByLocalId(
          taskLocalId,
          userLocalId,
        );
        if (taskDetail == null || taskDetail.category.remoteId == null) {
          logger.t('[TaskRepoImpl] Task or Category not found');
          throw Exception('[TaskRepoImpl] Task or Category not found');
        }
        final taskResponse = (await _api.createTask(
          taskDetail.toInsertRequest(),
        )).data;
        logger.d(
          '[TaskRepoImpl] Task inserted remotely successfully: $taskResponse',
        );
        await _source.markInsertTaskAsSynced(
          taskResponse.localId ?? taskLocalId,
          taskResponse.id,
          userLocalId,
        );
        logger.d('[TaskRepoImpl] Task marked as synced locally');
        final subtaskIds = taskResponse.subtasks
            .where((e) => e.localId != null)
            .map((e) => (e.localId!, e.id))
            .toList();
        await _subtaskSource.markInsertSubtasksAsSynced(subtaskIds);
        logger.d('TaskRepoImpl] Subtasks marked as synced locally');
      });

  //endregion
  @override
  Future<void> generateAiTask(String text, String utcOffset, int userLocalId) =>
      callSafe(() async {
        final request = AiReq.generate(text: text, utcOffset: utcOffset);
        final response = await _aiApi.generate(request);
        await insertTask(response.data.toEntity(userLocalId));
      });

  @override
  Future<String> getAiAnswer(
    String question,
    String utcOffset,
    String language,
  ) => callSafe(() async {
    final request = AiReq.question(
      text: question,
      utcOffset: utcOffset,
      language: language,
    );
    final response = await _aiApi.getAnswer(request);
    return response.data.answer;
  });

  //region UPDATE
  @override
  Future<void> updateTask(TaskUpdateField field, TaskEntity task) async {
    await _source.updateTask(field, task);
    _updateTaskTimers['${task.localId}_${field.name}']?.cancel();
    _updateTaskTimers['${task.localId}_${field.name}'] = Timer(
      const Duration(seconds: 5),
      () {
        logger.t('[TaskRepoImpl] Updating task remotely timer');
        unawaited(_updateTaskRemote(task.localId, task.userLocalId, field));
      },
    );
  }

  Future<void> _updateTaskRemote(
    int taskLocalId,
    int userLocalId,
    TaskUpdateField field,
  ) => callSafe(() async {
    final task = await _source.getTaskByLocalId(taskLocalId, userLocalId);
    final remoteId = task?.remoteId;
    if (task == null ||
        remoteId == null ||
        (field == TaskUpdateField.category && task.category.remoteId == null)) {
      return;
    }
    final request = switch (field) {
      TaskUpdateField.title => UpdateTaskReq.title(
        localId: taskLocalId,
        title: task.title,
      ),
      TaskUpdateField.description => UpdateTaskReq.description(
        localId: taskLocalId,
        description: task.description,
      ),
      TaskUpdateField.dueDate => UpdateTaskReq.dueDate(
        localId: taskLocalId,
        dueDate: task.dueDate,
        hasTime: task.hasTime,
        completedAt: task.completedAt,
        status: task.status.name,
      ),
      TaskUpdateField.status => UpdateTaskReq.status(
        localId: taskLocalId,
        status: task.status.name,
        completedAt: task.completedAt,
      ),
      TaskUpdateField.reminder => UpdateTaskReq.reminder(
        localId: taskLocalId,
        reminderAt: task.reminderAt,
        reminderType: task.reminderType.name,
        reminderOffset: task.reminderOffset,
      ),
      TaskUpdateField.priority => UpdateTaskReq.priority(
        localId: taskLocalId,
        priority: task.priority.name,
      ),
      TaskUpdateField.category => UpdateTaskReq.categoryId(
        localId: taskLocalId,
        categoryId: task.category.remoteId!,
      ),
    };
    await _api.updateTask(remoteId, request);
    logger.d('[TaskRepoImpl] Task updated remotely successfully: $request');
    await _source.markTaskAsSynced(taskLocalId, userLocalId);
    logger.d('[TaskRepoImpl] Task marked as synced locally');
    await _subtaskSource.markSubtasksAsSyncedByTaskId(taskLocalId);
    logger.d('[TaskRepoImpl] Subtasks marked as synced locally');
  });

  //endregion

  //region DELETE
  @override
  Future<void> deleteTask(int userLocalId, int taskLocalId) async {
    final task = await _source.getTaskByLocalId(taskLocalId, userLocalId);
    await _source.markTaskAsDeleted(taskLocalId, userLocalId);
    logger.d('[TaskRepoImpl] Task marked as deleted locally');
    final remoteId = task?.remoteId;
    if (task != null && remoteId != null) {
      unawaited(_deleteRemoteTask(remoteId, userLocalId));
    }
  }

  Future<void> _deleteRemoteTask(String taskRemoteId, int userLocalId) =>
      callSafe(() async {
        await _api.deleteTask(taskRemoteId);
        logger.d('[TaskRepoImpl] Task deleted remotely successfully');
        await _source.deleteTaskByRemoteId(taskRemoteId, userLocalId);
      });

  //endregion

  @override
  Future<void> pushAllUnsynced(int userLocalId) => callSafe(() async {
    final unsyncedDeleted = await _source.getUnsyncedDeletedTasks(userLocalId);

    if (unsyncedDeleted.isNotEmpty) {
      final result = await _api.syncDeletedTasks(
        DeletedTasksSyncReq(
          tasks: unsyncedDeleted.map((e) => e.toDeletedSyncReqData()).toList(),
        ),
      );
      final deletedIds = result.data.map((e) => e.localId).toList();
      await _source.deleteTasksByLocalIds(userLocalId, deletedIds);
    }

    final unsyncedTasks = await _source.getUnsyncedTasks(userLocalId);
    if (unsyncedTasks.isNotEmpty) {
      final result = await _api.syncTasks(
        TasksSyncReq(
          tasks: unsyncedTasks.map((e) => e.toSyncReqEntry()).toList(),
        ),
      );

      final accept = result.data.accept;
      final reject = result.data.reject;
      if (accept.isNotEmpty) {
        await _source.updateSyncTasks(
          accept.map((e) => e.toEntity()).toList(),
          userLocalId,
        );
      }

      if (reject.isNotEmpty) {
        final toDeleteLocalIds = reject
            .where((e) => e.id == null)
            .map((e) => e.localId)
            .toList();
        await _source.deleteTasksByLocalIds(userLocalId, toDeleteLocalIds);

        final updateFromServer = reject
            .where((e) => e.id != null && e.serverData != null)
            .toList();
        final updateEntity = updateFromServer
            .map((e) => e.toEntity(userLocalId))
            .whereType<TaskEntity>()
            .toList();
        await _source.updateSyncTasks(updateEntity, userLocalId);
      }
    }
  });

  @override
  Future<void> pullTasks(int userLocalId) async {
    logger.d('[TaskRepoImpl] task pull call');
    final lastSyncTime = _sessionService.getLastSyncTime();
    logger.t('[TaskRepoImpl] lastSyncTime: $lastSyncTime');
    final result = await _api.pullTasks(lastSyncTime);
    logger.i('[TaskRepoImpl] result pull: $result');
    await _source.reconcileTasks(
      userLocalId,
      result.data.map((e) => e.toEntity(userLocalId)).toList(),
    );
  }

  //REMOTE
  @override
  Future<void> handleRemoteInsert(Map<String, dynamic> data, int userLocalId) =>
      callSafe(() async {
        final task = TaskRes.fromJson(data);
        final taskEntity = task.toEntity(userLocalId);
        await _source.upsertOne(taskEntity);
        logger.d('[TaskRepoImpl] remote insert task: $taskEntity');
        _updateSyncTime();
      });

  //endregion
  @override
  Future<void> handleRemoteUpdate(Map<String, dynamic> data, int userLocalId) =>
      callSafe(() async {
        final taskEntity = TaskRes.fromJson(data).toEntity(userLocalId);
        await _source.upsertOne(taskEntity);
        logger.d('[TaskRepoImpl] remote update task: $taskEntity');
        _updateSyncTime();
      });

  @override
  Future<void> handleRemoteDelete(String? remoteId, int userLocalId) =>
      callSafe(() async {
        if (remoteId == null) {
          throw Exception('Task has no remote id');
        }
        await _source.deleteTaskByRemoteId(remoteId, userLocalId);
        logger.d('[TaskRepoImpl] remote delete task: $remoteId');
        _updateSyncTime();
      });

  @override
  Future<void> handleRemoteBulkSync(
    Map<String, dynamic> data,
    int userLocalId,
  ) => callSafe(() async {
    final tasks = data['tasks'] as List;
    final tasksRes = tasks.map((e) => TaskRes.fromJson(e)).toList();
    await _source.upsertAll(
      tasksRes.map((e) => e.toEntity(userLocalId)).toList(),
    );
    logger.d(
      '[TaskRepoImpl] remote bulk sync categories: ${tasksRes.map((e) => e.id).toList()}',
    );
    _updateSyncTime();
  });

  @override
  Future<void> handleRemoteBulkDelete(List<dynamic> data, int userLocalId) =>
      callSafe(() async {
        final taskIds = data.map((e) => e as String).toList();
        await _source.deleteTasksByRemoteIds(userLocalId, taskIds);
        logger.d('[TaskRepoImpl] remote bulk delete categories: $taskIds');
        _updateSyncTime();
      });

  Future<void> _updateSyncTime() async =>
      await _sessionService.saveLastSyncTime(_utcNow.toIso8601String());

  DateTime get _utcNow => DateTime.now().toUtc();
}
