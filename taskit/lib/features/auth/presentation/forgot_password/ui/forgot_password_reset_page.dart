import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/widget/text_field/taskit_password_text_field.dart';

import '../../../../../shared/constants/forgot_pass_status.dart';
import '../../../../../shared/utils/snack_bar_utils.dart';
import '../controller/forgot_pass_controller.dart';

class ForgotPasswordResetPage extends ConsumerStatefulWidget {
  const ForgotPasswordResetPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordResetPageState();
}

class _ForgotPasswordResetPageState
    extends ConsumerState<ForgotPasswordResetPage> {
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _confirmKey = GlobalKey<FormFieldState<String>>();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _listener() {
    ref.listen(forgotPassControllerProvider.select((value) => value.apiError), (
      _,
      next,
    ) {
      if (next != null) {
        _passwordController.clear();
        _passwordConfirmController.clear();
        SnackBarUtils.show(context, next, isError: true);
      }
    });
    ref.listen(forgotPassControllerProvider.select((value) => value.status), (
      _,
      next,
    ) async {
      if (next == ForgotPassStatus.resetSuccess) {
        SnackBarUtils.show(
          context,
          "Reset password success!",
          duration: Duration(seconds: 2),
        );
        final router = GoRouter.of(context);
        await Future.delayed(const Duration(seconds: 2));
        if (context.mounted) {
          router.go('/login');
        }
      }
    });
  }

  void _onSummit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == null || !isValid) return;
    ref
        .read(forgotPassControllerProvider.notifier)
        .reset(_passwordController.text);
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
              IconButton.filledTonal(
                onPressed: context.pop,
                style: IconButton.styleFrom(
                  backgroundColor: color.surfaceContainer,
                  foregroundColor: color.primary,
                ),
                icon: Icon(Icons.arrow_back_rounded, color: color.primary),
              ),
              Text(
                'You\'re Verified',
                style: text.headlineMedium?.copyWith(
                  color: color.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Now, set a new password for your account',
                style: text.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 25),
              TaskitPasswordTextField(
                labelText: 'New password',
                controller: _passwordController,
                onChanged: (value) {
                  if (_passwordConfirmController.text.isNotEmpty) {
                    _confirmKey.currentState?.validate();
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TaskitPasswordTextField(
                formKey: _confirmKey,
                labelText: 'Confirm new password',
                controller: _passwordConfirmController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _confirmKey.currentState?.validate();
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password again';
                  }
                  if (value != _passwordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
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
                          child: CircularProgressIndicator(
                            color: color.onPrimary,
                          ),
                        )
                      : Text(
                          'Submit',
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
