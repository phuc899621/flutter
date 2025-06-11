import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/mapper/itask_mapper.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../../../shared/mixin/dio_exception_mapper.dart';
import '../../domain/entities/subtask_entity.dart';
import '../source/local/itask_local_source.dart';
import '../source/local/task_local_source.dart';
import '../source/remote/task_api.dart';
import 'itask_repo.dart';

final taskRepoProvider = Provider<ITaskRepo>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  final taskLocalSource = ref.watch(taskLocalSourceProvider);
  return TaskRepo(taskApi, taskLocalSource);
});

class TaskRepo with DioExceptionMapper implements ITaskRepo, ITaskMapper {
  final TaskApi _taskApi;
  final ITaskLocalSource _taskLocalSource;
  TaskRepo(this._taskApi, this._taskLocalSource);

  @override
  List<TaskEntity> mapToListTaskEntity(
      List<TaskTableData> tasks, List<SubtaskTableData> subtasks) {
    return tasks.map((task) {
      final joinSubtask = subtasks
          .where((subtask) => subtask.taskLocalId == task.localId)
          .toList();
      return TaskEntity(
        localId: task.localId,
        title: task.title,
        description: task.description,
        category: task.category,
        priority: task.priority,
        userLocalId: task.userLocalId,
        type: task.type,
        status: task.status,
        scheduledDate: task.scheduledDate,
        hasScheduledTime: task.hasScheduledTime,
        deadlineDate: task.deadlineDate,
        subtasks: joinSubtask
            .map((subtask) => SubtaskEntity(
                  localId: subtask.localId,
                  title: subtask.title,
                  isCompleted: subtask.isCompleted,
                  taskLocalId: subtask.taskLocalId,
                ))
            .toList(),
        createdAt: task.createdAt,
        updatedAt: task.updatedAt,
      );
    }).toList();
  }

  @override
  Stream<List<TaskEntity>> watchAllTasks() {
    final taskStream = _taskLocalSource.watchAllTasks();
    final subtaskStream = _taskLocalSource.watchAllSubtasks();

    List<TaskTableData> _tasks = [];
    List<SubtaskTableData> _subtasks = [];

    final controller = StreamController<List<TaskEntity>>();
    taskStream.listen((tasks) {
      _tasks = tasks;
      controller.add(mapToListTaskEntity(_tasks, _subtasks));
    });
    subtaskStream.listen((subtasks) {
      _subtasks = subtasks;
      controller.add(mapToListTaskEntity(_tasks, _subtasks));
    });

    return controller.stream;
  }
}
