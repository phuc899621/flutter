import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/auth/data/dto/req/logout/logout_request.dart';
import 'package:taskit/features/auth/data/dto/req/refresh_token/refresh_token_request.dart';
import 'package:taskit/features/auth/data/dto/res/login/refresh_token_data.dart';
import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';
import 'package:taskit/shared/data/dto/response/message_response.dart';

import '../../../../../shared/config/app/app_config.dart';
import '../../../../../shared/data/dto/response/data_response.dart';
import '../../../../../shared/data/source/remote/network/network_service.dart';
import '../../dto/req/forgot_pass/forgot_password_request.dart';
import '../../dto/req/login/login_request.dart';
import '../../dto/req/signup/signup_request.dart';
import '../../dto/res/forgot_pass/verify.dart';
import '../../dto/res/login/login_data.dart';

part 'auth_api.g.dart';

final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return AuthApi(dio);
});
final authRefreshApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(basicDioProvider);
  return AuthApi(dio);
});

@RestApi(baseUrl: AppConfigs.auth)
sealed class AuthApi {
  factory AuthApi(Dio dio) => _AuthApi(dio);

  @POST('/login')
  @Extra({'refresh': false})
  Future<DataResponse<LoginData>> login(@Body() LoginRequest data);

  @POST('/login/google')
  @Extra({'refresh': false})
  Future<DataResponse<LoginData>> loginWithGoogle(@Body() LoginRequest data);

  @POST('/refresh')
  @Extra({'refresh': false})
  Future<DataResponse<RefreshTokenData>> refreshToken(
    @Body() RefreshTokenRequest request,
  );

  @POST('/logout')
  @Extra({'requireAuth': true})
  Future<MessageResponse> logout(@Body() LogoutRequest request);
}
