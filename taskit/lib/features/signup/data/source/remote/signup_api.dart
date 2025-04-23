
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:taskit/features/signup/data/dto/request/signup_verify_req/signup_verify_request.dart';
import '../../../../../shared/data/dto/base_response.dart';
import '../../../../../shared/data/source/remote/network/network_service.dart';
import '../../dto/request/signup_req/signup_request.dart';
import '../../dto/response/signup_res/signup_data.dart';

part 'signup_api.g.dart';

final signUpApiProvider = Provider.autoDispose<SignUpApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return SignUpApi(dio);
});

@RestApi()
abstract class SignUpApi {
  factory SignUpApi(Dio dio) => _SignUpApi(dio);

  @POST('/user/auth/signup')
  Future<BaseResponse<SignupData>> signup(@Body() SignupRequest data);
  @POST('/user/auth/signup-verify')
  Future<BaseResponse<SignupData>> verify(@Body() SignupVerifyRequest data);

}