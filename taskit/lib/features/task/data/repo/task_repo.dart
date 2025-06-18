import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/mapper/itask_mapper.dart';
import 'package:taskit/shared/application/token_service.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';
import 'package:taskit/shared/utils/task_entity_mapper.dart';

import '../../../../shared/application/itoken_service.dart';
import '../../../../shared/exception/failure.dart';
import '../../../../shared/mixin/dio_exception_mapper.dart';
import '../../../user/data/source/local/iuser_local_source.dart';
import '../../../user/data/source/local/user_local_source.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/task_status_enum.dart';
import '../dto/req/ai_category/ai_category.dart';
import '../source/local/itask_local_source.dart';
import '../source/local/task_local_source.dart';
import '../source/remote/task_api.dart';
import 'itask_repo.dart';

final taskRepoProvider = Provider<ITaskRepo>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  final taskLocalSource = ref.watch(taskLocalSourceProvider);
  final userLocalSource = ref.watch(userLocalSourceProvider);
  final tokenService = ref.watch(tokenServiceProvider);
  return TaskRepo(taskApi, taskLocalSource, userLocalSource, tokenService);
});

class TaskRepo with DioExceptionMapper implements ITaskRepo, ITaskMapper {
  final TaskApi _taskApi;
  final ITaskLocalSource _taskLocalSource;
  final IUserLocalSource _userLocalSource;
  final ITokenService _tokenService;

  TaskRepo(this._taskApi, this._taskLocalSource, this._userLocalSource,
      this._tokenService);

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
  List<CategoryEntity> mapToListCategoryEntityFromAi(List<String> data) =>
      data.map((e) => CategoryEntity(name: e, localId: -1)).toList();

  @override
  Future<CategoryTableCompanion> mapToCategoryTableCompanion(
      CategoryEntity data) async {
    final userLocalId = await _userLocalSource.getUserLocalId();
    return CategoryTableCompanion(
      userLocalId: Value(userLocalId),
      name: Value(data.name),
      updatedAt: Value(DateTime.now()),
    );
  }

  @override
  AiCategoryReq mapToAiCategoryReq(
      String title, List<String> excludedCategories) {
    return AiCategoryReq(title: title, excludedCategories: excludedCategories);
  }

  @override
  List<String> mapCategoriesTableDataToListString(
      List<CategoryTableData> data) {
    return data.map((e) => e.name).toList();
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

  @override
  Future<List<CategoryEntity>> getAICategory(String title) async {
    try {
      final excludedCategories = await _taskLocalSource.getCategories();
      final categoryReq = mapToAiCategoryReq(
          title, mapCategoriesTableDataToListString(excludedCategories));
      final token = await _tokenService.getToken();
      final categoryData =
          await _taskApi.getAiCategory('Bearer $token', categoryReq);
      return mapToListCategoryEntityFromAi(categoryData.data);
    } on DioException catch (e, s) {
      debugPrint(e.toString() + s.toString());
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      debugPrint(e.toString() + s.toString());
      if (e is Exception) {
        throw Failure(
          message: "Get AI category error : ${e.toString()}",
          exception: e,
          stackTrace: s,
        );
      } else {
        throw Failure(
          message: "Get AI category error : ${e.toString()}",
          exception: Exception(e.toString()),
          stackTrace: s,
        );
      }
    }
  }

  /*
  * Insert
  * */
  @override
  Future<int> insertCategory(CategoryEntity category) async {
    final categoryCompanion = await mapToCategoryTableCompanion(category);
    return await _taskLocalSource.insertCategory(categoryCompanion);
  }

  @override
  Future<TaskEntity> insertTask(TaskEntity task) {
    // TODO: implement insertTask
    throw UnimplementedError();
  }
}
