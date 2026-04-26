import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/shared/data/dto/response/message_response.dart';

import '../../../../../shared/data/dto/response/data_response.dart';
import '../../../../../shared/data/source/remote/network/network_service.dart';
import '../../dto/req/forgot_pass/forgot_password_request.dart';
import '../../dto/res/forgot_pass/verify.dart';

part 'forgot_password_api.g.dart';

final forgotPasswordApiProvider = Provider<ForgotPasswordApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return ForgotPasswordApi(dio);
});

@RestApi()
sealed class ForgotPasswordApi {
  factory ForgotPasswordApi(Dio dio) => _ForgotPasswordApi(dio);

  @POST('auth/forgot-password')
  @Extra({'refresh': false})
  Future<MessageResponse> forgotPassword(@Body() ForgotPassRequest data);

  @POST('auth/forgot-password/verify')
  @Extra({'refresh': false})
  Future<DataResponse<ForgotPassData>> forgotPasswordVerify(
    @Body() ForgotPassRequest data,
  );

  @POST('auth/forgot-password/resend')
  @Extra({'refresh': false})
  Future<MessageResponse> forgotPasswordResend(@Body() ForgotPassRequest data);

  @PUT('auth/forgot-password/reset')
  @Extra({'refresh': false})
  Future<MessageResponse> forgotPasswordReset(@Body() ForgotPassRequest data);
}
