
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../shared/data/network/network_service.dart';
import '../../dto/request/signup_request.dart';
import '../../dto/response/signup_response.dart';

part 'signup_api.g.dart';

final signUpApiProvider = Provider.autoDispose<SignUpApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return SignUpApi(dio);
});

@RestApi()
abstract class SignUpApi {
  factory SignUpApi(Dio dio) => _SignUpApi(dio);

  @POST('/user/registration')
  Future<SignupResponse> signUp(@Body() SignupRequest data);
}