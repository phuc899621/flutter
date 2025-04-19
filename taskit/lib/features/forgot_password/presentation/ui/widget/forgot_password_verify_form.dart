import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/forgot_password/presentation/controller/forgot_pass_controller.dart';

import '../../../../../shared/presentation/widget/custom_taskit_button.dart';
import '../../../../../shared/presentation/widget/custom_taskit_textfield.dart';

class ForgotPasswordVerifyPage extends ConsumerStatefulWidget{
  const ForgotPasswordVerifyPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ForgotPasswordVerifyPageState();
}
class _ForgotPasswordVerifyPageState extends ConsumerState<ForgotPasswordVerifyPage>{
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
    final controller=ref.watch(forgotPassControllerProvider);
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          32.0, 32.0, 32.0, 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Verification Code',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontFamily: 'Inter Tight',
                letterSpacing: 0.0,
              )
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0, 12.0, 0.0, 26.0),
            child: RichText(
              textScaler:
              MediaQuery.of(context).textScaler,
              text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'We sent a code to ',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,

                        )
                    ),
                    TextSpan(
                        text: controller.forgotPassForm['email'],
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          color: Theme.of(context).colorScheme.primary,
                        )
                    ),
                    TextSpan(
                        text:
                        '. Please enter 4 digit code that mentioned in the email',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        )
                    )
                  ],
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    color: Theme.of(context).colorScheme.primary,
                  )
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 0.0, 0.0, 26.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 200.0,
                      child: TaskitCodeTextField(controller: _otpController0),
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Expanded(
                    child: SizedBox(
                      width: 200.0,
                      child: TaskitCodeTextField(controller: _otpController1),
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Expanded(
                    child: SizedBox(
                      width: 200.0,
                      child: TaskitCodeTextField(controller: _otpController2),
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Expanded(
                    child: SizedBox(
                      width: 200.0,
                      child: TaskitCodeTextField(controller: _otpController3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0, 0.0, 0.0, 16.0),
            child: TaskitElevationButton(
              onPressed:() => _onSummit(),
              text: 'Verify',
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 30.0, 0.0, 0.0),
              child: RichText(
                textScaler:
                MediaQuery.of(context).textScaler,
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Haven’t got the email yet?',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          )
                      ),
                      TextSpan(
                          text: ' Resend code!',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                              color: Theme.of(context).primaryColor
                          ),
                        recognizer: TapGestureRecognizer()..onTap = () => _onSummit()
                      )
                    ],
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _listener(){
    ref.listen(forgotPassControllerProvider.select((value) => value.errorVerify),
            (_,next){
          if (next != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 5),
                backgroundColor: Colors.red,
                content: Text(next),
              ),
            );
          }
        });
    ref.listen(forgotPassControllerProvider.select((value)=>value.isVerifySuccess),
            (_,next){
          if (next != null && next) {
            context.push('/forgot-password-reset');
          }
        });
  }
  void _onSummit(){
    final formData = ({
      'otp': _otpController0.text+_otpController1.text+_otpController2.text+_otpController3.text,
    });
    ref.read(forgotPassControllerProvider.notifier).setVerifyForm(formData);
    ref.read(forgotPassControllerProvider.notifier).verify();

  }
}