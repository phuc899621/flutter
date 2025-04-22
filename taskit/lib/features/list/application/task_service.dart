


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/features/list/domain/mapper/itask_model_mapper.dart';
import 'package:taskit/features/list/domain/model/task_model.dart';
import 'package:taskit/shared/dto/base_response.dart';
import 'package:taskit/shared/dto/response/task/task_data.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../data/repository/itask_repository.dart';
import '../data/repository/task_repository.dart';
import 'itask_service.dart';
final taskServiceProvider=Provider<ITaskService>((ref){
  return TaskService(ref.read(taskRepositoryProvider));
});


class TaskService implements ITaskModelMapper,ITaskService{
  final ITaskRepository _iTaskRepository;
  TaskService(this._iTaskRepository);
  @override
  List<TaskModel> mapToTaskModel(BaseResponse<TaskDataLst> response) {
    final result= TaskModelLst(
        tasks: response.data.tasks.map((e) => TaskModel(
      title: e.title,
      id: e.id,
      description: e.description,
      category: e.category,
      priority: e.priority,
      userId: e.userId,
      status: e.status,
      dueDate: e.dueDate,
      subtasks: e.subtasks,
      createdAt: e.createdAt,
      updatedAt: e.updatedAt,
    )).toList()
    );
    return result.tasks;

  }

  @override
  Future<Result<List<TaskModel>, Failure>> getListTask(String token, String status, String dueDate) async {
    try{
      final response = await _iTaskRepository.getListTask(token, status, dueDate);
      final model = mapToTaskModel(response);
      return Success(model);
    }on Failure catch(e){
      return Error(e);
    }catch(e,s){
      if(e is Exception){
        return Error(Failure(
          message: e.toString(),
          exception: e,
          stackTrace: s,
          ));
      }else{
        return Error(Failure(
          message: e.toString(),
          exception: Exception("Unknown error at login"),
          stackTrace: s,
        ));
      }
    }
  }

}