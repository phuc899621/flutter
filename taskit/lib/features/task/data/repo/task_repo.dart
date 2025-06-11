import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/domain/mapper/itask_mapper.dart';

import '../../../../shared/mixin/dio_exception_mapper.dart';
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
}
