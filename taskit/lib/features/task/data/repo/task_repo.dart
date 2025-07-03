import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taskit/features/task/data/dto/req/ai/ai_req.dart';
import 'package:taskit/features/task/data/dto/req/subtask/add_subtask.dart';
import 'package:taskit/features/task/data/dto/req/subtask/add_subtask_list_req.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask_list_req.dart';
import 'package:taskit/features/task/data/mapper/itask_mapper.dart';
import 'package:taskit/features/task/data/source/remote/itask_remote_source.dart';
import 'package:taskit/features/task/domain/entities/ai_task_entity.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/features/user/data/source/local/iuser_local_source.dart';
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
import '../dto/req/category/add_category_req.dart';
import '../dto/req/update_task/update_task_req.dart';
import '../mapper/task_mapper.dart';
import '../source/local/itask_local_source.dart';
import '../source/local/task_local_source.dart';
import '../source/remote/task_api.dart';
import '../source/remote/task_remote_source.dart';
import 'itask_repo.dart';

final taskRepoProvider = Provider<ITaskRepo>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  final taskLocalSource = ref.watch(taskLocalSourceProvider);
  final userLocalSource = ref.watch(userLocalSourceProvider);
  final iTokenRepo = ref.watch(tokenRepositoryProvider);
  final iTaskMapper = ref.watch(taskMapperProvider);
  final iTaskRemoteSource = ref.watch(taskRemoteSourceProvider);
  return TaskRepo(taskApi, taskLocalSource, iTokenRepo, iTaskMapper,
      iTaskRemoteSource, userLocalSource);
});

class TaskRepo with DioExceptionMapper implements ITaskRepo {
  final TaskApi _taskApi;
  final ITaskLocalSource _taskLocalSource;
  final ITaskRemoteSource _taskRemoteSource;
  final IUserLocalSource _userLocalSource;
  final ITokenRepository _tokenService;
  final ITaskMapper _iTaskMapper;
  final Map<int, Timer> _syncTaskTitleTimers = {};

  final Map<int, Timer> _syncSubtaskStatusTimer = {};
  final Map<int, Timer> _syncTaskStatusTimer = {};
  final Map<int, Timer> _syncTaskDueDateTimer = {};
  final Map<int, Timer> _syncTaskHasTimeTimer = {};
  final Map<int, Timer> _syncTaskPriorityTimer = {};
  final Map<int, Timer> _syncTaskCategoryTimer = {};
  final Map<int, Timer> _syncTaskDescriptionTimer = {};
  final Map<int, Timer> _syncSubtaskTitleTimer = {};

  TaskRepo(this._taskApi, this._taskLocalSource, this._tokenService,
      this._iTaskMapper, this._taskRemoteSource, this._userLocalSource);

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

  @override
  Stream<List<SubtaskEntity>> watchAllSubtasks() {
    final subtaskStream = _taskLocalSource.watchAllSubtasks();
    return subtaskStream.map(_iTaskMapper.toSubtaskEntityList);
  }

  //endregion

