


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/list/data/dto/request/status.dart';
import 'package:taskit/features/list/data/repository/itask_repository.dart';
import 'package:taskit/shared/dto/base_response_data.dart';

import '../../../../shared/dto/base_response.dart';
import '../../../../shared/dto/response/task/task_data.dart';

import '../../../../shared/exception/failure.dart';
import '../../../../shared/mixin/dio_exception_mapper.dart';
import '../dto/request/update.dart';
import '../source/task_api.dart';

final taskRepositoryProvider = Provider.autoDispose<ITaskRepository>((ref) {
  final taskApi = ref.watch(taskApiProvider);
  return TaskRepository(taskApi);
});

class TaskRepository with DioExceptionMapper implements ITaskRepository{
  final TaskApi _taskApi;
  TaskRepository(this._taskApi);
  @override
  Future<BaseResponse<TaskDataLst>> getListTask(String token,String status,String dueDate) async {
    try{
      final response = await _taskApi.getListTask('Bearer $token', status, dueDate);
      return response;
    }on DioException catch(e, s){
      throw mapDioExceptionToFailure(e, s);
      }catch(e,s){
        throw Failure(
          message: "An unexpected error occurred when get list of task. Please try again later.",
          exception: e as Exception,
          stackTrace: s,
        );

    }
  }

  @override
  Future<BaseResponse<BaseData>> updateTaskStatus(String token, String taskId, String status) async {
    try{
      final updateStatusReq = UpdateReq<StatusReq>(updateData: StatusReq(status: status));
      final json=updateStatusReq.toJson((status)=>status.toJson());
      final response = await _taskApi.updateTaskStatus('Bearer $token', taskId, json);
      return response;
    }on DioException catch(e, s){
      throw mapDioExceptionToFailure(e, s);

    }catch(e,s){
      debugPrint(e.toString()+";;;;;;;;;;;;");
      debugPrint(s.toString());
      if(e is Exception){
        throw Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
        );
      }else{
        throw Failure(
          message: "An unexpected error occurred when update task status. Please try again later.",
          exception: e,
          stackTrace: s,
        );
      }

    }
  }
}