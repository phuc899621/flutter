import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/application/auth_service.dart';

import '../state/splash_state.dart';

final splashControllerProvider =
    NotifierProvider<SplashController, SplashState>(SplashController.new);

class SplashController extends Notifier<SplashState> {
  @override
  SplashState build() {
    return const SplashState();
  }

  Future<void> checkLogin() async {
    try {
      state = state.copyWith(
        isLoginExpired: null,
      );
      final result = await ref.read(authServiceProvider).checkLogin();
      result.when((success) {
        state = state.copyWith(
          isLoginExpired: false,
        );
      }, (failure) {
        state = state.copyWith(
          isLoginExpired: true,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoginExpired: true,
      );
    }
  }
}
