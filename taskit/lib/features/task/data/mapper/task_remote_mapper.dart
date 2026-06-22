import 'package:taskit/features/task/data/dto/res/ai/ai_generate_task_data.dart';
import 'package:taskit/features/task/data/dto/sync/request/tasks_sync_request.dart';
import 'package:taskit/features/task/data/dto/task/request/add_task_req.dart';
import 'package:taskit/features/task/data/dto/task/response/task_res.dart';
import 'package:taskit/features/task/data/mapper/subtask_remote_mapper.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';

import '../../../category/domain/entities/category_entity.dart';
import '../dto/sync/request/deleted_tasks_sync_request.dart';
import '../dto/sync/response/deleted_tasks_sync_res.dart';
import '../dto/sync/response/tasks_sync_res.dart';

extension TaskEntityRemoteMapper on TaskEntity {
  AddTaskReq toInsertRequest() => AddTaskReq(
    localId: localId,
    title: title,
    description: description,
    dueDate: dueDate,
    categoryId: category.remoteId,
    priority: priority.name,
    status: status.name,
    hasTime: hasTime,
    reminderAt: reminderAt,
    subtasks: subtasks.map((e) => e.toInsertRequest()).toList(),
  );

  TasksSyncReqEntry toSyncReqEntry() => TasksSyncReqEntry(
    id: remoteId,
    localId: localId,
    updatedAt: updatedAt.toUtc(),
    title: title,
    description: description,
    reminderAt: reminderAt,
    categoryId: category.remoteId!,
    priority: priority.toString(),
    deleted: deleted,
    status: status.toString(),
    completedAt: completedAt,
    dueDate: dueDate,
    hasTime: hasTime,
    createdAt: createdAt,
  );

  DeletedTasksSyncReqData toDeletedSyncReqData() =>
      DeletedTasksSyncReqData(id: remoteId, localId: localId);
}

extension AiGenerateTaskDataMapper on AiGenerateTaskData {
  TaskEntity toEntity(int userLocalId) => TaskEntity(
    localId: -1,
    title: title,
    remoteId: null,
    description: description,
    category: CategoryEntity.fromRemote(id: categoryId),
    priority: TaskPriority.fromString(priority),
    userLocalId: userLocalId,
    completedAt: null,
    reminderAt: reminderAt,
    dueDate: userUtcDueDate,
    synced: false,
    deleted: false,
    status: TaskStatus.fromString(status),
    hasTime: hasTime,
    subtasks: [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

extension TaskResMapper on TaskRes {
  TaskEntity toEntity(int userLocalId) => TaskEntity(
    localId: localId ?? -1,
    remoteId: id,
    title: title,
    description: description,
    category: CategoryEntity.fromRemote(id: categoryId),
    priority: TaskPriority.fromString(priority),
    userLocalId: userLocalId,
    synced: true,
    deleted: deleted,
    completedAt: completedAt,
    dueDate: dueDate,
    status: TaskStatus.fromString(status),
    hasTime: hasTime,
    subtasks: subtasks.map((e) => e.toEntity()).toList(),
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension AcceptTaskSyncDataMapper on AcceptTaskSyncRes {
  TaskEntity toEntity() => TaskEntity(
    title: '',
    localId: localId,
    remoteId: id,
    userLocalId: -1,
    category: CategoryEntity.fromRemote(id: id),
    priority: TaskPriority.low,
    status: TaskStatus.pending,
    hasTime: false,
    subtasks: [],
    synced: true,
    deleted: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    description: '',
  );
}

extension RejectTaskSyncDataMapper on RejectTaskSyncRes {
  TaskEntity? toEntity(int userLocalId) {
    if (serverData == null) return null;
    return TaskEntity(
      localId: localId,
      remoteId: id,
      title: serverData!.title,
      description: serverData!.description,
      category: CategoryEntity.fromRemote(id: serverData!.categoryId),
      priority: TaskPriority.fromString(serverData!.priority),
      userLocalId: userLocalId,
      synced: true,
      completedAt: serverData!.completedAt,
      dueDate: serverData!.dueDate,
      deleted: false,
      status: TaskStatus.fromString(serverData!.status),
      hasTime: serverData!.hasTime,
      subtasks: [],
      createdAt: DateTime.now(),
      updatedAt: serverData!.updatedAt,
    );
  }
}

extension TaskDeletedSyncDataMapper on DeletedTasksSyncRes {
  TaskEntity toEntity() => TaskEntity(
    title: '',
    localId: localId,
    remoteId: id,
    userLocalId: -1,
    category: CategoryEntity.fromRemote(id: id),
    priority: TaskPriority.low,
    status: TaskStatus.pending,
    hasTime: false,
    subtasks: [],
    synced: true,
    deleted: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    description: '',
  );
}
