import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/dto/req/add_task/add_task.dart';
import 'package:taskit/features/task/data/source/remote/itask_remote_source.dart';
import 'package:taskit/features/task/data/source/remote/task_api.dart';

import '../../../../../shared/data/dto/response/base_response.dart';
import '../../../../../shared/exception/failure.dart';
import '../../../../../shared/mixin/dio_exception_mapper.dart';
import '../../dto/req/update_task/update_task_req.dart';
import '../../dto/res/task/add_task_data.dart';
import '../../dto/res/task/update_task_data.dart';

final taskRemoteSourceProvider = Provider<ITaskRemoteSource>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  return TaskRemoteSource(taskApi);
});

class TaskRemoteSource with DioExceptionMapper implements ITaskRemoteSource {
  final TaskApi _taskApi;

  TaskRemoteSource(this._taskApi);

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
