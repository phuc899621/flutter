import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app/app_color.dart';
import '../../../../../shared/presentation/widget/custom_taskit_textfield.dart';
import '../controller/login_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _listener() {
    ref.listen(loginControllerProvider.select((value) => value.error),
        (_, next) {
      if (next != null) {
        final message = ScaffoldMessenger.of(context);
        message.hideCurrentSnackBar();
        message.showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: AppColor(context).error,
            content: Text(next),
          ),
        );
      }
    });
    ref.listen(loginControllerProvider.select((value) => value.isLoginSuccess),
        (_, next) {
      if (next != null && next) {
        context.go('/home');
      }
    });
  }

  void _onSummit() {
    final formData = ({
      'email': _emailController.text,
      'password': _passwordController.text
    });
    ref.read(loginControllerProvider.notifier).setLoginForm(formData);
    ref.read(loginControllerProvider.notifier).login();
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    return Scaffold(
      backgroundColor: AppColor(context).primaryContainer,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: AppColor(context).secondaryContainer,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(4, 4),
                          spreadRadius: 1.0,
                        )
                      ]),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/taskit_icon.svg',
                      width: 60,
                      height: 60,
                    ),
                  )),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    32.0, 16.0, 32.0, 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontFamily: 'Inter Tight',
                                letterSpacing: 0.0,
                                color: AppColor(context).onSurface,
                                fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 12.0, 0.0, 24.0),
                      child: Center(
                        child: Text(
                          'Filling out the form below to continue',
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 16.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: TaskitOutlineTextField(
                              labelText: 'Email',
                              controller: _emailController,
                              autofillHints: AutofillHints.email,
                              keyboardType: TextInputType.emailAddress)),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 16.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: TaskitOutLineTextFieldWithPassword(
                              labelText: 'Password',
                              controller: _passwordController)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 20.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Forgot your password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontFamily: 'Inter',
                                        color: AppColor(context).primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => context.push('/forgot_password'))
                            ],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 16.0),
                        child: ElevatedButton(
                          onPressed: _onSummit,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40),
                            backgroundColor: AppColor(context).primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ref.watch(loginControllerProvider).isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: AppColor(context).onPrimary,
                                    ),
                                  )
                                : Text('Login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            fontFamily: 'Inter Tight',
                                            color:
                                                AppColor(context).onPrimary)),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 24.0),
                      child: SizedBox(
                        width: 370.0,
                        child: Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 2.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 70.0,
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: AppColor(context).primaryContainer,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'OR',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: SvgPicture.asset(
                            'assets/svg/google.svg',
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {},
                          label: Text(
                            'Login with Google',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontFamily: 'Inter Tight',
                                  color: AppColor(context).onSurfaceVariant,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(44),
                            padding: EdgeInsets.zero,
                            overlayColor: AppColor(context).primary,
                            backgroundColor:
                                AppColor(context).secondaryContainer,
                            side: BorderSide(
                              color: AppColor(context).secondaryContainer,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ).copyWith(
                            overlayColor: WidgetStatePropertyAll(
                              AppColor(context)
                                  .primary
                                  .withOpacity(0.2), // hoverColor
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don\'t have an account? ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontFamily: 'Inter',
                                      color: AppColor(context).onSurfaceVariant,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              TextSpan(
                                text: 'Sign up here',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontFamily: 'Inter',
                                      color: AppColor(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.push('/signup'),
                              )
                            ],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
