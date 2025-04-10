import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/signup_service.dart';
import '../../data/dto/request/signup_request.dart';
import '../state/signup_state.dart';

final signUpControllerProvider =
AutoDisposeNotifierProvider<SignUpController, SignupState>(
    SignUpController.new);
/*
* 1 notifier de lang nghe va cap nhat du lieu
* - gui request dang ky
* cap nhat tran thai
* luu tru form dang ky
*
* */
class SignUpController extends AutoDisposeNotifier<SignupState> {
  @override
  SignupState build() {
    return SignupState();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(
      isPasswordVisibility: !state.isPasswordVisibility,
    );
  }
  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisibility: !state.isConfirmPasswordVisibility,
    );
  }

  Future<void> signUp() async {
    try {
      //trang thai loading
      state = state.copyWith(
        isLoading: true,
        error: null,
        isSignUpSuccess: null,
      );


      final formData = SignupRequest(
        name: state.signUpform['name'],
        email: state.signUpform['email'],
        password: state.signUpform['password'],
        passwordConfirm: state.signUpform['confirmPassword'],
      );
      final result = await ref.read(signUpServiceProvider).signUp(formData);
      result.when((success) {
        state = state.copyWith(
          isLoading: false,
          isSignUpSuccess: true,
          signUpModel: success,
        );
      }, (failure) {
        state = state.copyWith(
          isLoading: false,
          isSignUpSuccess: null,
          error: failure.message,
        );
      });
    } catch (e) {
      print(e.toString());
      state = state.copyWith(
        isLoading: false,
        isSignUpSuccess: null,
        error:e.toString(),
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      signUpform: formData,
    );
  }
}