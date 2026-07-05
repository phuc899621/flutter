import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:taskit/features/notification/data/dto/device_request.dart';
import 'package:taskit/features/notification/data/repo/firebase_messaging_repo.dart';
import 'package:taskit/features/notification/data/source/device_api.dart';
import 'package:taskit/shared/data/source/remote/network/dio_exception_mapper.dart';
import 'package:taskit/shared/device/device_service.dart';

import '../source/firebase_messaging_source.dart';

class FirebaseMessagingRepoImpl
    with DioExceptionMapper
    implements FirebaseMessagingRepo {
  final FirebaseMessagingDataSource _dataSource;
  final DeviceApi _api;
  final DeviceService _deviceService;

  FirebaseMessagingRepoImpl(this._dataSource, this._deviceService, this._api);

  @override
  Stream<String> onTokenRefresh() => _dataSource.onTokenRefresh();

  @override
  Future<String?> getToken() => _dataSource.getToken();

  @override
  Future<bool> requestPermission() async {
    final settings = await _dataSource.requestPermission();
    return settings.authorizationStatus != AuthorizationStatus.denied;
  }

  @override
  Future<void> registerDevice(String token) => callSafe(() async {
    final request = DeviceRegisterRequest(
      fcmToken: token,
      deviceId: _deviceService.getDeviceId(),
      platform: _deviceService.getPlatform(),
    );
    await _api.registerDevice(request);
  });

  @override
  Future<void> updateDevice(String token) => callSafe(() async {
    final request = DeviceUpdateRequest(
      fcmToken: token,
      deviceId: _deviceService.getDeviceId(),
      platform: _deviceService.getPlatform(),
    );
    await _api.updateFcmToken(request);
  });

  @override
  Future<void> removeDevice() => callSafe(() async {
    final request = DeviceRemoveRequest(deviceId: _deviceService.getDeviceId());
    await _api.removeDevice(request);
  });
}
