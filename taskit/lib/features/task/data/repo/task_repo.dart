import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/data/dto/req/status/status.dart';
import 'package:taskit/shared/data/repository/itask_repository.dart';

import '../../../features/task/data/dto/req/create_task/create_task.dart';
import '../../../features/task/data/dto/req/suggest_category/suggest_category.dart';
import '../../../features/task/data/dto/req/update/update.dart';
import '../../../features/task/data/dto/res/category/category_data.dart';
import '../../exception/failure.dart';
import '../../mixin/dio_exception_mapper.dart';
import '../dto/base_response.dart';
import '../dto/base_response_data.dart';
import '../dto/response/task/task_data.dart';
import '../source/remote/task/task_api.dart';

final taskRepositoryProvider = Provider.autoDispose<ITaskRepository>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  return TaskRepository(taskApi);
});

class TaskRepository with DioExceptionMapper implements ITaskRepository {
  final TaskApi _taskApi;
  TaskRepository(this._taskApi);
  @override
  Future<BaseResponse<TaskDataLst>> getListTask(
      String token, String status, String dueDate) async {
    try {
      final response =
          await _taskApi.getListTask('Bearer $token', status, dueDate);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message:
            "An unexpected error occurred when get list of task. Please try again later.",
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }

  @override
  Future<BaseResponse<BaseData>> updateTaskStatus(
      String token, String taskId, String status) async {
    try {
      final updateStatusReq =
          UpdateReq<StatusReq>(updateData: StatusReq(status: status));
      final json = updateStatusReq.toJson((status) => status.toJson());
      final response =
          await _taskApi.updateTaskStatus('Bearer $token', taskId, json);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      debugPrint("$e;;;;;;;;;;;;");
      debugPrint(s.toString());
      if (e is Exception) {
        throw Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        );
      } else {
        throw Failure(
          message:
              "An unexpected error occurred when update task status. Please try again later.",
          exception: e,
          stackTrace: s,
        );
      }
    }
  }

  @override
  Future<BaseResponse<BaseData>> createTask(
      String token, CreateTaskReq createTaskReq) async {
    try {
      final response = await _taskApi.addTask('Bearer $token', createTaskReq);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      if (e is Exception) {
        throw Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        );
      } else {
        throw Failure(
          message:
              "An unexpected error occurred when create task. Please try again later.",
          exception: e,
          stackTrace: s,
        );
      }
    }
  }

  @override
  Future<BaseResponse<CategoryData>> suggestCategory(
      String token, SuggestCategoryReq suggestCategoryReq) async {
    try {
      final response =
          _taskApi.suggestCategory('Bearer $token', suggestCategoryReq);
      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      if (e is Exception) {
        throw Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        );
      } else {
        throw Failure(
          message:
              "An unexpected error occurred when suggest category. Please try again later.",
          exception: e,
          stackTrace: s,
        );
      }
    }
  }
}
