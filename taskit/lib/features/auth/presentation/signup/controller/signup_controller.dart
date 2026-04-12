import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/data/dto/req/signup/signup_verify_request.dart';
import 'package:taskit/features/auth/domain/entites/signup/signup_model.dart';
import 'package:taskit/features/auth/domain/entites/signup/signup_verify_model.dart';

import '../../../application/auth_service_impl.dart';
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

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisibility: !state.isPasswordVisibility);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisibility: !state.isConfirmPasswordVisibility,
    );
  }

  Future<void> signup(String email, String password) async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        isSignUpSuccess: null,
        signupForm: SignupModel(email: email, password: password),
      );

      final result = await ref
          .read(authServiceProvider)
          .signup(state.signupForm);
      result.when(
        (success) {
          state = state.copyWith(isLoading: false, isSignUpSuccess: true);
        },
        (failure) {
          state = state.copyWith(
            isLoading: false,
            isSignUpSuccess: null,
            error: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSignUpSuccess: null,
        error: e.toString(),
      );
    }
  }


  Future<void> verify(String otp) async {
    try {
      //trang thai loading
      state = state.copyWith(
        isLoading: true,
        error: null,
        isVerifySuccess: null,
        verifyForm: SignupVerifyModel(
          email: state.signupForm.email,
          otp: otp,
        ),
      );
      final result = await ref.read(authServiceProvider).signupVerify(state.verifyForm);
      result.when(
        (success) {
          state = state.copyWith(isLoading: false, isVerifySuccess: true);
        },
        (failure) {
          state = state.copyWith(
            isLoading: false,
            isVerifySuccess: null,
            error: failure.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isVerifySuccess: null,
        error: e.toString(),
      );
    }
  }

}
