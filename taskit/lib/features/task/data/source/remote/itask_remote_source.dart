import 'package:taskit/features/task/data/dto/req/category/add_category_req.dart';
import 'package:taskit/features/task/data/dto/req/subtask/add_subtask_list_req.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask_list_req.dart';
import 'package:taskit/features/task/data/dto/req/update_task/update_task_req.dart';
import 'package:taskit/features/task/data/dto/res/ai/ai_generate_task_data.dart';
import 'package:taskit/features/task/data/dto/res/category/add_category_data.dart';
import 'package:taskit/features/task/data/dto/res/subtask/add_subtask_data.dart';
import 'package:taskit/features/task/data/dto/res/subtask/update_subtask_data.dart';
import 'package:taskit/features/task/data/dto/res/task/add_task_data.dart';
import 'package:taskit/features/task/data/dto/res/task/update_task_data.dart';
import 'package:taskit/shared/data/dto/response/data_response.dart';

import '../../../../../shared/data/dto/response/base_data.dart';
import '../../dto/req/add_task/add_task.dart';
import '../../dto/req/ai/ai_req.dart';
import '../../dto/res/ai/ai_question_data.dart';

abstract interface class ITaskRemoteSource {
  //=======================================
  //============= ADD Task ================
  //========================================
  Future<DataResponse<AddTaskData>> addTask(String token, AddTaskReq task);

  Future<DataResponse<List<AddSubtaskData>>> addSubTask(
    String token,
    String taskId,
    AddSubtaskListReq task,
  );

  Future<DataResponse<AddCategoryData>> addCategory(
    String token,
    AddCategoryReq category,
  );

  //=======================================
  //============= Update Task ================
  //========================================
  Future<DataResponse<UpdateTaskData>> updateTask(
    String token,
    String taskId,
    UpdateTaskReq updateTaskReq,
  );

  Future<DataResponse<UpdateSubtaskData>> updateSubtask(
    String token,
    UpdateSubtaskListReq updateList,
  );

  //=======================================
  //============= Delete Task ==============
  //========================================
  Future<DataResponse<BaseData>> deleteTask(String token, String taskId);

  Future<DataResponse<BaseData>> deleteSubTask(String token, String subTaskId);

  Future<DataResponse<BaseData>> deleteCategory(String token, String id);

  //=======================================
  //============= AI  ==============
  //========================================

  Future<DataResponse<AiQuestionData>> getAnswer(String token, AiReq aiReq);

  Future<DataResponse<AiGenerateTaskData>> generateTask(
    String token,
    AiReq aiReq,
  );
}
