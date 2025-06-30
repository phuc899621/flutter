import 'package:taskit/features/task/data/dto/req/update_task/update_task_req.dart';
import 'package:taskit/features/task/data/dto/res/task/add_task_data.dart';
import 'package:taskit/features/task/data/dto/res/task/update_task_data.dart';
import 'package:taskit/shared/data/dto/response/base_response.dart';

import '../../dto/req/add_task/add_task.dart';

abstract interface class ITaskRemoteSource {
  //=======================================
  //============= ADD Task ================
  //========================================
  Future<BaseResponse<AddTaskData>> addTask(String token, AddTaskReq task);

  //=======================================
  //============= Update Task ================
  //========================================
  Future<BaseResponse<UpdateTaskData>> updateTask(
      String token, String taskId, UpdateTaskReq updateTaskReq);
}