  //=====================================
  //============= UPDATE =================
  //=====================================
  //region UPDATE
  @override
  Future<void> updateTaskStatus(int localId, TaskStatus status) async {
    _taskLocalSource.updateTaskStatusWithoutSync(localId, status.name);
    _syncTaskStatusTimer[localId]?.cancel();
    _syncTaskStatusTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update task status timer');
      updateRemoteTaskStatus(localId);
    });
    updateRemoteSubtaskStatusByTaskId(localId);
  }

  @override
  Future<void> updateSubtaskStatus(int localId) async {
    _taskLocalSource.updateSubtaskStatusWithoutSync(localId);
    _syncSubtaskStatusTimer[localId]?.cancel();
    _syncSubtaskStatusTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update subtask status timer');
      updateRemoteSubtaskStatus(localId);
    });
    _syncTaskStatusTimer[localId]?.cancel();
    _syncTaskStatusTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update task status timer');
      updateRemoteTaskStatus(localId);
    });
  }

  @override
  Future<void> updateTaskTitle(int localId, String title) async {
    _taskLocalSource.updateTaskTitleWithoutSync(localId, title);
    _syncTaskTitleTimers[localId]?.cancel();
    _syncTaskTitleTimers[localId] = Timer(const Duration(seconds: 10), () {
      updateRemoteTaskTitle(localId);
    });
  }

  @override
  Future<void> updateTaskDescription(int localId, String description) async {
    _taskLocalSource.updateTaskDescriptionWithoutSync(localId, description);
    _syncTaskDescriptionTimer[localId]?.cancel();
    _syncTaskDescriptionTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update task description timer');
      updateRemoteTaskDescription(localId);
    });
  }

  @override
  Future<void> updateTaskPriority(int localId, TaskPriority priority) async {
    _taskLocalSource.updateTaskPriorityWithoutSync(localId, priority.name);
    _syncTaskPriorityTimer[localId]?.cancel();
    _syncTaskPriorityTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update task priority timer');
      updateRemoteTaskPriority(localId);
    });
  }

  @override
  Future<void> updateTaskCategory(int localId, int categoryLocalId) async {
    _taskLocalSource.updateTaskCategoryWithoutSync(localId, categoryLocalId);
    _syncTaskCategoryTimer[localId]?.cancel();
    _syncTaskCategoryTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update task category timer');
      updateRemoteTaskCategory(localId, categoryLocalId);
    });
  }

  @override
  Future<void> updateTaskDueDate(int localId, DateTime? dueDate) async {
    _taskLocalSource.updateTaskDueDateWithoutSync(localId, dueDate);
    _syncTaskDueDateTimer[localId]?.cancel();
    _syncTaskDueDateTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update task due date timer');
      updateRemoteTaskDueDate(localId);
    });
    _syncTaskStatusTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update task status timer');
      updateRemoteTaskStatus(localId);
    });
    final subtasks = await _taskLocalSource.getSubtaskByTaskLocalId(localId);
    if (subtasks.isEmpty) return;
    final subtaskUncompletedList =
        subtasks.where((s) => s.isCompleted == false).toList();
    if (subtaskUncompletedList.isNotEmpty) return;
    _syncSubtaskStatusTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update subtask status timer');
      updateRemoteSubtaskStatusByTaskId(localId);
    });
  }

  @override
  Future<void> updateTaskHasTime(int localId, bool hasTime) async {
    _taskLocalSource.updateTaskHasTimeWithoutSync(localId, hasTime);
    _syncTaskHasTimeTimer[localId]?.cancel();
    _syncTaskHasTimeTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update task has time timer');
      updateRemoteTaskHasTime(localId);
    });
  }

  @override
  Future<void> updateSubtaskTitle(int localId, String title) async {
    _taskLocalSource.updateSubtaskTitleWithoutSync(localId, title);
    _syncSubtaskTitleTimer[localId]?.cancel();
    _syncSubtaskTitleTimer[localId] = Timer(const Duration(seconds: 10), () {
      logger.i('update subtask title timer');
      updateRemoteSubtaskTitle(localId);
    });
  }

  //endregion

  //====================================
  //============= READ =================
  //====================================
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
  Future<int> insertCategory(CategoryEntity category) async {
    final categoryLocalId = await _taskLocalSource
        .insertCategory(_iTaskMapper.fromCategoryEntity(category));
    if (categoryLocalId == -1) return -1;
    logger.i('insert category with localId $categoryLocalId');
    insertRemoteCategory(categoryLocalId);
    return categoryLocalId;
  }

  @override
  Future<int> insertTask(TaskEntity task) async {
    final taskCompanion = _iTaskMapper.fromTaskEntity(task);
    final subtaskCompanion = _iTaskMapper.fromSubtaskEntityList(task.subtasks);
    final categoryCompanion = _iTaskMapper.fromCategoryEntity(task.category);
    logger.i('TaskCompanion: $taskCompanion');
    logger.i('SubtaskCompanion: $subtaskCompanion');
    logger.i('CategoryCompanion: $categoryCompanion');
    int taskLocalId = await _taskLocalSource.insertTask(
      taskCompanion,
      subtaskCompanion,
      categoryCompanion,
    );
    insertRemoteTask(taskLocalId);

    return taskLocalId;
  }

  @override
  Future<int> insertTaskFromAi(TaskTableCompanion task) async {
    int taskLocalId = await _taskLocalSource.insertTaskFromAi(task);
    if (taskLocalId == -1) return -1;
    insertRemoteTask(taskLocalId);
    return taskLocalId;
  }

  @override
  Future<void> insertSubtask(int taskLocalId) async {
    final subtaskEntity = SubtaskEntity(
      localId: -1,
      title: "",
      taskLocalId: taskLocalId,
      isCompleted: false,
    );
    logger.i('insert subtask: $subtaskEntity');
    int subtaskId = await _taskLocalSource
        .insertSubtask(_iTaskMapper.fromSubtaskEntity(subtaskEntity));
    if (subtaskId == -1) return;
    insertRemoteSubtask(taskLocalId, subtaskId);
    updateRemoteTaskStatus(taskLocalId);
  }

  //endregion
  //=====================================
  //============= DELETE =================
  //=====================================
  //region DELETE
  @override
  Future<void> deleteTask(int localId) async {
    final task = await _taskLocalSource.getTaskByLocalId(localId);
    final token = await _tokenService.getToken();
    logger.i('delete task with localId $localId');
    if (task == null || task.remoteId.isEmpty || token == null || token.isEmpty)
      return;
    logger.i('delete task with remoteId ${task.remoteId}');
    final taskRemoteId = task.remoteId;
    await _taskLocalSource.deleteTaskByLocalId(localId);
    deleteRemoteTask(taskRemoteId);
  }

  @override
  Future<void> deleteSubtask(int localId) async {
    final subtask = await _taskLocalSource.getSubtaskByLocalId(localId);
    final token = await _tokenService.getToken();
    await _taskLocalSource.deleteSubtaskByLocalId(localId);
    logger.i('delete subtask with localId $localId');
    if (subtask == null || token == null || subtask.remoteId.isEmpty) return;

    deleteRemoteSubtask(subtask.remoteId);
  }

  //endregion
  //=====================================
  //============= INSERT REMOTE =========
  //=====================================
  //region INSERT REMOTE
  @override
  Future<void> insertRemoteTask(int taskLocalId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      final taskTblData = await _taskLocalSource.getTaskByLocalId(taskLocalId);
      if (taskTblData == null) return;
      final categoryTblData = await _taskLocalSource
          .getCategoryByLocalId(taskTblData.categoryLocalId);
      final subtasksTblData =
          await _taskLocalSource.getSubtaskByTaskLocalId(taskLocalId);
      if (categoryTblData == null) return;
      final response = await _taskRemoteSource.addTask(
          token,
          _iTaskMapper.toAddTaskReq(
              taskTblData, categoryTblData, subtasksTblData));
      logger.i('add task response: \n $response');

      _taskLocalSource.updateSyncAddTaskAndSubtask(
          _iTaskMapper.toSyncTaskTableCompanion(response.data),
          _iTaskMapper.toSyncListSubtaskTblCompanion(response.data.subtasks));
    } catch (e, s) {
      logger.e('add task error: \n $e \n $s');
    }
  }

  @override
  Future<void> insertRemoteSubtask(int taskLocalId, int subtaskLocalId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      final taskTblData = await _taskLocalSource.getTaskByLocalId(taskLocalId);
      if (taskTblData == null) return;
      final subtaskTblData =
          await _taskLocalSource.getSubtaskByLocalId(subtaskLocalId);
      if (subtaskTblData == null) return;
      final request = AddSubtaskListReq(subtasks: [
        AddSubtaskReq(
          localId: subtaskTblData.localId,
          title: subtaskTblData.title,
        )
      ]);
      logger.i('add subtask request: \n $request');
      final response = await _taskRemoteSource.addSubTask(
          token, taskTblData.remoteId, request);
      await _taskLocalSource.updateSyncSubtasksFromSubtasksTblCompanion(
          _iTaskMapper.toSyncListSubtaskTblCompanion(response.data));
    } catch (e, s) {
      logger.e('add subtasks error: \n $e \n $s');
    }
  }

  @override
  Future<void> insertRemoteCategory(int categoryLocalId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      final category =
          await _taskLocalSource.getCategoryByLocalId(categoryLocalId);
      if (category == null) return;
      final request = AddCategoryReq(
        localId: category.localId,
        name: category.name,
      );
      logger.i('add category request: \n $request');

      final categoryRes = await _taskRemoteSource.addCategory(token, request);
      logger.i('add category response: \n $categoryRes');
      await _taskLocalSource.updateSyncAddCategory(
          categoryRes.data.localId, categoryRes.data.id);
    } catch (e, s) {
      logger.e('add subtasks error: \n $e \n $s');
    }
  }

  //endregion
  //=====================================
