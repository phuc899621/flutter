import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/presentation/widget/custom_taskit_button.dart';

import '../../../../../config/app/app_color.dart';
import '../../../../../shared/presentation/widget/custom_taskit_textfield.dart';
import '../controller/signup_controller.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _signupFormKey = GlobalKey<FormState>;

  //controller
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirm;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirm = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    final signupController = ref.watch(signUpControllerProvider.notifier);
    final state = ref.watch(signUpControllerProvider);
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                  ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
              child: Text('Create your account to continue!',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      )),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: SizedBox(
                width: 370.0,
                child: TaskitOutlineTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  autofillHints: AutofillHints.email,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: SizedBox(
                  width: 370.0,
                  child: TaskitOutlineTextField(
                      labelText: "Full Name",
                      controller: _nameController,
                      autofillHints: AutofillHints.name,
                      keyboardType: TextInputType.text)),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: SizedBox(
                  width: 370.0,
                  child: TaskitOutLineTextFieldWithPassword(
                      labelText: 'Password', controller: _passwordController)),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: SizedBox(
                  width: 370.0,
                  child: TaskitOutLineTextFieldWithPassword(
                      labelText: 'Confirm password',
                      controller: _passwordConfirm)),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: TaskitElevationButton(
                  onPressed: () => _onSubmit(), text: "Sign Up"),
            ),
            // You will have to add an action on this rich text to go to your login page.
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account?',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              color: AppColor(context).secondaryText,
                            ),
                      ),
                      TextSpan(
                          text: ' Log in here',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor(context).primary,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.pop())
                    ],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listener() {
    // listen for error
    ref.listen(signUpControllerProvider.select((value) => value.error),
        (_, next) {
      if (next != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: AppColor(context).error,
            content: Text(next),
          ),
        );
      }
    });
    // listen for success
    ref.listen(
        signUpControllerProvider.select((value) => value.isSignUpSuccess),
        (_, next) {
      //_la gia tri cu, next la gia tri moi
      if (next != null && next) {
        context.push('/signup/verify');
      }
    });
  }

  void _onSubmit() {
    if (true) {
      final formData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'confirmPassword': _passwordConfirm.text,
      };
      ref.read(signUpControllerProvider.notifier).setFormData(formData);
      ref.read(signUpControllerProvider.notifier).signUp();
    }
  }
}
