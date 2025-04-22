


import '../../../../shared/dto/base_response.dart';
import '../../../../shared/dto/response/task/task_data.dart';

import '../../../../shared/dto/response/task/task_data.dart';

abstract interface class ITaskRepository{
  Future<BaseResponse<TaskDataLst>> getListTask(String token,String status,String dueDate);
}