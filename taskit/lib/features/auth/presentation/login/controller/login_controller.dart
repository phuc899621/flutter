import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/domain/entities/login/login_entity.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/auth/presentation/login/state/login_state.dart';

import '../../../../../shared/constants/login_status.dart';
import '../../../../../shared/log/logger_provider.dart'; // Đảm bảo bạn có logger
import '../../../application/auth_service_impl.dart';

final loginControllerProvider =
    NotifierProvider.autoDispose<LoginController, LoginState>(
      LoginController.new,
    );

class LoginController extends Notifier<LoginState> {
  @override
  LoginState build() {
    return LoginState();
  }

  Future<void> loginWithGoogle() async {
    try {
      state = state.copyWith(apiError: null, status: LoginStatus.googleLoading);
      final authService = ref.read(authServiceProvider);
      final result = await authService.loginWithGoogle();
      final authController = ref.read(authControllerProvider.notifier);
      logger.w('Login with google flow started');
      result.when(
        (_) async {
          await authController.fetchUser();
          state = state.copyWith(status: LoginStatus.success);
        },
        (failure) {
          logger.e('Login failed: ${failure.message}');
          state = state.copyWith(
            apiError: failure.message,
            status: LoginStatus.initial,
          );
        },
      );
    } catch (e) {
      logger.e('Unexpected error during login with google: $e');
      state = state.copyWith(
        apiError: e.toString(),
        status: LoginStatus.initial,
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(
        apiError: null,
        status: LoginStatus.loading,
        email: email,
        password: password,
      );

      final form = CredentialsLoginEntity(
        email: state.email,
        password: state.password,
      );
      final result = await ref.read(authServiceProvider).login(form);
      logger.w('🚀 Login flow started');
      await result.when(
        (success) async {
          // LOG KIỂM TRA
          logger.w('🚀 Login success, fetching user data...');
          logger.w('Status is ${ref.read(authControllerProvider).status}');
          // Cập nhật AuthController TRƯỚC
          // Việc await ở đây cực kỳ quan trọng để đảm bảo AuthState chuyển sang Authenticated
          await ref.read(authControllerProvider.notifier).fetchUser();
          logger.w(
            '🚀 User data fetched successfully ${ref.read(authControllerProvider).status}',
          );
          // Sau khi AuthController đã đổi state xong, mới báo Login success
          state = state.copyWith(status: LoginStatus.success);

          logger.i('✅ Login flow completed');
        },
        (failure) {
          logger.e('❌ Login failed: ${failure.message}');
          state = state.copyWith(
            apiError: failure.message,
            status: LoginStatus.initial,
          );
        },
      );
    } catch (e) {
      logger.e('💥 Unexpected error during login: $e');
      state = state.copyWith(
        apiError: e.toString(),
        status: LoginStatus.initial,
      );
    }
  }
}
