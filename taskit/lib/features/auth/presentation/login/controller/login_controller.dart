import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/domain/usecases/auth/login_usecase.dart';
import 'package:taskit/features/auth/domain/usecases/auth/login_with_google_usecase.dart';
import 'package:taskit/features/auth/domain/usecases/params/login_params.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/auth/presentation/login/state/login_state.dart';
import 'package:taskit/shared/application/network_status_provider.dart';

import '../../../../../shared/constants/login_status.dart';
import '../../../../../shared/constants/network_status.dart';
import '../../../../../shared/domain/usecase/future_usecase.dart';
import '../../../../../shared/log/logger_provider.dart';

final loginControllerProvider =
    NotifierProvider.autoDispose<LoginController, LoginState>(
      LoginController.new,
    );

class LoginController extends Notifier<LoginState> {
  @override
  LoginState build() {
    return LoginState();
  }

  bool checkConnection() {
    final networkStatus = ref.read(networkStatusProvider).value;
    if (networkStatus == NetworkStatus.offline) {
      state = state.copyWith(
        status: LoginStatus.initial,
        apiError: 'Please check your internet connection',
      );
      return false;
    }
    return true;
  }

  Future<void> loginWithGoogle() async {
    try {
      if (!checkConnection()) {
        logger.e(
          '[LoginController] No internet connection, login with Google aborted',
        );
        return;
      }
      state = state.copyWith(apiError: null, status: LoginStatus.googleLoading);
      final result = await ref
          .read(loginWithGoogleUseCaseProvider)
          .call(NoParam());
      final authController = ref.read(authControllerProvider.notifier);
      result.when(
        (_) async {
          logger.d('[LoginController] Login with Google successful');
          await authController.fetchUser();
          state = state.copyWith(status: LoginStatus.success);
        },
        (failure) {
          logger.e(
            '[LoginController] Login with Google failed: ${failure.message}',
          );
          state = state.copyWith(
            apiError: failure.message,
            status: LoginStatus.initial,
          );
        },
      );
    } catch (e) {
      logger.e('[LoginController] Login with Google failed: ${e.toString()}');
      state = state.copyWith(
        apiError: e.toString(),
        status: LoginStatus.initial,
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      if (!checkConnection()) {
        logger.e('[LoginController] No internet connection, login aborted');
        return;
      }
      state = state.copyWith(
        apiError: null,
        status: LoginStatus.loading,
        email: email,
        password: password,
      );

      final form = CredentialsLoginParams(
        email: state.email,
        password: state.password,
      );
      final result = await ref.read(loginUseCaseProvider).call(form);
      await result.when(
        (success) async {
          logger.d('[LoginController] Login successful');
          await ref.read(authControllerProvider.notifier).fetchUser();
          state = state.copyWith(status: LoginStatus.success);
        },
        (failure) {
          logger.e('[LoginController] Login failed: ${failure.message}');
          state = state.copyWith(
            apiError: failure.message,
            status: LoginStatus.initial,
          );
        },
      );
    } catch (e) {
      logger.e('[LoginController] Login failed: ${e.toString()}');
      state = state.copyWith(
        apiError: e.toString(),
        status: LoginStatus.initial,
      );
    }
  }
}
