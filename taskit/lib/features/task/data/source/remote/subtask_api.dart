import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/task/data/dto/req/subtask/add_subtask.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask.dart';
import 'package:taskit/features/task/data/dto/req/subtask/update_subtask_list_req.dart';
import 'package:taskit/features/task/data/dto/res/subtask/add_subtask_data.dart';
import 'package:taskit/features/task/data/dto/res/subtask/update_subtask_data.dart';
import 'package:taskit/shared/data/source/remote/network/network_service.dart';

import '../../../../../shared/data/dto/response/base_response.dart';
import '../../../../../shared/data/dto/response/base_response_data.dart';

part 'subtask_api.g.dart';

final subtaskApiProvider = Provider.autoDispose<SubtaskApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return SubtaskApi(dio);
});

@RestApi()
abstract class SubtaskApi {
  factory SubtaskApi(Dio dio) => _SubtaskApi(dio);

  @PUT('/subtask')
  Future<BaseResponse<UpdateSubtaskData>> update(
    @Header('Authorization') String token,
    @Body() UpdateSubtaskListReq updateList,
  );

  @PUT('/task/{taskId}/subtask')
  Future<BaseResponse<List<AddSubtaskData>>> add(
    @Header('Authorization') String token,
    @Path('taskId') String taskId,
    @Body() List<AddSubtaskReq> addList,
  );

  @DELETE('/subtask/{id}')
  Future<BaseResponse<BaseData>> delete(
    @Header('Authorization') String token,
    @Path('id') String subtaskId,
  );
}
