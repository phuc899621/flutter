import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/task/data/dto/subtask/request/add_subtask_req.dart';
import 'package:taskit/features/task/data/dto/subtask/request/update_subtask.dart';
import 'package:taskit/shared/data/source/remote/network/network_service.dart';

import '../../../../../shared/data/dto/response/base_data.dart';
import '../../../../../shared/data/dto/response/data_response.dart';
import '../../dto/subtask/response/subtask_res.dart';

part 'subtask_api.g.dart';

final subtaskApiProvider = Provider.autoDispose<SubtaskApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return SubtaskApi(dio);
});

@RestApi()
abstract class SubtaskApi {
  factory SubtaskApi(Dio dio) => _SubtaskApi(dio);

  @PUT('/tasks/{taskId}/subtasks/{subtaskId}')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<SubtaskRes>> update(
    @Path('taskId') String taskId,
    @Path('subtaskId') String subtaskId,
    @Body() UpdateSubtaskReq update,
  );

  @POST('/tasks/{taskId}/subtasks')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<SubtaskRes>> add(
    @Path('taskId') String taskId,
    @Body() AddSubtaskReq add,
  );

  @DELETE('/tasks/{taskId}/subtasks/{subtaskId}')
  @Extra({'requireAuth': true, 'requireSession': true})
  Future<DataResponse<BaseData>> delete(
    @Path('taskId') String taskId,
    @Path('subtaskId') String subtaskId,
  );
}
