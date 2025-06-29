import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
    final color = Theme.of(context).colorScheme;
    ref.listen(loginControllerProvider.select((value) => value.error),
        (_, next) {
      if (next != null) {
        final message = ScaffoldMessenger.of(context);
        message.hideCurrentSnackBar();
        message.showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: color.error,
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

  //region MAIN
  @override
  Widget build(BuildContext context) {
    _listener();
    final state = ref.watch(loginControllerProvider);
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return SafeArea(
        top: true,
        child: Scaffold(
            backgroundColor: color.primary,
            body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      _topAppBar(),
                    ],
                body: _loginBody())));
  }

  //endregion

  //region TopAppBar
  Widget _topAppBar() {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return SliverAppBar(
        pinned: true,
        toolbarHeight: 200,
        backgroundColor: color.primary,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: text.displayMedium,
                      ),
                      Text(
                        'Welcome to Taskit app',
                        style: text.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ]),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    elevation: 2,
                    color: Colors.transparent,
                    shape: CircleBorder(),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: color.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/taskit_icon.svg',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  //endregion
  //region Login Body
  Widget _loginBody() {
    final state = ref.watch(loginControllerProvider);
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          color: color.surface),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login',
                style: text.headlineMedium?.copyWith(
                    color: color.primary, fontWeight: FontWeight.w800)),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                width: double.infinity,
                child: TaskitOutlineTextField(
                    labelText: 'Email',
                    controller: _emailController,
                    autofillHints: AutofillHints.email,
                    keyboardType: TextInputType.emailAddress)),
            SizedBox(
              height: 15,
            ),
            TaskitOutLineTextFieldWithPassword(
                labelText: 'Password', controller: _passwordController),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Forgot your password',
                        style: text.bodySmall?.copyWith(
                          color: color.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push('/forgot_password'))
                  ],
                  style: text.bodyMedium,
                ),
              ),
            ),
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
                    : Text('Login',
                        style: text.titleMedium?.copyWith(
                          color: color.onPrimary,
                        )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Stack(
                children: [
                  Center(
                      child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: color.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(40),
                          ))),
                  Center(
                      child: Container(
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: color.surface,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'OR',
                        style: text.labelMedium?.copyWith(
                            color: color.onSurfaceVariant,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
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
                  style: text.titleSmall?.copyWith(
                    color: color.onSurfaceVariant,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(44),
                  padding: EdgeInsets.zero,
                  overlayColor: color.primary,
                  backgroundColor: color.surfaceContainerLow,
                  side: BorderSide(
                    color: color.surfaceContainerHighest,
                    width: 2.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ).copyWith(
                  overlayColor: WidgetStatePropertyAll(
                    color.primary.withAlpha(30), // hoverColor
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: text.bodySmall?.copyWith(
                        color: color.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign up here',
                      style: text.bodySmall?.copyWith(
                        color: color.primary,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push('/signup'),
                    )
                  ],
                  style: text.bodyMedium,
                ),
              ),
            )
          ]),
    );
  }

  //endregion
  Widget _body() {
    final state = ref.watch(loginControllerProvider);
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        style: text.headlineMedium?.copyWith(
                            color: color.onSurface,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 12.0, 0.0, 24.0),
                      child: Center(
                        child: Text('Filling out the form below to continue',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ElevatedButton(
                          onPressed: _onSummit,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40),
                            backgroundColor: color.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: state.isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: color.onPrimary,
                                    ),
                                  )
                                : Text('Login',
                                    style: text.titleMedium
                                        ?.copyWith(color: color.onPrimary)),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
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
                            style: text.titleSmall?.copyWith(
                              color: color.onSurfaceVariant,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(44),
                            padding: EdgeInsets.zero,
                            overlayColor: color.primary,
                            backgroundColor: color.secondaryContainer,
                            side: BorderSide(
                              color: color.secondaryContainer,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ).copyWith(
                            overlayColor: WidgetStatePropertyAll(
                              color.primary.withAlpha(30), // hoverColor
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don\'t have an account? ',
                                style: text.bodySmall?.copyWith(
                                  color: color.onSurfaceVariant,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign up here',
                                style: text.bodySmall?.copyWith(
                                  color: color.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.push('/signup'),
                              )
                            ],
                            style: text.bodyMedium,
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
