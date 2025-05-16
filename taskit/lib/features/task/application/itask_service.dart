import 'package:multiple_result/multiple_result.dart';
import 'package:taskit/shared/domain/model/task_model.dart';
import 'package:taskit/shared/exception/failure.dart';

import '../../features/task/data/dto/req/create_task/create_task.dart';
import '../../features/task/data/dto/req/suggest_category/suggest_category.dart';
import '../../features/task/domain/model/category.dart';

abstract interface class ITaskService {
  Future<Result<List<TaskModel>, Failure>> getListTask(
      String token, String status, String dueDate);
  Future<Result<void, Failure>> updateTaskStatus(
      String token, String taskId, String status);
  Future<Result<void, Failure>> createTask(
      String token, CreateTaskReq createTaskReq);
  Future<Result<CategoryModel, Failure>> suggestCategory(
      String token, SuggestCategoryReq suggestCategoryReq);
}
