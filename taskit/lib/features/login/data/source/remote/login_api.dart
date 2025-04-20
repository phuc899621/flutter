import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/login/data/dto/request/login_request.dart';
import 'package:taskit/features/login/data/dto/response/login_verify_data.dart';

import '../../../../../shared/data/remote/network_service.dart';
import '../../../../../shared/dto/base_response.dart';
import '../../dto/response/login_data.dart';

part 'login_api.g.dart';

final loginApiProvider = Provider.autoDispose<LoginApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return LoginApi(dio);
});

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio) => _LoginApi(dio);

  @POST('/user/auth/login')
  Future<BaseResponse<LoginData>> login(@Body() LoginRequest data);
  @GET('/user/auth/login/verify')
  Future<BaseResponse<LoginVerifyData>> verify(@Header('Authorization') String token);

}