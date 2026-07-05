import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/domain/usecases/auth/logout_usecase.dart';
import 'package:taskit/features/notification/application/notification_provider.dart';
import 'package:taskit/features/notification/domain/usecases/delete_device_usecase.dart';
import 'package:taskit/features/notification/domain/usecases/get_fcm_token_usecase.dart';
import 'package:taskit/features/task/application/task_sync_service.dart';
import 'package:taskit/features/user/domain/params/reconcile_user_param.dart';
import 'package:taskit/features/user/domain/usecase/get_previous_user_usecase.dart';
import 'package:taskit/features/user/domain/usecase/reconcile_user_sync_usecase.dart';
import 'package:taskit/features/user/domain/usecase/sync_user_usecase.dart';
import 'package:taskit/shared/application/session_service.dart';
import 'package:taskit/shared/extension/result_return.dart';

import '../../../../../shared/application/network_status_provider.dart';
import '../../../../../shared/constants/auth_status.dart';
import '../../../../../shared/constants/network_status.dart';
import '../../../../../shared/data/source/remote/socket/socket_service.dart';
import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/log/logger_provider.dart';
import '../../../../category/application/category_sync_service.dart';
import '../../../../user/domain/entity/user_entity.dart';
import '../../../domain/usecases/auth/check_auth_state_use_case.dart';
import '../state/auth_state.dart';

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() {
    logger.i('[AuthController] build');
    ref.listen(networkStatusProvider, (previous, next) {
      if (next.value == NetworkStatus.offline) {
        logger.w('[AuthController] Offline');
      } else if (next.value == NetworkStatus.online) {
        logger.i('[AuthController] Online');
      }
      final wasOffline = previous?.value == NetworkStatus.offline;
      final isOnline = next.value == NetworkStatus.online;
      final user = state.user;
      if (wasOffline && isOnline && user != null) {
        ref.read(socketServiceProvider).connect();
        _triggerInitialSync(user.localId);
      }
    });
    Future.microtask(() => init());
    return const AuthState(status: AuthStatus.initial);
  }

  void _onAuthenticated(UserEntity user) {
    logger.i('[AuthController] Handling authenticated side-effects');
    ref.read(categorySyncServiceProvider).init();
    ref.read(taskSyncServiceProvider).init();
    ref.read(socketServiceProvider).connect();
    _triggerInitialSync(user.localId);
    ref.read(notificationProvider.notifier).initialize();
  }

  Future<void> init() async {
    logger.i('[AuthController] init');
    if (state.status == AuthStatus.authenticated) {
      logger.d('[AuthController] User is already authenticated, skipping...');
      return;
    }
    final result = await ref
        .read(checkAuthStateUseCaseProvider)
        .call(NoParam());
    result.when(
      (user) async {
        if (user != null) {
          logger.d('[AuthController] Persisting user found $user');
          state = state.copyWith(status: AuthStatus.authenticated, user: user);
          logger.d(
            '[AuthController] Pulling categories for user ${user.localId}...',
          );
          _onAuthenticated(user);
        } else if (state.status == AuthStatus.initial) {
          logger.d(
            '[AuthController] User not found, setting unauthenticated...',
          );
          state = state.copyWith(status: AuthStatus.unauthenticated);
        }
      },
      (failure) {
        logger.e('[AuthController] fetchUser failed: ${failure.message}');
        if (state.status == AuthStatus.initial) {
          state = state.copyWith(status: AuthStatus.unauthenticated);
        }
      },
    );
  }

  void onSessionExpired() {
    logger.w(
      '[AuthController] Session expired - User needs to re-authenticate',
    );
    state = state.copyWith(status: AuthStatus.sessionExpired);
  }

  Future<void> fetchUser() async {
    logger.i('[AuthController] fetchUser');
    final oldUser =
        (await ref.read(getPreviousUserUseCaseProvider).call(NoParam()))
            .dataOrNull();
    final result = await ref.read(syncUserUseCaseProvider).call(NoParam());
    await result.when(
      (user) async {
        await ref
            .read(reconcileUserSyncUseCaseProvider)
            .call(ReconcileUserParam(newUser: user, oldUser: oldUser));
        (await ref.read(getFcmTokenUseCaseProvider).call(NoParam()));
        ref.read(notificationProvider.notifier).initialize();
        logger.d('[AuthController] fetchUser: user fetched successfully');
        state = state.copyWith(status: AuthStatus.authenticated, user: user);
        _onAuthenticated(user);
        return;
      },
      (failure) async {
        if (state.status != AuthStatus.initial) return;
        logger.d('[AuthController] fetchUser: user is not authenticated');
        state = state.copyWith(status: AuthStatus.unauthenticated);
      },
    );
  }

  Future<void> logout() async {
    logger.i('[AuthController] logout');
    try {
      await ref.read(removeDeviceUseCaseProvider).call(NoParam());
      await ref.read(logoutUseCaseProvider).call(NoParam());
      await ref.read(notificationProvider.notifier).disposeNotification();
      ref.read(socketServiceProvider).disconnect();
    } catch (e) {
      logger.i('[AuthController] logout failed');
      return;
    } finally {
      logger.i('[AuthController] logout: user is not authenticated');
      state = state.copyWith(status: AuthStatus.unauthenticated, user: null);
    }
  }

  Future<void> _triggerInitialSync(int userLocalId) async {
    await ref.read(categorySyncServiceProvider).syncAll(userLocalId);
    await ref.read(taskSyncServiceProvider).syncAll(userLocalId);
    await ref
        .read(sessionServiceProvider)
        .saveLastSyncTime(DateTime.now().toUtc().toIso8601String());
  }
}
