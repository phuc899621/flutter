import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../shared/presentation/widget/custom_taskit_textfield.dart';
import '../controller/signup_controller.dart';

class SignupVerifyPage extends ConsumerStatefulWidget {
  const SignupVerifyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignupVerifyPageState();
}

class _SignupVerifyPageState extends ConsumerState<SignupVerifyPage> {
  final TextEditingController _otpController0 = TextEditingController();
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();

  @override
  void dispose() {
    _otpController0.dispose();
    _otpController1.dispose();
    _otpController2.dispose();
    _otpController3.dispose();
    super.dispose();
  }

  void _listener() {
    final color = Theme.of(context).colorScheme;
    ref.listen(signUpControllerProvider.select((value) => value.error),
        (_, next) {
      if (next != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: color.error,
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

  void _onResend() {}

  @override
  Widget build(BuildContext context) {
    _listener();
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: color.primary,
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  _topAppBar(),
                ],
            body: _signupVerifyBody()),
      ),
    );
  }

  //region TOP APPBAR
  Widget _topAppBar() {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      expandedHeight: 80,
      backgroundColor: color.primary,
    );
  }

//endregion
//region Sign up verify body
  Widget _signupVerifyBody() {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final state = ref.watch(signUpControllerProvider);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          color: color.surface),
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton.filledTonal(
                onPressed: context.pop,
                style: IconButton.styleFrom(
                  backgroundColor: color.surfaceContainer,
                  foregroundColor: color.primary,
                ),
                icon: Icon(Icons.arrow_back_rounded, color: color.primary),
              ),
              Text('Almost there',
                  style: text.headlineMedium?.copyWith(
                      color: color.primary, fontWeight: FontWeight.w800)),
              SizedBox(
                height: 5,
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'We sent a code to ',
                    ),
                    TextSpan(
                      text: state.signupForm['email'],
                      style: text.labelMedium?.copyWith(
                        color: color.primary,
                      ),
                    ),
                    TextSpan(
                      text:
                          '. Please enter 4 digit code that mentioned in your email',
                    )
                  ],
                  style: text.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: color.onSurfaceVariant),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 200.0,
                      child: TaskitCodeTextField(controller: _otpController0),
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  Expanded(
                    child: SizedBox(
                      width: 200.0,
                      child: TaskitCodeTextField(controller: _otpController1),
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  Expanded(
                    child: SizedBox(
                      width: 200.0,
                      child: TaskitCodeTextField(controller: _otpController2),
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  Expanded(
                    child: SizedBox(
                      width: 200.0,
                      child: TaskitCodeTextField(controller: _otpController3),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onVerify,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: state.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: color.onPrimary,
                          ),
                        )
                      : Text('Verify',
                          style: text.titleMedium?.copyWith(
                            color: color.onPrimary,
                          )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Haven’t got the email yet?',
                      style: text.labelMedium,
                    ),
                    TextSpan(
                      text: ' Resend code!',
                      style: text.labelMedium?.copyWith(
                        color: color.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _onVerify(),
                    )
                  ],
                  style: text.labelMedium,
                ),
              ),
            ]),
      ),
    );
  }
//endregion
}
