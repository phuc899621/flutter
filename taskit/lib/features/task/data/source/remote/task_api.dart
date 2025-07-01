import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/task/data/dto/req/add_task/add_task.dart';
import 'package:taskit/features/task/data/dto/req/update_task/update_task_req.dart';
import 'package:taskit/features/task/data/dto/res/task/add_task_data.dart';
import 'package:taskit/features/task/data/dto/res/task/update_task_data.dart';
import 'package:taskit/shared/data/dto/response/base_response_data.dart';
import 'package:taskit/shared/data/source/remote/network/network_service.dart';

import '../../../../../shared/data/dto/response/base_response.dart';
import '../../dto/req/ai_category/ai_category.dart';

part 'task_api.g.dart';

final taskApiProvider = Provider.autoDispose<TaskApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return TaskApi(dio);
});

@RestApi()
abstract class TaskApi {
  factory TaskApi(Dio dio) => _TaskApi(dio);

  @GET('/ai/category')
  Future<BaseResponse<List<String>>> getAiCategory(
    @Header('Authorization') String token,
    @Body() AiCategoryReq categoryReq,
  );

  @POST('/task')
  Future<BaseResponse<AddTaskData>> createTask(
    @Header('Authorization') String token,
    @Body() AddTaskReq addTaskReq,
  );

  @PATCH('/task/{id}')
  Future<BaseResponse<UpdateTaskData>> updateTask(
    @Header('Authorization') String token,
    @Path('id') String taskId,
    @Body() UpdateTaskReq updateTaskReq,
  );

  @DELETE('/task/{id}')
  Future<BaseResponse<BaseData>> deleteTask(
    @Header('Authorization') String token,
    @Path('id') String taskId,
  );
}
