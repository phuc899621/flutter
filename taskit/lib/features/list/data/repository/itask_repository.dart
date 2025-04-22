


import 'package:taskit/shared/dto/base_response_data.dart';

import '../../../../shared/dto/base_response.dart';
import '../../../../shared/dto/response/task/task_data.dart';

import '../../../../shared/dto/response/task/task_data.dart';
import '../dto/request/status.dart';

abstract interface class ITaskRepository{
  Future<BaseResponse<TaskDataLst>> getListTask(String token,String status,String dueDate);
  Future<BaseResponse<BaseData>> updateTaskStatus(String token,String taskId,String status);

}