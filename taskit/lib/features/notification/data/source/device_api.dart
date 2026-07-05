import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:taskit/shared/data/dto/response/message_response.dart';

import '../../../../../shared/data/source/remote/network/network_service.dart';
import '../dto/device_request.dart';

part 'device_api.g.dart';

final notificationApiProvider = Provider<DeviceApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return DeviceApi(dio);
});

@RestApi()
sealed class DeviceApi {
  factory DeviceApi(Dio dio) => _DeviceApi(dio);

  @POST('/devices')
  @Extra({'refresh': true, 'requireAuth': true})
  Future<MessageResponse> registerDevice(@Body() DeviceRequest data);

  @PUT('/devices')
  @Extra({'refresh': true, 'requireAuth': true})
  Future<MessageResponse> updateFcmToken(@Body() DeviceRequest data);

  @DELETE('/devices')
  @Extra({'refresh': true, 'requireAuth': true})
  Future<MessageResponse> removeDevice(@Body() DeviceRequest data);
}
