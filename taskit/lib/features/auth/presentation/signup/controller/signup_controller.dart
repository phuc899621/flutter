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

  Future<void> signup(
    String email,
    String password,
    String passwordConfirm,
  ) async {
    try {
      state = state.copyWith(
        isLoading: true,
        apiError: null,
        status: SignupStatus.initial,
        registerForm: SignupRegisterEntity(email: email, password: password),
      );
      final result = await ref
          .read(authServiceProvider)
          .signup(state.registerForm);
      result.when(
        (success) {
          state = state.copyWith(
            isLoading: false,
            status: SignupStatus.signupSuccess,
            resendForm: SignupResendEntity(email: email),
          );
        },
        (failure) {
          state = state.copyWith(
            isLoading: false,
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> resend() async {
    try {
      state = state.copyWith(
        isLoading: true,
        apiError: null,
        status: SignupStatus.initial,
      );
      final result = await ref
          .read(authServiceProvider)
          .signupResend(state.resendForm);
      result.when(
        (success) {
          state = state.copyWith(
            isLoading: false,
            status: SignupStatus.resendSuccess,
          );
        },
        (failure) {
          state = state.copyWith(
            isLoading: false,
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }

  Future<void> verify(String otp) async {
    try {
      //trang thai loading
      state = state.copyWith(
        isLoading: true,
        apiError: null,
        status: SignupStatus.initial,
        verifyForm: SignupVerifyEntity(
          email: state.registerForm.email,
          otp: otp,
        ),
      );
      final result = await ref
          .read(authServiceProvider)
          .signupVerify(state.verifyForm);
      result.when(
        (success) {
          state = state.copyWith(
            isLoading: false,
            status: SignupStatus.verifySuccess,
          );
        },
        (failure) {
          state = state.copyWith(
            isLoading: false,
            status: SignupStatus.initial,
            apiError: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        status: SignupStatus.initial,
        apiError: e.toString(),
      );
    }
  }
}
