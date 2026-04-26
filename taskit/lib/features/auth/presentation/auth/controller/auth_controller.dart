import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/domain/usecases/auth/logout_usecase.dart';
import 'package:taskit/features/user/domain/usecase/get_current_user_usecase.dart';
import 'package:taskit/features/user/domain/usecase/sync_user_usecase.dart';

import '../../../../../shared/application/token_service_impl.dart';
import '../../../../../shared/constants/auth_status.dart';
import '../../../../../shared/domain/usecase/usecase.dart';
import '../../../../../shared/log/logger_provider.dart';
import '../../../../user/domain/entity/user_entity.dart';
import '../state/auth_state.dart';

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() {
    logger.i('[AuthController] build');
    Future.microtask(() => init());
    return const AuthState(status: AuthStatus.initial);
  }

  Future<void> init() async {
    logger.i('[AuthController] init');
    if (state.status == AuthStatus.authenticated) return;
    final refreshToken = await ref.read(tokenServiceProvider).getRefreshToken();
    if (refreshToken == null) {
      logger.i('[AuthController] init: user is not authenticated');
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return;
    }
    final localResult = await ref
        .read(getCurrentUserUseCaseProvider)
        .call(NoParam());
    UserEntity? localUser;
    localResult.when((u) => localUser = u, (f) {});

    if (localUser != null) {
      await ref.read(tokenServiceProvider).saveActiveUserId(localUser!.localId);
      logger.i('[AuthController] init: user is authenticated');
      state = state.copyWith(status: AuthStatus.authenticated, user: localUser);
      fetchUser();
    } else {
      await fetchUser();
    }
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
