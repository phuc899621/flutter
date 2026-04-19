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
    logger.w('🚀 AuthController: init called');
    if (state.status == AuthStatus.authenticated) return;
    logger.w('🚀 AuthController: init check token called');
    final token = await ref.read(tokenServiceProvider).getAccessToken();
    logger.w('🚀 AuthController: init token: $token');
    if (token == null) {
      state = state.copyWith(status: AuthStatus.unauthenticated);
      logger.w('🚀 AuthController: init token is null');
      return;
    }
    logger.w('🚀 AuthController: init token is not null');
    final result = await ref.read(authServiceProvider).fetchUserLocal();
    logger.w('🚀 AuthController: init fetchUserLocal result: $result');
    UserEntity? localUser;
    result.when((success) => localUser = success, (failure) {});
    logger.w('🚀 AuthController: init localUser: $localUser');
    if (localUser != null) {
      logger.w('🚀 AuthController: init localUser is not null');
      state = state.copyWith(status: AuthStatus.authenticated, user: localUser);
      fetchUser();
    } else {
      logger.w('🚀 AuthController: init localUser is null');
      state = state.copyWith(status: AuthStatus.unauthenticated);
      fetchUser();
    }
  }

  Future<void> fetchUser() async {
    logger.i('🚀 AuthController: fetchUser called');
    final result = await ref.read(authServiceProvider).fetchUser();
    logger.i('🚀 AuthController: fetchUser result: $result');
    result.when(
      (user) {
        state = state.copyWith(status: AuthStatus.authenticated, user: user);
        logger.w(
          '🚀 AuthController: fetchUser success. User: ${user.name} and status is ${state.status}',
        );
      },
      (failure) {
        if (state.status == AuthStatus.initial) {
          state = state.copyWith(status: AuthStatus.unauthenticated);
          logger.w('initial');
        }
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
    logger.i('🚀 AuthController: logout called');
    //await ref.read(authServiceProvider).logout();
    //state = state.copyWith(status: AuthStatus.unauthenticated, user: null);
    state = state.copyWith(status: AuthStatus.unauthenticated);
  }
}
