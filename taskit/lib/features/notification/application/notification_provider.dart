import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/notification/domain/usecases/request_fcm_permission_usecase.dart';
import 'package:taskit/features/notification/domain/usecases/update_device_usecase.dart';
import 'package:taskit/shared/domain/usecase/future_usecase.dart';
import 'package:taskit/shared/extension/result_return.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../domain/usecases/get_fcm_token_usecase.dart';
import '../domain/usecases/listen_fcm_token_usecase.dart';
import '../domain/usecases/register_device_usecase.dart';

final notificationProvider = AsyncNotifierProvider<NotificationProvider, void>(
  NotificationProvider.new,
);

class NotificationProvider extends AsyncNotifier<void> {
  StreamSubscription<String>? _subscription;

  Future<void> initialize() async {
    final listenTokenRefreshUseCase = ref.read(listenFcmTokenUsecaseProvider);
    final getFcmTokenUseCase = ref.read(getFcmTokenUseCaseProvider);
    final updateDeviceUsecase = ref.read(updateDeviceUseCaseProvider);
    final registerDeviceUsecase = ref.read(registerDeviceUseCaseProvider);
    final requestFcmPermissionUseCase = ref.read(requestFcmPermissionUsecase);
    final permission = (await requestFcmPermissionUseCase.call(
      NoParam(),
    )).dataOrNull();
    if (permission == null || !permission) {
      logger.e('[Notification Provider] Permission denied');
      return;
    }
    final token = (await getFcmTokenUseCase(NoParam())).dataOrNull();
    if (token != null) {
      await registerDeviceUsecase.call(token);
    } else {
      logger.e('[NotificationProvider] Fcm Token is null');
    }
    _subscription?.cancel();
    _subscription = listenTokenRefreshUseCase
        .call(NoParam())
        .listen(
          (token) async {
            await updateDeviceUsecase.call(token);
          },
          onError: (e) {
            logger.e('[Notification Provider] Error: $e');
          },
        );
  }

  @override
  FutureOr<void> build() {
    ref.onDispose(() => disposeNotification());
    return null;
  }

  Future<void> disposeNotification() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}
