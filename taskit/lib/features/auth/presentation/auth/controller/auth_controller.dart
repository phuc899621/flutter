import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/application/auth_service_impl.dart';

import '../../../../../shared/application/token_service_impl.dart';
import '../../../../../shared/constants/auth_status.dart';
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
    final refreshToken = await ref.read(tokenServiceProvider).getRefreshToken();
    if (refreshToken == null) {
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return;
    }
    final localResult = await ref.read(authServiceProvider).fetchUserLocal();
    UserEntity? localUser;
    localResult.when((u) => localUser = u, (f) {});

    if (localUser != null) {
      state = state.copyWith(status: AuthStatus.authenticated, user: localUser);
      fetchUser();
    } else {
      await fetchUser();
    }
  }

  Future<void> fetchUser() async {
    final result = await ref.read(authServiceProvider).fetchUser();
    await result.when(
      (user) {
        state = state.copyWith(status: AuthStatus.authenticated, user: user);
        return;
      },
      (failure) async {
        if (state.status != AuthStatus.initial) return;
        state = state.copyWith(status: AuthStatus.unauthenticated);
      },
    );
  }

  void onUserLoggedIn(UserEntity user) {
    state = state.copyWith(status: AuthStatus.authenticated, user: user);
  }

  Future<void> logout() async {
    try {
      await ref.read(authServiceProvider).logout();
    } catch (e) {
      return;
    } finally {
      state = state.copyWith(status: AuthStatus.unauthenticated, user: null);
    }
  }
}
