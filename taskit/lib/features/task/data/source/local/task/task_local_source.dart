import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/source/local/subtask/subtask.dart';
import 'package:taskit/features/task/data/source/local/task/task.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';

import '../../../../../../shared/data/source/local/drift/database/database.dart';
import '../../../../../category/data/source/local/category.dart';
import 'task_local_source_impl.dart';

final taskLocalSourceProvider = Provider<TaskLocalSource>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final taskDao = ref.watch(taskDaoProvider);
  final subtaskDao = ref.watch(subtaskDaoProvider);
  final categoryDao = ref.watch(categoryDaoProvider);
  return TaskLocalSourceImpl(db, taskDao, subtaskDao, categoryDao);
});

abstract class TaskLocalSource {
  Stream<List<TaskEntity>> watchTasks(int userLocalId);

  Stream<List<TaskEntity>> watchTasksByDueDate(
    DateTime? dueDate,
    int userLocalId,
  );

  Stream<TaskEntity?> watchTaskByLocalId(int localId, int userLocalId);

  Future<TaskEntity?> getTaskByLocalId(int localId, int userLocalId);

  Future<List<TaskEntity>> getUnsyncedTasks(int userLocalId);

  Future<List<TaskEntity>> getUnsyncedDeletedTasks(int userLocalId);

  Future<int> insertTask(TaskEntity task);

  Future<void> insertTaskFromAi(TaskEntity task);

  Future<void> markTaskAsSynced(int localId, int userLocalId);

  Future<void> markInsertTaskAsSynced(
    int localId,
    String remoteId,
    int userLocalId,
  );

  Future<void> updateTask(TaskUpdateField field, TaskEntity task);

  Future<void> updateSyncTasks(List<TaskEntity> tasks, int userLocalId);

  Future<void> reconcileTasks(int userLocalId, List<TaskEntity> tasks);

  Future<void> upsertAll(List<TaskEntity> tasks);

  Future<void> upsertOne(TaskEntity task);

  Future<void> markTaskAsDeleted(int localId, int userLocalId);

  Future<void> deleteTaskByLocalId(int localId, int userLocalId);

  Future<void> deleteTaskByRemoteId(String remoteId, int userLocalId);

  Future<void> deleteTasksByLocalIds(int userLocalId, List<int> localIds);

  Future<void> deleteTasksByRemoteIds(int userLocalId, List<String> remoteIds);
}
