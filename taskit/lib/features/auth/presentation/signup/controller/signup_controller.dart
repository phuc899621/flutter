import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/constants/signup_status.dart';

import '../../../application/auth_service_impl.dart';
import '../../../domain/entities/signup/signup_entity.dart';
import '../state/signup_state.dart';

final signupControllerProvider =
    NotifierProvider.autoDispose<SignupController, SignupState>(
      SignupController.new,
    );

class SignupController extends Notifier<SignupState> {
  @override
  SignupState build() {
    return SignupState();
  }

  Future<void> signup(String email, String password) async {
    try {
      state = state.copyWith(
        apiError: null,
        status: SignupStatus.loading,
        email: email,
        password: password,
      );
      final form = SignupRegisterEntity(
        email: state.email,
        password: state.password,
      );
      final result = await ref.read(authServiceProvider).signup(form);
      result.when(
        (success) {
          state = state.copyWith(status: SignupStatus.signupSuccess);
        },
        (failure) {
          state = state.copyWith(
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> resend() async {
    try {
      state = state.copyWith(apiError: null, status: SignupStatus.loading);
      final form = SignupResendEntity(email: state.email);
      final result = await ref.read(authServiceProvider).signupResend(form);
      result.when(
        (success) {
          state = state.copyWith(status: SignupStatus.resendSuccess);
        },
        (failure) {
          state = state.copyWith(
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> verify(String otp) async {
    try {
      //trang thai loading
      state = state.copyWith(
        apiError: null,
        status: SignupStatus.loading,
        otp: otp,
      );
      final form = SignupVerifyEntity(email: state.email, otp: state.otp);
      final result = await ref.read(authServiceProvider).signupVerify(form);
      result.when(
        (success) {
          state = state.copyWith(status: SignupStatus.verifySuccess);
        },
        (failure) {
          state = state.copyWith(
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }
}
