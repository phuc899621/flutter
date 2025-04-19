import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/forgot_password/data/dtos/response/forgot_pass_verify_res.dart';
import 'package:taskit/shared/dto/base_response_data.dart';

import '../../../../../shared/data/remote/network_service.dart';
import '../../../../../shared/dto/base_response.dart';

import '../../dtos/request/forgot_pass/forgot_pass_req.dart';
import '../../dtos/request/forgot_pass_verify/forgot_pass_verify_req.dart';
import '../../dtos/request/reset_pass/reset_pass_req.dart';
part 'forgot_pass_api.g.dart';

final forgotPassApiProvider=Provider<ForgotPassApi>((ref){
  final dio=ref.watch(networkServiceProvider);
  return ForgotPassApi(dio);
});

@RestApi()
abstract class ForgotPassApi{
  factory ForgotPassApi(Dio dio) => _ForgotPassApi(dio);
  @POST('/user/auth/forgot-password')
  Future<BaseResponse<BaseData>> forgotPass(@Body() ForgotPassRequest data);
  @POST('/user/auth/forgot-password/verify')
  Future<BaseResponse<ForgotPassVerifyData>> verify(@Body() ForgotPassVerifyRequest data);
  @POST('/user/auth/forgot-password/reset')
  Future<BaseResponse<BaseData>> reset(@Body() ResetPassRequest data,
      @Header('Reset-Token') String token);
}