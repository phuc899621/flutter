import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/task/data/dto/sync/request/deleted_tasks_sync_request.dart';
import 'package:taskit/features/task/data/dto/sync/request/tasks_sync_request.dart';
import 'package:taskit/features/task/data/dto/sync/response/deleted_tasks_sync_res.dart';
import 'package:taskit/features/task/data/dto/sync/response/tasks_sync_res.dart';
import 'package:taskit/features/task/data/dto/task/request/add_task_req.dart';
import 'package:taskit/features/task/data/dto/task/request/update_task_req.dart';
import 'package:taskit/features/task/data/dto/task/response/update_task_res.dart';
import 'package:taskit/shared/data/source/remote/network/network_service.dart';

import '../../../../../shared/data/dto/response/base_data.dart';
import '../../../../../shared/data/dto/response/data_response.dart';
import '../../dto/req/ai_category/ai_category.dart';
import '../../dto/task/response/task_res.dart';

part 'task_api.g.dart';

final taskApiProvider = Provider.autoDispose<TaskApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return TaskApi(dio);
});

@RestApi()
abstract class TaskApi {
  factory TaskApi(Dio dio) => _TaskApi(dio);

  @GET('/ai/category')
  Future<DataResponse<List<String>>> getAiCategory(
    @Header('Authorization') String token,
    @Body() AiCategoryReq categoryReq,
  );

  @POST('/tasks')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<TaskRes>> createTask(@Body() AddTaskReq addTaskReq);

  @PUT('/tasks/{id}')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<UpdateTaskRes>> updateTask(
    @Path('id') String taskId,
    @Body() UpdateTaskReq updateTaskReq,
  );

  @DELETE('/tasks/{id}')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<BaseData>> deleteTask(@Path('id') String taskId);

  @POST('/tasks/sync')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<TasksSyncRes>> syncTasks(@Body() TasksSyncReq tasks);

  @DELETE('/tasks/sync')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<List<DeletedTasksSyncRes>>> syncDeletedTasks(
    @Body() DeletedTasksSyncReq tasks,
  );

  @GET('/tasks/pull')
  @Extra({'requireAuth': true})
  Future<DataResponse<List<TaskRes>>> pullTasks(
    @Query('lastSyncTime') String? lastSyncTime,
  );
}
