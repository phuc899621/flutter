import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/shared/data/source/remote/network/network_service.dart';

import '../../../../../shared/data/dto/response/base_response.dart';
import '../../dto/req/ai/ai_req.dart';
import '../../dto/res/ai/ai_generate_task_data.dart';
import '../../dto/res/ai/ai_question_data.dart';

part 'ai_api.g.dart';

final aiApiProvider = Provider.autoDispose<AiApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return AiApi(dio);
});

@RestApi()
abstract class AiApi {
  factory AiApi(Dio dio) => _AiApi(dio);

  @GET('/ai/task')
  Future<BaseResponse<AiGenerateTaskData>> generate(
    @Header('Authorization') String token,
    @Body() AiReq aiReq,
  );

  @GET('/ai/question')
  Future<BaseResponse<AiQuestionData>> getAnswer(
    @Header('Authorization') String token,
    @Body() AiReq aiReq,
  );
}
