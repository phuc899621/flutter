import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/shared/data/source/remote/network/network_service.dart';

import '../../../../../shared/data/dto/response/base_response.dart';
import '../../../../../shared/data/dto/response/base_response_data.dart';
import '../../dto/req/create_task/create_task.dart';
import '../../dto/req/suggest_category/suggest_category.dart';
import '../../dto/res/category/category_data.dart';
import '../../dto/res/task/task_data.dart';

part 'task_api.g.dart';

final taskApiProvider = Provider.autoDispose<TaskApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return TaskApi(dio);
});

@RestApi()
abstract class TaskApi {
  factory TaskApi(Dio dio) => _TaskApi(dio);

  @GET('/task')
  Future<BaseResponse<List<TaskData>>> getListTask(
    @Header('Authorization') String token,
    @Query('status') String status,
    @Query('dueDate') String dueDate,
  );
  @PUT('/task/update/{taskId}')
  Future<BaseResponse<BaseData>> updateTaskStatus(
    @Header('Authorization') String token,
    @Path('taskId') String taskId,
    @Body() Map<String, dynamic> updateStatusReq,
  );
  @POST('/task/add')
  Future<BaseResponse<BaseData>> addTask(
    @Header('Authorization') String token,
    @Body() CreateTaskReq createTaskReq,
  );
  @GET('/ai/category')
  Future<BaseResponse<CategoryData>> suggestCategory(
    @Header('Authorization') String token,
    @Body() SuggestCategoryReq suggestCategoryReq,
  );
}
