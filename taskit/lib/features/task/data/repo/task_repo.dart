import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/repo/task_repo_impl.dart';
import 'package:taskit/features/task/data/source/remote/ai_api.dart';
import 'package:taskit/shared/application/session_service.dart';

import '../../domain/entities/task_entity.dart';
import '../source/local/subtask/subtask_local_source.dart';
import '../source/local/task/task_local_source.dart';
import '../source/remote/task_api.dart';

final taskRepoProvider = Provider<TaskRepo>((ref) {
  final source = ref.watch(taskLocalSourceProvider);
  final subtaskSource = ref.watch(subtaskLocalSourceProvider);
  final api = ref.watch(taskApiProvider);
  final sessionService = ref.watch(sessionServiceProvider);
  final aiApi = ref.watch(aiApiProvider);
  return TaskRepoImpl(api, aiApi, source, subtaskSource, sessionService);
});

abstract class TaskRepo {
  Future<void> insertTask(TaskEntity task);

  Future<void> generateAiTask(String text, String utcOffset, int userLocalId);

  Future<String> getAiAnswer(
    String question,
    String utcOffset,
    String language,
  );

  Stream<List<TaskEntity>> watchTasks(int userLocalId, TaskFilter filter);

  Stream<TaskEntity?> watchTaskByLocalId(int localId, int userLocalId);

  Stream<List<TaskEntity>> watchTasksByDueDate(
    DateTime? dueDate,
    int userLocalId,
  );

  Future<void> updateTask(TaskUpdateField field, TaskEntity task);

  Future<void> deleteTask(int userLocalId, int taskLocalId);

  ///pull tasks from server
  Future<void> pullTasks(int userLocalId);

  ///get tasks from local database and sync to server
  Future<void> pushAllUnsynced(int userLocalId);

  ///handle insert from another device
  Future<void> handleRemoteInsert(Map<String, dynamic> data, int userLocalId);

  ///handle update from another device
  Future<void> handleRemoteUpdate(Map<String, dynamic> data, int userLocalId);

  ///handle delete from another device
  Future<void> handleRemoteDelete(String? remoteId, int userLocalId);

  ///handle insert or update many categories from another device
  Future<void> handleRemoteBulkSync(Map<String, dynamic> data, int userLocalId);

  ///handle delete many categories from another device
  Future<void> handleRemoteBulkDelete(List<dynamic> data, int userLocalId);
}
