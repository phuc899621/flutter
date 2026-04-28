import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../constants/network_status.dart';
import '../log/logger_provider.dart';

final internetCheckerProvider = Provider((ref) => InternetConnection());
final networkStatusProvider = StreamProvider<NetworkStatus>((ref) {
  final checker = ref.watch(internetCheckerProvider);
  return checker.onStatusChange.map((status) {
    if (status == InternetStatus.connected) {
      logger.i("[Network]: Online");
      return NetworkStatus.online;
    } else {
      logger.w("[Network]: Offline");
      return NetworkStatus.offline;
    }
  });
});
