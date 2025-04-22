import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/shared/dto/response/task/task_data.dart';

import '../../../../shared/dto/base_response.dart';

part 'list_api.g.dart';


@RestApi()
abstract class TaskApi{
  factory ListApi(Dio dio)=>_ListApi(dio);
  @GET('/task')
  Future<BaseResponse<TaskDataLst>> get(
      @Header('Authorization') String token,
      @Query('status') String status,
      @Query('dueDate') String category,
      );

}