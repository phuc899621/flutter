import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/device/device_storge.dart';

final deviceServiceProvider = Provider<DeviceService>((ref) {
  final storage = ref.read(deviceStorageProvider);
  return DeviceService(storage);
});

class DeviceService {
  final DeviceStorge _storage;

  DeviceService(this._storage);

  String getDeviceId() => _storage.getDeviceId();

  ///Only android and ios
  String getPlatform() => Platform.isAndroid ? 'android' : 'ios';
}
