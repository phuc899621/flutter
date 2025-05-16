import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/login/state/login_state.dart';
import 'package:taskit/shared/application/token_service.dart';

import '../../../application/auth_service.dart';
import '../../../data/dto/req/login/login_request.dart';

final loginControllerProvider =
    NotifierProvider<LoginController, LoginState>(LoginController.new);

class LoginController extends Notifier<LoginState> {
  @override
  LoginState build() {
    return const LoginState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(
      isPasswordVisibility: !state.isPasswordVisibility,
    );
  }

  Future<void> login() async {
    try {
      //trang thai loading
      state = state.copyWith(
        isLoading: true,
        error: null,
        isLoginSuccess: null,
      );
      final formData = LoginRequest(
        email: state.loginForm['email'],
        password: state.loginForm['password'],
      );
      final result = await ref.read(authServiceProvider).login(formData);
      result.when((success) async {
        state = state.copyWith(
          isLoading: false,
          isLoginSuccess: true,
          error: null,
        );
      }, (failure) {
        state = state.copyWith(
          isLoading: false,
          isLoginSuccess: null,
          error: failure.message,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoginSuccess: null,
        error: e.toString(),
      );
    }
  }

  Future<void> saveToken() async {
    try {
      if (state.token == null) {
        state = state.copyWith(
          error: 'Token is null',
        );
        return;
      }
      await ref.read(tokenServiceProvider).saveToken(state.token!);
      state = state.copyWith(
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoginSuccess: null,
        error: e.toString(),
      );
    }
  }

  void setLoginForm(Map<String, dynamic> formData) {
    state = state.copyWith(
      loginForm: formData,
    );
  }
}
