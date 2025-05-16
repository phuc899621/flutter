import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../../../shared/data/dto/base_response.dart';
import '../../../../shared/data/source/remote/network/network_service.dart';
import '../../../login/data/dto/request/login_request.dart';
import '../../../login/data/dto/response/login_data.dart';

part 'auth_api.g.dart';

final authApiProvider = Provider.autoDispose<AuthApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return AuthApi(dio);
});

@RestApi()
sealed class AuthApi {
  factory AuthApi(Dio dio) => _AuthApi(dio);
  /*
  * Login
  * */
  @POST('/user/auth/login')
  Future<BaseResponse<LoginData>> login(@Body() LoginRequest data);
}
