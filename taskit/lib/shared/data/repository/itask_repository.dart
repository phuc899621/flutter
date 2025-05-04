

import '../../../features/create_task/data/dto/request/create_task/create_task.dart';
import '../../../features/create_task/data/dto/request/suggest_category/suggest_category.dart';
import '../../../features/create_task/data/dto/response/category_data.dart';

import '../../../features/list/data/dto/request/status.dart';
import '../dto/base_response.dart';
import '../dto/base_response_data.dart';

import '../dto/response/task/task_data.dart';

abstract interface class ITaskRepository{
  Future<BaseResponse<TaskDataLst>> getListTask(String token,String status,String dueDate);
  Future<BaseResponse<BaseData>> updateTaskStatus(String token,String taskId,String status);
  Future<BaseResponse<BaseData>> createTask(String token,CreateTaskReq createTaskReq);
  Future<BaseResponse<CategoryData>> suggestCategory(String token,SuggestCategoryReq suggestCategoryReq);


}