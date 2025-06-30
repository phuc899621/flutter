import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../shared/presentation/widget/custom_taskit_textfield.dart';
import '../controller/forgot_pass_controller.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _listener() {
    ref.listen(forgotPassControllerProvider.select((value) => value.errorReset),
        (_, next) {
      if (next != null) {
        _passwordController.clear();
        _passwordConfirmController.clear();
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
        forgotPassControllerProvider.select((value) => value.isResetSuccess),
        (_, next) {
      if (next != null && next) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text('Password reset successfully'),
          ),
        );
        context.go('/login');
      }
    });
  }

  void _onSummit() {
    final form = ({
      'password': _passwordController.text,
      'passwordConfirm': _passwordConfirmController.text
    });
    ref.read(forgotPassControllerProvider.notifier).setResetForm(form);
    ref.read(forgotPassControllerProvider.notifier).reset();
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
    final state = ref.watch(forgotPassControllerProvider);

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
              Text('You\'re Verified',
                  style: text.headlineMedium?.copyWith(
                      color: color.primary, fontWeight: FontWeight.w800)),
              Text('Now, set a new password for your account',
                  style: text.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: color.onSurfaceVariant)),
              SizedBox(
                height: 25,
              ),
              TaskitOutLineTextFieldWithPassword(
                  labelText: 'New Password', controller: _passwordController),
              SizedBox(
                height: 15,
              ),
              TaskitOutLineTextFieldWithPassword(
                  labelText: 'Confirm New Password',
                  controller: _passwordConfirmController),
              SizedBox(
                height: 15,
              ),
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
                  child: state.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: color.onPrimary,
                          ),
                        )
                      : Text('Submit',
                          style: text.titleMedium?.copyWith(
                            color: color.onPrimary,
                          )),
                ),
              ),
            ]),
      ),
    );
  }
//endregion
}
