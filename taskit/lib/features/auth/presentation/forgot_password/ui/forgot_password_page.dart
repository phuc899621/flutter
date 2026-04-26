import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/utils/snack_bar_utils.dart';

import '../../../../../shared/constants/forgot_pass_status.dart';
import '../../../../../shared/widget/text_field/taskit_outline_text_field.dart';
import '../controller/forgot_pass_controller.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  void _listener() {
    ref.listen(forgotPassControllerProvider.select((value) => value.apiError), (
      _,
      next,
    ) {
      if (next != null) {
        SnackBarUtils.show(context, next, isError: true);
      }
    });
    ref.listen(forgotPassControllerProvider.select((value) => value.status), (
      _,
      next,
    ) {
      if (next == ForgotPassStatus.forgotSuccess) {
        context.push('/forgot_password/verify');
      }
    });
  }

  void _onSummit() async {
    if (!_formKey.currentState!.validate()) return;
    ref
        .read(forgotPassControllerProvider.notifier)
        .forgotPass(_emailController.text);
  }

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
            Expanded(child: _forgotPasswordBody()),
          ],
        ),
      ),
    );
  }

  //region Sign up verify body
  Widget _forgotPasswordBody() {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    final state = ref.watch(forgotPassControllerProvider);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        color: color.surface,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: context.pop,
                label: Text(
                  'Back to login',
                  style: text.labelLarge?.copyWith(color: color.primary),
                ),
                icon: Icon(Icons.arrow_back_rounded, color: color.primary),
              ),
              Text(
                'Forgot Password?',
                style: text.headlineMedium?.copyWith(
                  color: color.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Don\'t worry! Please enter the email associated with your account below.',
                style: text.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 25),
              TaskitOutlineTextField(
                labelText: 'Email',
                controller: _emailController,
                autofillHints: const [AutofillHints.email],
                autoFocus: true,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSummit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: state.status == ForgotPassStatus.loading
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
                          'Send Code',
                          style: text.titleMedium?.copyWith(
                            color: color.onPrimary,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //endregion
}
