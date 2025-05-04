


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/src/result.dart';
import 'package:taskit/shared/domain/mapper/itask_model_mapper.dart';
import 'package:taskit/features/create_task/domain/model/category_model.dart';
import 'package:taskit/shared/domain/model/task_model.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../../features/create_task/data/dto/request/create_task/create_task.dart';
import '../../features/create_task/data/dto/request/suggest_category/suggest_category.dart';
import '../../features/create_task/data/dto/response/category_data.dart';
import '../data/dto/base_response.dart';
import '../data/dto/response/task/task_data.dart';
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
          exception: Exception("Unknown error at get list of task"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  Future<Result<void, Failure>> updateTaskStatus(String token, String taskId, String status) async {
    try{
      await _iTaskRepository.updateTaskStatus(token, taskId, status);
      return Success(null);
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
          exception: Exception("Unknown error at update task status"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  Future<Result<void, Failure>> createTask(String token, CreateTaskReq createTaskReq) async{
    try{
       await _iTaskRepository.createTask(token, createTaskReq);
      return Success(null);
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
          exception: Exception("Unknown error at create task"),
          stackTrace: s,
        ));
      }
    }
  }

  @override
  CategoryModel mapToCategoryModel(BaseResponse<CategoryData> response) {
    return CategoryModel(categories: response.data.categories);
  }

  @override
  Future<Result<CategoryModel, Failure>> suggestCategory(String token,SuggestCategoryReq suggestCategoryReq ) async {
    try{
      final response = await _iTaskRepository.suggestCategory(token, suggestCategoryReq);
      final model = mapToCategoryModel(response);
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
          exception: Exception("Unknown error at suggest category"),
          stackTrace: s,
        ));
      }
    }
  }

}