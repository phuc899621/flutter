import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/presentation/widget/custom_taskit_button.dart';

import '../../../../../config/app/app_color.dart';
import '../../../../../shared/presentation/widget/custom_taskit_textfield.dart';
import '../../controller/signup_controller.dart';

class SignupVerifyForm extends ConsumerStatefulWidget {
  const SignupVerifyForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignupVerifyFormState();
}

class _SignupVerifyFormState extends ConsumerState<SignupVerifyForm> {
  //controller
  late TextEditingController _otpController0;
  late TextEditingController _otpController1;
  late TextEditingController _otpController2;
  late TextEditingController _otpController3;

  @override
  void initState() {
    super.initState();
    _otpController0 = TextEditingController();
    _otpController1 = TextEditingController();
    _otpController2 = TextEditingController();
    _otpController3 = TextEditingController();
  }

  @override
  void dispose() {
    _otpController0.dispose();
    _otpController1.dispose();
    _otpController2.dispose();
    _otpController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    final state = ref.watch(signUpControllerProvider);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 46.76,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 32.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: AppColor(context).primaryContainer,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: TaskitBackButton(onPressed: () => context.pop()),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification Code',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontFamily: 'Inter Tight',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 12.0, 0.0, 26.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'We sent a code to ',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: state.signupForm['email'],
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontFamily: 'Inter',
                                  color: AppColor(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          const TextSpan(
                            text:
                                '. Please enter 5 digit code that mentioned in the email',
                            style: TextStyle(),
                          )
                        ],
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 26.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 200.0,
                              child: TaskitCodeTextField(
                                  controller: _otpController0),
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          Expanded(
                            child: SizedBox(
                              width: 200.0,
                              child: TaskitCodeTextField(
                                  controller: _otpController1),
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          Expanded(
                            child: SizedBox(
                              width: 200.0,
                              child: TaskitCodeTextField(
                                  controller: _otpController2),
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          Expanded(
                            child: SizedBox(
                              width: 200.0,
                              child: TaskitCodeTextField(
                                  controller: _otpController3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 16.0),
                      child: TaskitElevationButton(
                          text: "Verify", onPressed: () => {_onVerify()})),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Haven’t got the email yet?',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                    TextSpan(
                      text: ' Resend code!',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontFamily: 'Inter',
                            color: AppColor(context).primary,
                            letterSpacing: 0.0,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _onVerify(),
                    )
                  ],
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          )
        ],
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
        signUpControllerProvider.select((value) => value.isVerifySuccess),
        (_, next) {
      if (next != null && next) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 5),
            backgroundColor: Colors.green,
            content: Text("Code verify success!"),
          ),
        );
        context.go('/login');
      }
    });
  }

  void _onVerify() {
    if (true) {
      final formData = {
        'otp': _otpController0.text +
            _otpController1.text +
            _otpController2.text +
            _otpController3.text,
      };
      ref.read(signUpControllerProvider.notifier).setVerifyForm(formData);
      ref.read(signUpControllerProvider.notifier).verify();
    }
  }
}
