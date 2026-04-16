import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/auth/presentation/signup/controller/signup_controller.dart';
import 'package:taskit/shared/constants/signup_status.dart';
import 'package:taskit/shared/utils/snack_bar_utils.dart';
import 'package:taskit/shared/widget/text_field/taskit_outline_text_field.dart';
import 'package:taskit/shared/widget/text_field/taskit_password_text_field.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _confirmKey = GlobalKey<FormFieldState<String>>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirm.dispose();
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
    ) {
      if (next == SignupStatus.signupSuccess) {
        context.push('/signup/verify');
      }
    });
  }

  void _onSubmit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == null || !isValid) return;
    final controller = ref.read(signupControllerProvider.notifier);
    controller.signup(
      _emailController.text,
      _passwordController.text,
      _passwordConfirm.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    _listener();
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: color.primary,
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            const SizedBox(height: 80),
            Expanded(child: _signupBody()),
          ],
        ),
      ),
    );
  }

  //region SignUp Body
  Widget _signupBody() {
    final state = ref.watch(signupControllerProvider);
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
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
                'Sign up',
                style: text.headlineMedium?.copyWith(
                  color: color.primary,
                  fontWeight: FontWeight.w800,
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
              SizedBox(height: 15),
              TaskitPasswordTextField(
                labelText: 'Password',
                controller: _passwordController,
                onChanged: (value) {
                  if (_passwordConfirm.text.isNotEmpty) {
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
                labelText: 'Confirm password',
                controller: _passwordConfirm,
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
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    backgroundColor: color.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: state.isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: color.onPrimary,
                          ),
                        )
                      : Text(
                          'Signup',
                          style: text.titleMedium?.copyWith(
                            color: color.onPrimary,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  //endregion
}
