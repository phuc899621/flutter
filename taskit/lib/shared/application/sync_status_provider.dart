import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/constants/auth_status.dart';
import 'package:taskit/shared/constants/network_status.dart';

import '../../features/auth/presentation/auth/controller/auth_controller.dart';
import 'network_status_provider.dart';

enum SyncStatus { ready, offline, unauthenticated }

final syncStatusProvider = Provider<SyncStatus>((ref) {
  final authState = ref.watch(authControllerProvider);
  final networkState = ref.watch(networkStatusProvider).value;

  if (authState.status != AuthStatus.authenticated) {
    return SyncStatus.unauthenticated;
  }

  return networkState == NetworkStatus.offline
      ? SyncStatus.offline
      : SyncStatus.ready;
});
