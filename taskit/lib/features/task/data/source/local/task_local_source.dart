import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/source/local/itask_local_source.dart';

import '../../../../../shared/data/source/local/drift/dao/subtask.dart';
import '../../../../../shared/data/source/local/drift/dao/task.dart';
import '../../../../../shared/data/source/local/drift/database/database.dart';

final taskLocalSourceProvider = Provider<ITaskLocalSource>((ref) {
  final taskDao = ref.watch(taskDaoProvider);
  final subtaskDao = ref.watch(subtaskDaoProvider);
  return TaskLocalSource(taskDao, subtaskDao);
});

class TaskLocalSource implements ITaskLocalSource {
  final _taskDao;
  final _subtaskDao;
  TaskLocalSource(this._taskDao, this._subtaskDao);
  @override
  Stream<List<TaskTableData>> watchAllTasks() {
    return _taskDao.watchAllTasks();
  }

  @override
  Stream<List<SubtaskTableData>> watchAllSubtasks() {
    return _subtaskDao.watchAllSubtasks();
  }
}
