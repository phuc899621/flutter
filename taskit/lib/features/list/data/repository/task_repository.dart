


import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/list/data/repository/itask_repository.dart';

import '../../../../shared/dto/base_response.dart';
import '../../../../shared/dto/response/task/task_data.dart';

import '../../../../shared/exception/failure.dart';
import '../../../../shared/mixin/dio_exception_mapper.dart';
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
      final response = _taskApi.getListTask('Bearer $token', status, dueDate);
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
}