import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/notification/data/repo/firebase_messaging_repo_impl.dart';
import 'package:taskit/features/notification/data/source/firebase_messaging_source.dart';

import '../../../../shared/device/device_service.dart';
import '../source/device_api.dart';

abstract class FirebaseMessagingRepo {
  Stream<String> onTokenRefresh();

  Future<String?> getToken();

  Future<bool> requestPermission();

  Future<void> registerDevice(String token);

  Future<void> updateDevice(String token);

  Future<void> removeDevice();
}

final firebaseMessagingRepoProvider = Provider<FirebaseMessagingRepo>(
  (ref) => FirebaseMessagingRepoImpl(
    ref.watch(firebaseMessagingDataSourceProvider),
    ref.watch(deviceServiceProvider),
    ref.watch(notificationApiProvider),
  ),
);
