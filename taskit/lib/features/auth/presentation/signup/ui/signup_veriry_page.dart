import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/utils/snack_bar_utils.dart';
import 'package:taskit/shared/widget/text_field/taskit_code_text_field.dart';

import '../../../../../shared/constants/signup_status.dart';
import '../controller/signup_controller.dart';

class SignupVerifyPage extends ConsumerStatefulWidget {
  const SignupVerifyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignupVerifyPageState();
}

class _SignupVerifyPageState extends ConsumerState<SignupVerifyPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _listener() {
    ref.listen(signupControllerProvider.select((value) => value.apiError), (
      _,
      next,
    ) {
      if (next != null) {
        SnackBarUtils.show(context, next, isError: true);
      }
    });
    // listen for success
    ref.listen(signupControllerProvider.select((value) => value.status), (
      _,
      next,
    ) async {
      switch (next) {
        case SignupStatus.verifySuccess:
          SnackBarUtils.show(context, "Verify success!");
          final router = GoRouter.of(context);
          await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
          if (context.mounted) {
            router.go('/login');
          }
          break;
        case SignupStatus.resend:
          SnackBarUtils.show(context, "Code resend success!");
        default:
          break;
      }
    });
  }

  void _onVerify() {
    final otp = _otpControllers.map((e) => e.text).join();
    if (otp.length != 4) {
      SnackBarUtils.show(context, "Please enter 4 digit code", isError: true);
      return;
    }
    final controller = ref.read(signupControllerProvider.notifier);
    controller.verify(otp);
  }

  void _onResend() => ref.read(signupControllerProvider.notifier).resend();

  @override
  Widget build(BuildContext context) {
    _listener();
    final color = Theme.of(context).colorScheme;
    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: color.primary,
        body: Column(
          children: [
            const SizedBox(height: 80),
            Expanded(child: _signupVerifyBody()),
          ],
        ),
      ),
    );
  }

  //region Sign up verify body
  Widget _signupVerifyBody() {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final state = ref.watch(signupControllerProvider);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        color: color.surface,
      ),
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
            Text(
              'Almost there',
              style: text.headlineMedium?.copyWith(
                color: color.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 5),
            RichText(
              textScaler: MediaQuery.of(context).textScaler,
              text: TextSpan(
                children: [
                  TextSpan(text: 'We sent a code to '),
                  TextSpan(
                    text: state.email,
                    style: text.labelMedium?.copyWith(color: color.primary),
                  ),
                  TextSpan(
                    text:
                        '. Please enter 4 digit code that mentioned in your email',
                  ),
                ],
                style: text.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color.onSurfaceVariant,
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisSize: MainAxisSize.max,
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: SizedBox(
                      width: 50,
                      child: TaskitCodeTextField(
                        controller: _otpControllers[index],
                        onChanged: (value) {
                          if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
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
                child: state.status == SignupStatus.loading
                    ? Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: color.onPrimary,
                          ),
                        ),
                      )
                    : Text(
                        'Verify',
                        style: text.titleMedium?.copyWith(
                          color: color.onPrimary,
                        ),
                      ),
              ),
            ),
            SizedBox(height: 15),
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
                    style: text.labelMedium?.copyWith(color: color.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _onResend(),
                  ),
                ],
                style: text.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //endregion
}
