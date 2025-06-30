import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/auth/presentation/signup/controller/signup_controller.dart';

import '../../../../../shared/presentation/widget/custom_taskit_textfield.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  //controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirm.dispose();
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

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    _listener();
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: color.primary,
        resizeToAvoidBottomInset: true,
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  _topAppBar(),
                ],
            body: _signupBody()),
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
  //region SignUp Body
  Widget _signupBody() {
    final state = ref.watch(signUpControllerProvider);
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
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
              Text('Sign up',
                  style: text.headlineMedium?.copyWith(
                      color: color.primary, fontWeight: FontWeight.w800)),
              SizedBox(
                height: 25,
              ),
              TaskitOutlineTextField(
                labelText: 'Email',
                controller: _emailController,
                autofillHints: AutofillHints.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15,
              ),
              TaskitOutlineTextField(
                  labelText: "Full Name",
                  controller: _nameController,
                  autofillHints: AutofillHints.name,
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 15,
              ),
              TaskitOutLineTextFieldWithPassword(
                  labelText: 'Password', controller: _passwordController),
              SizedBox(
                height: 15,
              ),
              TaskitOutLineTextFieldWithPassword(
                  labelText: 'Confirm password', controller: _passwordConfirm),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSubmit,
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
                      : Text('Login',
                          style: text.titleMedium?.copyWith(
                            color: color.onPrimary,
                          )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ]),
      ),
    );
  }

//endregion
}
