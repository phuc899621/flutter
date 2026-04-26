import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';

import '../../../../../shared/config/app/app_config.dart';
import '../../../../../shared/data/dto/response/data_response.dart';
import '../../../../../shared/data/source/remote/network/network_service.dart';

part 'user_api.g.dart';

final userApiProvider = Provider<UserApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return UserApi(dio);
});
final userRefreshApiProvider = Provider<UserApi>((ref) {
  final dio = ref.watch(basicDioProvider);
  return UserApi(dio);
});

@RestApi(baseUrl: AppConfigs.auth)
sealed class UserApi {
  factory UserApi(Dio dio) => _UserApi(dio);

  @GET('/me')
  @Extra({'requireAuth': true})
  Future<DataResponse<UserData>> syncUser();
}