//============= Update REMOTE =========
//=====================================
//region Update REmote
  @override
  Future<void> updateRemoteTaskTitle(int taskLocalId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      final taskTblData = await _taskLocalSource.getTaskByLocalId(taskLocalId);
      if (taskTblData == null) return;
      if (taskTblData.remoteId.isEmpty) return;
      final request = UpdateTaskReq.titleOnly(
        localId: taskLocalId,
        title: taskTblData.title,
      );
      final response = await _taskRemoteSource.updateTask(
          token, taskTblData.remoteId, request);
      await _taskLocalSource.updateSyncTask(response.data.localId);
    } catch (e, s) {
      logger.e('update task error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateRemoteTaskDescription(int taskLocalId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      final taskTblData = await _taskLocalSource.getTaskByLocalId(taskLocalId);
      if (taskTblData == null) return;
      if (taskTblData.remoteId.isEmpty) return;
      final request = UpdateTaskReq.descriptionOnly(
        localId: taskLocalId,
        description: taskTblData.description,
      );
      final response = await _taskRemoteSource.updateTask(
          token, taskTblData.remoteId, request);
      await _taskLocalSource.updateSyncTask(response.data.localId);
    } catch (e, s) {
      logger.e('update task error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateRemoteTaskDueDate(int taskLocalId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      final taskTblData = await _taskLocalSource.getTaskByLocalId(taskLocalId);
      if (taskTblData == null) return;
      if (taskTblData.remoteId.isEmpty) return;
      final request = UpdateTaskReq.dueDateOnly(
          localId: taskLocalId, dueDate: taskTblData.dueDate);
      final response = await _taskRemoteSource.updateTask(
          token, taskTblData.remoteId, request);
      await _taskLocalSource.updateSyncTask(response.data.localId);
    } catch (e, s) {
      logger.e('update task error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateRemoteTaskCategory(
      int taskLocalId, int categoryLocalId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      final taskTblData = await _taskLocalSource.getTaskByLocalId(taskLocalId);
      if (taskTblData == null || taskTblData.remoteId.isEmpty) return;
      if (taskTblData.remoteId.isEmpty) return;
      final categoryTblData =
          await _taskLocalSource.getCategoryByLocalId(categoryLocalId);
      if (categoryTblData == null || categoryTblData.remoteId.isEmpty) return;
      final request = UpdateTaskReq.categoryIdOnly(
          localId: taskLocalId, categoryId: categoryTblData.remoteId);
      final response = await _taskRemoteSource.updateTask(
          token, taskTblData.remoteId, request);
      await _taskLocalSource.updateSyncTask(response.data.localId);
    } catch (e, s) {
      logger.e('update task error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateRemoteTaskHasTime(int taskLocalId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      final taskTblData = await _taskLocalSource.getTaskByLocalId(taskLocalId);
      if (taskTblData == null) return;
      if (taskTblData.remoteId.isEmpty) return;
      final request = UpdateTaskReq.hasTimeOnly(
          localId: taskLocalId, hasTime: taskTblData.hasTime);
      final response = await _taskRemoteSource.updateTask(
          token, taskTblData.remoteId, request);
      await _taskLocalSource.updateSyncTask(response.data.localId);
    } catch (e, s) {
      logger.e('update task error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateRemoteTaskPriority(int taskLocalId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      final taskTblData = await _taskLocalSource.getTaskByLocalId(taskLocalId);
      if (taskTblData == null) return;
      if (taskTblData.remoteId.isEmpty) return;
      final request = UpdateTaskReq.priorityOnly(
          localId: taskLocalId, priority: taskTblData.priority);
      final response = await _taskRemoteSource.updateTask(
          token, taskTblData.remoteId, request);
      await _taskLocalSource.updateSyncTask(response.data.localId);
    } catch (e, s) {
      logger.e('update task error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateRemoteTaskStatus(int taskLocalId) async {
    try {
      logger.i('update task status starting');
      final token = await _tokenService.getToken();
      if (token == null) return;
      logger.i('update task status has token');
      final taskTblData = await _taskLocalSource.getTaskByLocalId(taskLocalId);
      if (taskTblData == null) return;
      logger.i('update task status not null');
      if (taskTblData.remoteId.isEmpty) return;
      logger.i('update task status has remoteId');
      final request = UpdateTaskReq.statusOnly(
          localId: taskLocalId, status: taskTblData.status);
      final response = await _taskRemoteSource.updateTask(
          token, taskTblData.remoteId, request);
      await _taskLocalSource.updateSyncTask(response.data.localId);
    } catch (e, s) {
      logger.e('update task error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateRemoteSubtaskStatus(int subtaskLocalId) async {
    try {
      final subtask =
          await _taskLocalSource.getSubtaskByLocalId(subtaskLocalId);
      if (subtask == null || subtask.remoteId.isEmpty) return;
      final token = await _tokenService.getToken();
      if (token == null) return;
      final request = UpdateSubtaskListReq(subtasks: [
        UpdateSubtaskReq.statusOnly(
            id: subtask.remoteId,
            isCompleted: subtask.isCompleted,
            localId: subtask.localId)
      ]);
      logger.i('update subtask request: \n $request');
      final response = await _taskRemoteSource.updateSubtask(token, request);
      await _taskLocalSource.updateSyncSubtasks(response.data.subtasks);
    } catch (e, s) {
      logger.e('update subtask error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateRemoteSubtaskStatusByTaskId(int taskLocalId) async {
    try {
      final subtasks =
          await _taskLocalSource.getSubtaskByTaskLocalId(taskLocalId);
      if (subtasks.isEmpty) return;
      final token = await _tokenService.getToken();
      if (token == null) return;
      final request = UpdateSubtaskListReq(
          subtasks: subtasks
              .map((s) => UpdateSubtaskReq.statusOnly(
                  id: s.remoteId,
                  isCompleted: s.isCompleted,
                  localId: s.localId))
              .toList());
      logger.i('update subtask request: \n $request');
      final response = await _taskRemoteSource.updateSubtask(token, request);
      await _taskLocalSource.updateSyncSubtasks(response.data.subtasks);
    } catch (e, s) {
      logger.e('update subtask error: \n $e \n $s');
    }
  }

  @override
  Future<void> updateRemoteSubtaskTitle(int subtaskLocalId) async {
    try {
      final subtask =
          await _taskLocalSource.getSubtaskByLocalId(subtaskLocalId);
      if (subtask == null || subtask.remoteId.isEmpty) return;
      final token = await _tokenService.getToken();
      if (token == null) return;
      final request = UpdateSubtaskListReq(subtasks: [
        UpdateSubtaskReq.titleOnly(
            id: subtask.remoteId,
            title: subtask.title,
            localId: subtask.localId)
      ]);
      logger.i('update subtask request: \n $request');
      final response = await _taskRemoteSource.updateSubtask(token, request);
      await _taskLocalSource.updateSyncSubtasks(response.data.subtasks);
    } catch (e, s) {
      logger.e('update subtask error: \n $e \n $s');
    }
  }

//endregion
//================================
//========== DELETE REMOTE================
//================================
//region DELETE REMOTE
  @override
  Future<void> deleteRemoteTask(String taskRemoteId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      await _taskRemoteSource.deleteTask(token, taskRemoteId);
    } catch (e, s) {
      logger.e('delete task error: \n $e \n $s');
    }
  }

  @override
  Future<void> deleteRemoteSubtask(String subtaskRemoteId) async {
    try {
      final token = await _tokenService.getToken();
      if (token == null) return;
      await _taskRemoteSource.deleteSubTask(token, subtaskRemoteId);
    } catch (e, s) {
      logger.e('delete task error: \n $e \n $s');
    }
  }

//endregion
//=====================================
//============= AI ===================
//=====================================
//region AI
  @override
  Future<Result<AiTaskEntity, Failure>> generateAiTask(
      String text, String utcOffset) async {
    try {
      final token = await _tokenService.getToken();
      final request = AiReq.generate(text: text, utcOffset: utcOffset);
      final response =
          await _taskRemoteSource.generateTask(token ?? '', request);
      final category = await _taskLocalSource
          .getCategoryByRemoteId(response.data.categoryId);
      final user = await _userLocalSource.getUser();
      if (category == null) {
        return const Error(
            Failure(message: 'Category not found when generate task by ai'));
      }
      if (user == null) {
        return const Error(
            Failure(message: 'User not found when generate task by ai'));
      }
      logger.i('generate task local');
      final aiTask = _iTaskMapper.toAiTaskEntity(response.data);
      int localId = await _taskLocalSource.insertTaskFromAi(
          _iTaskMapper.fromAiGenerateTaskData(
              response.data, user.localId, category.localId));
      if (localId == -1) {
        return const Error(Failure(message: 'Insert task error'));
      }
      insertRemoteTask(localId);
      logger.i('generate task local success $localId');
      return Success(aiTask);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at generate AI Task"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  Future<Result<String, Failure>> getAiAnswer(
      String question, String utcOffset, String language) async {
    try {
      final token = await _tokenService.getToken();
      final request = AiReq.question(
          text: question, utcOffset: utcOffset, language: language);
      final response = await _taskRemoteSource.getAnswer(token ?? '', request);
      return Success(response.data.answer);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      if (e is Exception) {
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        ));
      } else {
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at generate AI Task"),
          stackTrace: s,
        ));
      }
    }
  }
//endregion
}
