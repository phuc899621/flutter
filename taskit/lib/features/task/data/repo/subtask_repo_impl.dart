import 'dart:async';

import 'package:taskit/features/task/data/dto/subtask/request/add_subtask_req.dart';
import 'package:taskit/features/task/data/dto/task/request/update_task_req.dart';
import 'package:taskit/features/task/data/repo/subtask_repo.dart';
import 'package:taskit/features/task/data/source/local/subtask/subtask_local_source.dart';
import 'package:taskit/features/task/data/source/local/task/task_local_source.dart';
import 'package:taskit/features/task/data/source/remote/subtask_api.dart';
import 'package:taskit/features/task/data/source/remote/task_api.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../shared/data/source/remote/network/dio_exception_mapper.dart';
import '../dto/subtask/request/update_subtask.dart';

class SubtaskRepoImpl with DioExceptionMapper implements SubtaskRepo {
  final SubtaskLocalSource _subtaskLocalSource;
  final SubtaskApi _subtaskApi;
  final TaskApi _taskApi;
  final TaskLocalSource _taskLocalSource;
  final Map<String, Timer> _updateSubtaskTimers = {};

  SubtaskRepoImpl(
    this._taskLocalSource,
    this._subtaskLocalSource,
    this._taskApi,
    this._subtaskApi,
  );

  @override
  Future<void> insertSubtask(SubtaskEntity entity, int userLocalId) async {
    logger.d('[SubtaskRepoImpl] insert subtask: $entity');
    final previousTask = await _taskLocalSource.getTaskByLocalId(
      entity.taskLocalId,
      userLocalId,
    );
    if (previousTask == null) return;
    int subtaskId = await _subtaskLocalSource.insertSubtask(
      entity,
      userLocalId,
    );
    if (subtaskId == -1) return;
    final task = await _taskLocalSource.getTaskByLocalId(
      entity.taskLocalId,
      userLocalId,
    );
    if (task == null) return;
    unawaited(_insertRemoteSubtask(task, subtaskId, userLocalId));
    if (previousTask.status != task.status) {
      unawaited(_updateRemoteTaskStatus(task));
    }
  }

  Future<void> _insertRemoteSubtask(
    TaskEntity taskEntity,
    int subtaskLocalId,
    int userLocalId,
  ) async {
    try {
      final task = await _taskLocalSource.getTaskByLocalId(
        taskEntity.localId,
        userLocalId,
      );
      if (task == null) return;
      final subtask = await _subtaskLocalSource.getSubtaskByLocalId(
        subtaskLocalId,
      );
      if (subtask == null) return;
      final request = AddSubtaskReq(
        localId: subtask.localId,
        title: subtask.title,
      );
      logger.d('[SubtaskRepoImpl] Add subtask request: \n $request');
      await _subtaskApi.add(task.remoteId!, request);
      await _subtaskLocalSource.markSubtaskAsSynced(subtask.localId);
    } catch (e, s) {
      logger.e('[SubtaskRepoImpl] Add remote subtasks error: \n $e \n $s');
    }
  }

  Future<void> _updateRemoteTaskStatus(TaskEntity task) async {
    try {
      final request = UpdateTaskReq.status(
        localId: task.localId,
        status: task.status.toString(),
        completedAt: task.completedAt,
      );
      logger.d('[SubtaskRepoImpl] Update task status request: \n $request');
      await _taskApi.updateTask(task.remoteId!, request);
      await _taskLocalSource.markTaskAsSynced(task.localId, task.userLocalId);
    } catch (e, s) {
      logger.e('[SubtaskRepoImpl] Add remote subtasks error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateSubtask(
    SubtaskUpdateField field,
    int userLocalId,
    SubtaskEntity subtask,
  ) async {
    final previousTask = await _taskLocalSource.getTaskByLocalId(
      subtask.taskLocalId,
      userLocalId,
    );
    if (previousTask == null) return;
    if (field != SubtaskUpdateField.completed) {
      await _subtaskLocalSource.updateSubtask(field, subtask);
      unawaited(_updateRemoteSubtask(previousTask, subtask, field));
      return;
    }
    await _subtaskLocalSource.updateSubtask(field, subtask);
    final task = await _taskLocalSource.getTaskByLocalId(
      subtask.taskLocalId,
      userLocalId,
    );
    if (task == null) return;
    _updateSubtaskTimers['${subtask.localId}_${field.name}']?.cancel();
    _updateSubtaskTimers['${subtask.localId}_${field.name}'] = Timer(
      const Duration(seconds: 5),
      () {
        logger.t('[SubtaskRepoImpl] Updating subtask remotely timer');
        unawaited(_updateRemoteSubtask(task, subtask, field));
        if (previousTask.status != task.status) {
          unawaited(_updateRemoteTaskStatus(task));
        }
      },
    );
  }

  Future<void> _updateRemoteSubtask(
    TaskEntity task,
    SubtaskEntity subtask,
    SubtaskUpdateField field,
  ) async {
    final request = switch (field) {
      SubtaskUpdateField.title => UpdateSubtaskReq.title(
        localId: subtask.localId,
        title: subtask.title,
      ),
      SubtaskUpdateField.completed => UpdateSubtaskReq.status(
        completedAt: subtask.completedAt,
        isCompleted: subtask.completed,
        localId: subtask.localId,
      ),
    };
    await _subtaskApi.update(task.remoteId!, subtask.remoteId!, request);
    logger.d(
      '[SubtaskRepoImpl] Subtask updated remotely successfully: $request',
    );
    await _subtaskLocalSource.markSubtaskAsSynced(subtask.localId);
    logger.d('[SubtaskRepoImpl] Subtask marked as synced locally');
  }

  @override
  Future<void> deleteSubtask(int userLocalId, SubtaskEntity subtask) async {
    await _subtaskLocalSource.markSubtaskAsDeleted(subtask.localId);
    logger.d('[SubtaskRepoImpl] Subtask marked as deleted locally');
    final remoteId = subtask.remoteId;
    if (remoteId == null) return;
    final taskRemoteId = (await _taskLocalSource.getTaskByLocalId(
      subtask.taskLocalId,
      userLocalId,
    ))?.remoteId;
    if (taskRemoteId == null) return;
    unawaited(_deleteRemoteSubtask(remoteId, taskRemoteId, subtask.localId));
  }

  Future<void> _deleteRemoteSubtask(
    String subtaskId,
    String taskId,
    int subtaskLocalId,
  ) => callSafe(() async {
    await _subtaskApi.delete(taskId, subtaskId);
    logger.d('[SubtaskRepoImpl] Subtask deleted remotely successfully');
    await _subtaskLocalSource.deleteSubtask(subtaskLocalId);
  });
}
