import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/presentation/widget/custom_taskit_button.dart';
import 'package:taskit/shared/presentation/widget/custom_taskit_textfield.dart';

import '../../controller/login_controller.dart';

class LoginForm extends ConsumerStatefulWidget{
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_LoginFormState();

}
class _LoginFormState extends ConsumerState<LoginForm>{
  late TextEditingController _emailController;
  late TextEditingController _passwordController;


  @override
  void initState() {
    super.initState();
    _emailController=TextEditingController();
    _passwordController=TextEditingController();

  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _listener();
    return Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Login',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontFamily: 'Inter Tight',
                  letterSpacing: 0.0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
                child: Text('Filling out the form below to continue',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                      ),
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                0.0, 0.0, 0.0, 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TaskitOutlineTextField(
                    labelText: 'email',
                    controller: _emailController,
                    autofillHints: AutofillHints.email,
                    keyboardType: TextInputType.emailAddress
                  )
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                0.0, 0.0, 0.0, 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TaskitOutLineTextFieldWithPassword(
                    labelText: 'Password',
                    controller: _passwordController
                  )
                ),
              ) ,
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 12.0, 0.0, 20.0),
                  child: RichText(
                    textScaler:MediaQuery.of(context).textScaler,
                    text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Forgot your password',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: 'Inter',
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                      ],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                0.0, 0.0, 0.0, 16.0),
                child: TaskitElevationButton(text: 'Login',onPressed: ()=>_onSummit()),
              ),
              Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: SizedBox(
                width: 370.0,
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment:
                      AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          height: 2.0,
                          decoration: BoxDecoration(
                            color:Theme.of(context).colorScheme.background,
                            border: Border.all(
                              width: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                    alignment:
                    AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 70.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        color:Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'OR',
                        style:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Container(
                width: double.infinity,
                child:  OutlinedButton.icon(
                  onPressed: () {
                  print('Button pressed ...');
                  },
                  label: Text(
                  'Continue with Google',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontFamily: 'Inter Tight',
                  color: Theme.of(context).colorScheme.onSecondary,
                  letterSpacing: 0.0,
                  ),
                  ),
                  style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(44),
                  padding: EdgeInsets.zero,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  side: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                  width: 2.0,
                  ),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  ),
                  ).copyWith(
                  overlayColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primaryContainer, // hoverColor
                  ),
                  ),
                  ),
                ),
              ),
              Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
              0.0, 12.0, 0.0, 12.0),
              child: RichText(
              textScaler:
              MediaQuery.of(context).textScaler,
              text: TextSpan(
              children: [
                TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(),
                ),
                TextSpan(
                  text: 'Sign up here',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: 'Inter',
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () => context.push('/signup'),
                )
              ],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
             ),
            ),
          ),
        )
      ],
    ),
    ),
    );


  }
  void _listener(){
      ref.listen(loginControllerProvider.select((value) => value.error),
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
      ref.listen(loginControllerProvider.select((value)=>value.isLoginSuccess),
          (_,next){
            if (next != null && next) {
              ref.read(loginControllerProvider.notifier).saveToken();
            }
      });
  }
  void _onSummit(){
    final formData=({
      'email':_emailController.text,
      'password':_passwordController.text
    });
    ref.read(loginControllerProvider.notifier).setLoginForm(formData);
    ref.read(loginControllerProvider.notifier).login();
  }
}