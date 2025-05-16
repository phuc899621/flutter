import '../../../../shared/data/dto/response/base_response.dart';
import '../../../../shared/data/dto/response/base_response_data.dart';
import '../dto/req/create_task/create_task.dart';
import '../dto/req/suggest_category/suggest_category.dart';
import '../dto/res/category/category_data.dart';
import '../dto/res/task/task_data.dart';

abstract interface class ITaskRepo {
  Future<BaseResponse<TaskDataLst>> getListTask(
      String token, String status, String dueDate);
  Future<BaseResponse<BaseData>> updateTaskStatus(
      String token, String taskId, String status);
  Future<BaseResponse<BaseData>> createTask(
      String token, CreateTaskReq createTaskReq);
  Future<BaseResponse<CategoryData>> suggestCategory(
      String token, SuggestCategoryReq suggestCategoryReq);
}
