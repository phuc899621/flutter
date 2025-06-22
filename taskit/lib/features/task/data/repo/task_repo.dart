import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taskit/features/task/data/mapper/itask_mapper.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/shared/data/repository/itoken_repository.dart';
import 'package:taskit/shared/data/repository/token_repository.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

import '../../../../shared/exception/failure.dart';
import '../../../../shared/log/logger_provider.dart';
import '../../../../shared/mixin/dio_exception_mapper.dart';
import '../../../user/data/source/local/user_local_source.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/task_status_enum.dart';
import '../mapper/task_mapper.dart';
import '../source/local/itask_local_source.dart';
import '../source/local/task_local_source.dart';
import '../source/remote/task_api.dart';
import 'itask_repo.dart';

final taskRepoProvider = Provider<ITaskRepo>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  final taskLocalSource = ref.watch(taskLocalSourceProvider);
  final userLocalSource = ref.watch(userLocalSourceProvider);
  final iTokenRepo = ref.watch(tokenRepositoryProvider);
  final iTaskMapper = ref.watch(taskMapperProvider);
  return TaskRepo(taskApi, taskLocalSource, iTokenRepo, iTaskMapper);
});

class TaskRepo with DioExceptionMapper implements ITaskRepo {
  final TaskApi _taskApi;
  final ITaskLocalSource _taskLocalSource;
  final ITokenRepository _tokenService;
  final ITaskMapper _iTaskMapper;

  TaskRepo(this._taskApi, this._taskLocalSource, this._tokenService,
      this._iTaskMapper);

  //=====================================
  //============= WATCH =================
  //=====================================
  //region WATCH
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
        return _iTaskMapper.toTaskEntityList(tasks, subtasks, categories);
      },
    );
  }

  @override
  Stream<List<CategoryEntity>> watchAllCategories() {
    final categoryStream = _taskLocalSource.watchAllCategories();
    return categoryStream.map(_iTaskMapper.toCategoryEntityList);
  }

  //endregion

  //=====================================
  //============= UPDATE =================
  //=====================================
  //region UPDATE
  @override
  Future<void> updateTaskStatus(int localId, TaskStatus status) =>
      _taskLocalSource.updateTaskStatus(localId, status.name);

  @override
  Future<void> updateSubtaskStatus({required int localId}) =>
      _taskLocalSource.updateSubtaskStatus(localId: localId);

  //endregion

  //=====================================
  //============= READ =================
  //=====================================
  //region READ
  @override
  Future<TaskEntity> getTaskById(int localId) async {
    final taskData = await _taskLocalSource.getTaskByLocalId(localId);
    final subtasksData =
        await _taskLocalSource.getSubtaskByTaskLocalId(localId);
    final categoryData =
        await _taskLocalSource.getCategoryByLocalId(taskData!.categoryLocalId);

    return _iTaskMapper.toTaskEntity(taskData, subtasksData, categoryData!);
  }

  @override
  Future<List<SubtaskEntity>> getSubtaskByTaskLocalId(int taskLocalId) async {
    final subtaskData =
        await _taskLocalSource.getSubtaskByTaskLocalId(taskLocalId);
    return _iTaskMapper.toSubtaskEntityList(subtaskData);
  }

  @override
  Future<List<CategoryEntity>> getAICategory(String title) async {
    try {
      final excludedCategories = await _taskLocalSource.getCategories();
      final categoryReq = _iTaskMapper.toAiCategoryReq(title,
          _iTaskMapper.categoryTableDataToStringList(excludedCategories));
      final token = await _tokenService.getToken();
      final categoryData =
          await _taskApi.getAiCategory('Bearer $token', categoryReq);
      return _iTaskMapper.stringListToCategoryEntity(categoryData.data);
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

  @override
  Future<CategoryEntity?> getCategoryByName(String name) async {
    final categoryData = await _taskLocalSource.getCategoryByName(name);
    return categoryData == null
        ? null
        : _iTaskMapper.toCategoryEntity(categoryData);
  }

  //endregion

  //=====================================
  //============= INSERT =================
  //=====================================
  //region INSERT
  @override
  Future<int> insertCategory(CategoryEntity category) async =>
      await _taskLocalSource
          .insertCategory(_iTaskMapper.fromCategoryEntity(category));

  @override
  Future<int> insertTask(TaskEntity task) async {
    final taskCompanion = _iTaskMapper.fromTaskEntity(task);
    final subtaskCompanion = _iTaskMapper.fromSubtaskEntityList(task.subtasks);
    final categoryCompanion = _iTaskMapper.fromCategoryEntity(task.category);
    logger.i('TaskCompanion: $taskCompanion');
    logger.i('SubtaskCompanion: $subtaskCompanion');
    logger.i('CategoryCompanion: $categoryCompanion');
    return await _taskLocalSource.insertTask(
      taskCompanion,
      subtaskCompanion,
      categoryCompanion,
    );
  }
//endregion
}
