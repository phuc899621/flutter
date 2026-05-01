import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/dto/req/add_task/add_task.dart';
import 'package:taskit/features/task/data/dto/req/subtask/add_subtask_list_req.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask_list_req.dart';
import 'package:taskit/features/task/data/source/remote/itask_remote_source.dart';
import 'package:taskit/features/task/data/source/remote/subtask_api.dart';
import 'package:taskit/features/task/data/source/remote/task_api.dart';

import '../../../../../shared/data/dto/response/base_data.dart';
import '../../../../../shared/data/dto/response/data_response.dart';
import '../../../../../shared/data/source/remote/network/dio_exception_mapper.dart';
import '../../../../../shared/exception/failure.dart';
import '../../dto/req/ai/ai_req.dart';
import '../../dto/req/update_task/update_task_req.dart';
import '../../dto/res/ai/ai_generate_task_data.dart';
import '../../dto/res/ai/ai_question_data.dart';
import '../../dto/res/subtask/add_subtask_data.dart';
import '../../dto/res/subtask/update_subtask_data.dart';
import '../../dto/res/task/add_task_data.dart';
import '../../dto/res/task/update_task_data.dart';
import 'ai_api.dart';

final taskRemoteSourceProvider = Provider<ITaskRemoteSource>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  final subtaskApi = ref.watch(subtaskApiProvider);
  final aiApi = ref.watch(aiApiProvider);
  return TaskRemoteSource(taskApi, subtaskApi, aiApi);
});

class TaskRemoteSource with DioExceptionMapper implements ITaskRemoteSource {
  final TaskApi _taskApi;
  final SubtaskApi _subtaskApi;
  final AiApi _aiApi;

  TaskRemoteSource(this._taskApi, this._subtaskApi, this._aiApi);

  //===========================================
  //================ Add Task =================
  //===========================================
  //region Add Task
  @override
  Future<DataResponse<AddTaskData>> addTask(
    String token,
    AddTaskReq task,
  ) async {
    try {
      final response = await _taskApi.createTask('Bearer $token', task);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  @override
  Future<DataResponse<List<AddSubtaskData>>> addSubTask(
    String token,
    String taskId,
    AddSubtaskListReq subtask,
  ) async {
    try {
      final response = await _subtaskApi.add('Bearer $token', taskId, subtask);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  //endregion

  //=======================================
  //============= Update Task ================
  //========================================
  //region Update
  @override
  Future<DataResponse<UpdateTaskData>> updateTask(
    String token,
    String taskId,
    UpdateTaskReq updateTaskReq,
  ) {
    try {
      final response = _taskApi.updateTask(
        'Bearer $token',
        taskId,
        updateTaskReq,
      );
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  @override
  Future<DataResponse<UpdateSubtaskData>> updateSubtask(
    String token,
    UpdateSubtaskListReq updateList,
  ) {
    try {
      final response = _subtaskApi.update('Bearer $token', updateList);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  //endregion
  //=======================================
  //============= Delete Task ==============
  //========================================
  //region Delete

  @override
  Future<DataResponse<BaseData>> deleteTask(String token, String taskId) {
    try {
      final response = _taskApi.deleteTask('Bearer $token', taskId);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  @override
  Future<DataResponse<BaseData>> deleteSubTask(String token, String subtaskId) {
    try {
      final response = _subtaskApi.delete('Bearer $token', subtaskId);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  //endregion
  //=======================================
  //============= AI ==============
  //========================================
  //region AI
  @override
  Future<DataResponse<AiGenerateTaskData>> generateTask(
    String token,
    AiReq aiReq,
  ) {
    try {
      return _aiApi.generate('Bearer $token', aiReq);
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  @override
  Future<DataResponse<AiQuestionData>> getAnswer(String token, AiReq aiReq) {
    try {
      return _aiApi.getAnswer('Bearer $token', aiReq);
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  //endregion

  Failure _mapToFailure(dynamic e, StackTrace s) {
    if (e is Exception) {
      return Failure(
        message: "An unexpected error occurred when login: ${e.toString()}",
        exception: e,
        stackTrace: s,
      );
    } else {
      return Failure(
        message: "An unexpected error occurred when login. ${e.toString()}",
        exception: Exception(e.toString()), // Tạo một Exception mới
        stackTrace: s,
      );
    }
  }
}
