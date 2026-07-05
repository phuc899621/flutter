import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../data/source/local/storage_provider.dart';
import '../extension/string_hardcoded.dart';

final deviceStorageProvider = Provider<DeviceStorge>((ref) {
  final storage = ref.read(localStorageProvider).requireValue;
  return DeviceStorge(storage);
});

class DeviceStorge {
  final SharedPreferences _storage;
  static final String _deviceId = 'DEVICE_ID'.hardcoded;

  DeviceStorge(this._storage);

  String getDeviceId() {
    final deviceId = _storage.getString(_deviceId);
    if (deviceId != null) {
      return deviceId;
    }
    final newId = const Uuid().v4();
    _storage.setString(_deviceId, newId);
    return newId;
  }
}
