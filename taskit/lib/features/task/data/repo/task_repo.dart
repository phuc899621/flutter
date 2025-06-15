import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/mapper/itask_mapper.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';
import 'package:taskit/shared/utils/task_entity_mapper.dart';

import '../../../../shared/mixin/dio_exception_mapper.dart';
import '../../../user/data/source/local/iuser_local_source.dart';
import '../../../user/data/source/local/user_local_source.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/task_status_enum.dart';
import '../source/local/itask_local_source.dart';
import '../source/local/task_local_source.dart';
import '../source/remote/task_api.dart';
import 'itask_repo.dart';

final taskRepoProvider = Provider<ITaskRepo>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  final taskLocalSource = ref.watch(taskLocalSourceProvider);
  final userLocalSource = ref.watch(userLocalSourceProvider);
  return TaskRepo(taskApi, taskLocalSource, userLocalSource);
});

class TaskRepo with DioExceptionMapper implements ITaskRepo, ITaskMapper {
  final TaskApi _taskApi;
  final ITaskLocalSource _taskLocalSource;
  final IUserLocalSource _userLocalSource;
  TaskRepo(this._taskApi, this._taskLocalSource, this._userLocalSource);

  /*Mapper
  * */
  @override
  List<TaskEntity> mapToListTaskEntity(
          List<TaskTableData> tasks,
          List<SubtaskTableData> subtasks,
          List<CategoryTableData> categories) =>
      tasks.map((task) {
        final joinSubtask = subtasks
            .where((subtask) => subtask.taskLocalId == task.localId)
            .toList();
        final category = categories.firstWhere(
            (category) => category.localId == task.categoryLocalId,
            orElse: () => CategoryTableData(
                localId: -1,
                remoteId: '',
                name: "Any",
                isSynced: true,
                userLocalId: task.userLocalId,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now()));
        final categoryEntity = CategoryEntity(
          localId: category.localId,
          name: category.name,
        );
        return TaskEntity(
          localId: task.localId,
          title: task.title,
          description: task.description,
          category: categoryEntity,
          priority: TaskPriorityUtils.toEnum(task.priority),
          userLocalId: task.userLocalId,
          status: TaskStatusUtils.toEnum(task.status),
          dueDate: task.dueDate,
          hasTime: task.hasTime,
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

  @override
  TaskEntity mapToTaskEntity(TaskTableData task,
          List<SubtaskTableData> subtasks, CategoryTableData category) =>
      TaskEntity(
          localId: task.localId,
          title: task.title,
          description: task.description,
          category:
              CategoryEntity(name: category.name, localId: category.localId),
          priority: TaskPriorityUtils.toEnum(task.priority),
          userLocalId: task.userLocalId,
          status: TaskStatusUtils.toEnum(task.status),
          hasTime: task.hasTime,
          dueDate: task.dueDate,
          subtasks: subtasks
              .map((e) => SubtaskEntity(
                    localId: e.localId,
                    title: e.title,
                    isCompleted: e.isCompleted,
                    taskLocalId: e.taskLocalId,
                  ))
              .toList(),
          createdAt: task.createdAt,
          updatedAt: task.updatedAt);

  @override
  List<SubtaskEntity> mapToListSubtaskEntity(List<SubtaskTableData> data) =>
      data.map(mapToSubtaskEntity).toList();

  @override
  SubtaskEntity mapToSubtaskEntity(SubtaskTableData data) => SubtaskEntity(
      localId: data.localId,
      title: data.title,
      isCompleted: data.isCompleted,
      taskLocalId: data.taskLocalId);
  @override
  List<CategoryEntity> mapToListCategoryEntity(List<CategoryTableData> data) =>
      data.map(mapToCategoryEntity).toList();
  @override
  CategoryEntity mapToCategoryEntity(CategoryTableData data) => CategoryEntity(
        localId: data.localId,
        name: data.name,
      );
  @override
  Future<CategoryTableCompanion> mapToCategoryTableCompanion(
      CategoryEntity data) async {
    final userLocalId = await _userLocalSource.getUserLocalId();
    return CategoryTableCompanion(
      userLocalId: Value(userLocalId),
      name: Value(data.name),
    );
  }

  /*
  * Watch
  * */
  @override
  Stream<List<TaskEntity>> watchAllTasks() {
    final taskStream = _taskLocalSource.watchAllTasks();
    final subtaskStream = _taskLocalSource.watchAllSubtasks();
    final categoryStream = _taskLocalSource.watchAllCategories();

    return Rx.combineLatest3<List<TaskTableData>, List<SubtaskTableData>,
        List<CategoryTableData>, List<TaskEntity>>(
      taskStream,
      subtaskStream,
      categoryStream,
      (tasks, subtasks, categories) {
        return mapToListTaskEntity(tasks, subtasks, categories);
      },
    );
  }

  @override
  Stream<List<CategoryEntity>> watchAllCategories() {
    final categoryStream = _taskLocalSource.watchAllCategories();
    return categoryStream.map(mapToListCategoryEntity);
  }

  /*
  * Update
  * */
  @override
  Future<void> updateTaskStatus({required int localId, TaskStatus? status}) {
    return _taskLocalSource.updateTask(localId: localId, status: status?.name);
  }

  @override
  Future<void> updateSubtaskStatus({required int localId}) {
    return _taskLocalSource.updateSubtaskStatus(localId: localId);
  }
  /*
  * Read
  * */

  @override
  Future<TaskEntity> getTaskById(int localId) async {
    final taskData = await _taskLocalSource.getTaskByLocalId(localId);
    final subtasksData =
        await _taskLocalSource.getSubtaskByTaskLocalId(localId);
    final categoryData =
        await _taskLocalSource.getCategoryByLocalId(taskData!.categoryLocalId);

    return mapToTaskEntity(taskData, subtasksData, categoryData!);
  }

  @override
  Future<List<SubtaskEntity>> getSubtaskByTaskLocalId(int taskLocalId) async {
    final subtaskData =
        await _taskLocalSource.getSubtaskByTaskLocalId(taskLocalId);
    return mapToListSubtaskEntity(subtaskData);
  }

  /*
  * Insert
  * */
  @override
  Future<void> insertCategory(CategoryEntity category) async {
    final categoryCompanion = await mapToCategoryTableCompanion(category);
    await _taskLocalSource.insertCategory(categoryCompanion);
  }
}
