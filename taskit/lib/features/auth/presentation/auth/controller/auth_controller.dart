import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/application/auth_service_impl.dart';

import '../../../../../shared/application/token_service_impl.dart';
import '../../../../../shared/constants/auth_status.dart';
import '../../../../../shared/log/logger_provider.dart';
import '../../../../user/domain/entity/user_entity.dart';
import '../state/auth_state.dart';

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() {
    Future.microtask(() => init());
    return const AuthState(status: AuthStatus.initial);
  }

  Future<void> init() async {
    if (state.status == AuthStatus.authenticated) return;
    final token = await ref.read(tokenServiceProvider).getAccessToken();
    if (token == null) {
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return;
    }

    final result = await ref.read(authServiceProvider).fetchUserLocal();
    result.when((success) async {
      if (success != null) {
        state = state.copyWith(status: AuthStatus.authenticated, user: success);
        logger.i(
          '🚀 AuthController: fetchUserLocal success. User: ${success.name} and status is ${state.status}',
        );
      }
    }, (failure) {});
    final fetchResult = await ref.read(authServiceProvider).fetchUser();
    fetchResult.when(
      (success) {
        logger.i('🚀 AuthController: fetchUser success. User: ${success.name}');
        state = state.copyWith(status: AuthStatus.authenticated, user: success);
      },
      (failure) {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      },
    );
  }

  Future<void> fetchUser() async {
    final result = await ref.read(authServiceProvider).fetchUser();

    result.when(
      (user) {
        state = state.copyWith(status: AuthStatus.authenticated, user: user);
        logger.w(
          '🚀 AuthController: fetchUser success. User: ${user.name} and status is ${state.status}',
        );
        logger.i('user: ${user.name}');
      },
      (failure) {
        state = state.copyWith(status: AuthStatus.unauthenticated);
        logger.w(
          '🚀 AuthController: fetchUser failed. Error: ${failure.message} and status is ${state.status}',
        );
      },
    );
  }

  void onUserLoggedIn(UserEntity user) {
    logger.i('🚀 AuthController: onUserLoggedIn called. User: ${user.name}');
    state = state.copyWith(status: AuthStatus.authenticated, user: user);
  }

  Future<void> logout() async {
    await ref.read(authServiceProvider).logout();
    state = state.copyWith(status: AuthStatus.unauthenticated, user: null);
  }
}
