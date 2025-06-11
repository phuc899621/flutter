import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/source/local/itask_local_source.dart';

import 'drift/dao/task.dart';
import 'drift/database/database.dart';

final taskLocalSourceProvider = Provider<ITaskLocalSource>((ref) {
  final taskDao = ref.watch(taskDaoProvider);
  return TaskLocalSource(taskDao);
});

class TaskLocalSource implements ITaskLocalSource {
  final _taskDao;
  TaskLocalSource(this._taskDao);
  @override
  Stream<List<TaskTableData>> watchAllTasks() {
    return _taskDao.watchAllTasks();
  }
}
