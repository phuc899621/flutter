

import '../../../features/list/data/dto/request/status.dart';
import '../dto/base_response.dart';
import '../dto/base_response_data.dart';
import '../../../features/create_task/data/request/create_task/create_task.dart';
import '../dto/response/task/task_data.dart';

abstract interface class ITaskRepository{
  Future<BaseResponse<TaskDataLst>> getListTask(String token,String status,String dueDate);
  Future<BaseResponse<BaseData>> updateTaskStatus(String token,String taskId,String status);
  Future<BaseResponse<BaseData>> createTask(String token,CreateTaskReq createTaskReq);

}