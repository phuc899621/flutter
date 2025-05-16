import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/presentation/widget/custom_taskit_button.dart';
import 'package:taskit/shared/presentation/widget/custom_taskit_textfield.dart';

import '../controller/forgot_pass_controller.dart';

class ForgotPasswordForm extends ConsumerStatefulWidget {
  const ForgotPasswordForm({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends ConsumerState<ForgotPasswordForm> {
  late TextEditingController _emailAddressTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailAddressTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailAddressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Forgot Password',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                  )),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
            child: Text(
                'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                    )),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: SizedBox(
                width: double.infinity,
                child: TaskitOutlineTextField(
                    labelText: "Email",
                    controller: _emailAddressTextController,
                    autofillHints: AutofillHints.email,
                    keyboardType: TextInputType.emailAddress)),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: TaskitElevationButton(
                  onPressed: () => _onSummit(),
                  text: 'Send',
                )),
          ),
        ],
      ),
    );
  }

  void _listener() {
    ref.listen(
        forgotPassControllerProvider.select((value) => value.errorForgotPass),
        (_, next) {
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
    ref.listen(
        forgotPassControllerProvider
            .select((value) => value.isForgotPassSuccess), (_, next) {
      if (next != null && next) {
        context.push('/forgot_password/verify');
      }
    });
  }

  void _onSummit() {
    final formData = ({
      'email': _emailAddressTextController.text,
    });
    ref.read(forgotPassControllerProvider.notifier).setForgotPassForm(formData);
    ref.read(forgotPassControllerProvider.notifier).forgotPass();
  }
}
