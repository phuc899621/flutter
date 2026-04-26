import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/shared/data/dto/response/message_response.dart';

import '../../../../../shared/data/source/remote/network/network_service.dart';
import '../../dto/req/signup/signup_request.dart';

part 'signup_api.g.dart';

final signupApiProvider = Provider<SignupApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return SignupApi(dio);
});

@RestApi()
sealed class SignupApi {
  factory SignupApi(Dio dio) => _SignupApi(dio);

  @POST('auth/signup')
  @Extra({'refresh': false})
  Future<MessageResponse> signup(@Body() SignupRequest data);

  @POST('auth/signup/verify')
  @Extra({'refresh': false})
  Future<MessageResponse> signupVerify(@Body() SignupRequest data);

  @POST('auth/signup/resend')
  @Extra({'refresh': false})
  Future<MessageResponse> signupResend(@Body() SignupRequest data);
}
