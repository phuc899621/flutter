import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/dto/req/add_task/add_task.dart';
import 'package:taskit/features/task/data/dto/req/subtask/add_subtask.dart';
import 'package:taskit/features/task/data/source/remote/itask_remote_source.dart';
import 'package:taskit/features/task/data/source/remote/subtask_api.dart';
import 'package:taskit/features/task/data/source/remote/task_api.dart';

import '../../../../../shared/data/dto/response/base_response.dart';
import '../../../../../shared/data/dto/response/base_response_data.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../../../shared/mixin/dio_exception_mapper.dart';
import '../../dto/req/category/add_category_req.dart';
import '../../dto/req/subtask/update_subtask.dart';
import '../../dto/req/update_task/update_task_req.dart';
import '../../dto/res/category/add_category_data.dart';
import '../../dto/res/subtask/add_subtask_data.dart';
import '../../dto/res/subtask/update_subtask_data.dart';
import '../../dto/res/task/add_task_data.dart';
import '../../dto/res/task/update_task_data.dart';
import 'category_api.dart';

final taskRemoteSourceProvider = Provider<ITaskRemoteSource>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  final subtaskApi = ref.watch(subtaskApiProvider);
  final categoryApi = ref.watch(categoryApiProvider);
  return TaskRemoteSource(taskApi, subtaskApi, categoryApi);
});

class TaskRemoteSource with DioExceptionMapper implements ITaskRemoteSource {
  final TaskApi _taskApi;
  final SubtaskApi _subtaskApi;
  final CategoryApi _categoryApi;

  TaskRemoteSource(this._taskApi, this._subtaskApi, this._categoryApi);

  //===========================================
  //================ Add Task =================
  //===========================================
  //region Add Task
  @override
  Future<BaseResponse<AddTaskData>> addTask(
      String token, AddTaskReq task) async {
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
  Future<BaseResponse<List<AddSubtaskData>>> addSubTask(
      String token, String taskId, List<AddSubtaskReq> subtask) async {
    try {
      final response = await _subtaskApi.add('Bearer $token', taskId, subtask);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  @override
  Future<BaseResponse<AddCategoryData>> addCategory(
      String token, AddCategoryReq category) async {
    // TODO: implement addCategory
    try {
      final response = await _categoryApi.add('Bearer $token', category);
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
  Future<BaseResponse<UpdateTaskData>> updateTask(
      String token, String taskId, UpdateTaskReq updateTaskReq) {
    try {
      final response =
          _taskApi.updateTask('Bearer $token', taskId, updateTaskReq);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw _mapToFailure(e, s);
    }
  }

  @override
  Future<BaseResponse<UpdateSubtaskData>> updateSubtask(
      String token, List<UpdateSubtaskReq> updateList) {
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
  Future<BaseResponse<BaseData>> deleteTask(String token, String taskId) {
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
  Future<BaseResponse<BaseData>> deleteSubTask(String token, String subtaskId) {
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
