import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../shared/presentation/widget/custom_taskit_textfield.dart';
import '../controller/forgot_pass_controller.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
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
      'email': _emailController.text,
    });
    ref.read(forgotPassControllerProvider.notifier).setForgotPassForm(formData);
    ref.read(forgotPassControllerProvider.notifier).forgotPass();
  }

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
            body: _forgotPasswordBody()),
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
  Widget _forgotPasswordBody() {
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
              TextButton.icon(
                onPressed: context.pop,
                label: Text(
                  'Back to login',
                  style: text.labelLarge?.copyWith(color: color.primary),
                ),
                icon: Icon(Icons.arrow_back_rounded, color: color.primary),
              ),
              Text('Forgot Password?',
                  style: text.headlineMedium?.copyWith(
                      color: color.primary, fontWeight: FontWeight.w800)),
              SizedBox(
                height: 5,
              ),
              Text(
                  'Don\'t worry! Please enter the email associated with your account below.',
                  style: text.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: color.onSurfaceVariant)),
              SizedBox(
                height: 25,
              ),
              TaskitOutlineTextField(
                  labelText: "Email",
                  controller: _emailController,
                  autofillHints: AutofillHints.email,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 30,
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
                      : Text('Send Code',
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
