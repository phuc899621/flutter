import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/domain/usecases/auth/logout_usecase.dart';
import 'package:taskit/features/user/domain/usecase/sync_user_usecase.dart';

import '../../../../../shared/application/network_status_provider.dart';
import '../../../../../shared/constants/auth_status.dart';
import '../../../../../shared/constants/network_status.dart';
import '../../../../../shared/domain/usecase/usecase.dart';
import '../../../../../shared/log/logger_provider.dart';
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
    });
    Future.microtask(() => init());
    return const AuthState(status: AuthStatus.initial);
  }

  Future<void> init() async {
    logger.i('[AuthController] init');
    if (state.status == AuthStatus.authenticated) return;
    final result = await ref
        .read(checkAuthStateUseCaseProvider)
        .call(NoParam());
    result.when(
      (user) {
        if (user != null) {
          logger.i('[AuthController] fetchUser success');
          state = state.copyWith(status: AuthStatus.authenticated, user: user);
        } else if (state.status == AuthStatus.initial) {
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

  Future<void> fetchUser() async {
    logger.i('[AuthController] fetchUser');
    final result = await ref.read(syncUserUseCaseProvider).call(NoParam());
    await result.when(
      (user) {
        logger.i('[AuthController] fetchUser: user fetched successfully');
        state = state.copyWith(status: AuthStatus.authenticated, user: user);
        return;
      },
      (failure) async {
        if (state.status != AuthStatus.initial) return;
        logger.i('[AuthController] fetchUser: user is not authenticated');
        state = state.copyWith(status: AuthStatus.unauthenticated);
      },
    );
  }

  void onUserLoggedIn(UserEntity user) {
    logger.i('[AuthController] onUserLoggedIn');
    state = state.copyWith(status: AuthStatus.authenticated, user: user);
  }

  Future<void> logout() async {
    logger.i('[AuthController] logout');
    try {
      await ref.read(logoutUseCaseProvider).call(NoParam());
    } catch (e) {
      logger.i('[AuthController] logout failed');
      return;
    } finally {
      logger.i('[AuthController] logout: user is not authenticated');
      state = state.copyWith(status: AuthStatus.unauthenticated, user: null);
    }
  }
}
