import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
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
}
