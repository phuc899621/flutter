import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/login/state/login_state.dart';
import 'package:taskit/shared/application/token_service.dart';

import '../../../../../shared/application/local_service.dart';
import '../../../application/auth_service.dart';
import '../../../data/dto/req/login/login_request.dart';
import '../../../domain/entites/setting/setting.dart';

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
        await saveSetting(success.setting);
        state = state.copyWith(
          isLoading: false,
          isLoginSuccess: true,
          error: null,
          loginModel: success,
          token: success.token,
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

  Future<void> saveSetting(SettingModel setting) async {
    try {
      await ref
          .read(localServiceProvider)
          .saveNotification(setting.isNotificationEnabled);
      await ref
          .read(localServiceProvider)
          .saveRemindBefore(setting.remindBefore);
      await ref.read(localServiceProvider).saveCategories(setting.categories);
      await ref.read(localServiceProvider).saveLanguage(setting.language);
      await ref.read(localServiceProvider).saveTheme(setting.theme);
      debugPrint('setting saved$setting');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setLoginForm(Map<String, dynamic> formData) {
    state = state.copyWith(
      loginForm: formData,
    );
  }
}
