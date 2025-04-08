import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/signup/presentation/ui/widget/signup_button.dart';

import '../../controller/signup_controller.dart';

class SignupForm extends ConsumerStatefulWidget{
  const SignupForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_SignupFormState();
}
class _SignupFormState extends ConsumerState<SignupForm>{
  final _signupFormKey=GlobalKey<FormState>;

  //controller
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirm;


  @override
  void initState() {
    super.initState();

    _nameController=TextEditingController();
    _emailController=TextEditingController();
    _passwordController=TextEditingController();
    _passwordConfirm=TextEditingController();
  }


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    final signupController=ref.watch(signUpControllerProvider.notifier);
    final state = ref.watch(signUpControllerProvider);
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            32.0, 32.0, 32.0, 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontFamily: 'Inter Tight',
                letterSpacing: 0.0,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 12.0, 0.0, 24.0),
              child: Text(
                  'Create your account to continue!',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  )
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 0.0, 0.0, 16.0),
              child: Container(
                width: 370.0,
                child: TextFormField(
                  controller: _emailController,
                  autofocus: true,
                  autofillHints: [AutofillHints.email],
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: Theme.of(context).textTheme
                        .labelMedium?.copyWith(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme.primaryContainer,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme.primary,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  style: Theme.of(context).textTheme
                      .bodyMedium?.copyWith(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 0.0, 0.0, 16.0),
              child: Container(
                width: 370.0,
                child: TextFormField(
                  controller: _nameController,
                  autofocus: true,
                  autofillHints: [AutofillHints.name],
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: Theme.of(context)
                        .textTheme.labelMedium?.copyWith(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    alignLabelWithHint: false,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme.primaryContainer,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .primaryColor,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme.background,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme.background,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Theme.of(context)
                        .colorScheme.primaryContainer,
                  ),
                  style: Theme.of(context).textTheme
                      .bodyMedium?.copyWith(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 0.0, 0.0, 16.0),
              child: Container(
                width: 370.0,
                child: TextFormField(
                  controller: _passwordController,
                  autofocus: true,
                  autofillHints: [AutofillHints.password],
                  obscureText: !state.isPasswordVisibility,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .primaryColor,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme.background,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme.background,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Theme.of(context)
                        .colorScheme.primaryContainer,
                    suffixIcon: InkWell(
                      onTap: () => signupController.togglePasswordVisibility(),
                      focusNode:
                      FocusNode(skipTraversal: true),
                      child: Icon(
                        state.isPasswordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: 24.0,
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,

                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 0.0, 0.0, 16.0),
              child: Container(
                width: 370.0,
                child: TextFormField(
                  controller:_passwordConfirm,

                  autofocus: true,
                  autofillHints: [AutofillHints.password],
                  obscureText:
                  !state.isConfirmPasswordVisibility,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme.background,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 2.0,
                      ),
                      borderRadius:
                      BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    suffixIcon: InkWell(
                      onTap: () => signupController.toggleConfirmPasswordVisibility(),
                      focusNode:
                      FocusNode(skipTraversal: true),
                      child: Icon(
                        state.isConfirmPasswordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: 24.0,
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 0.0, 0.0, 16.0),
              child: SignupButton(onPressed: ()=>_onSubmit(),),
            ),
            // You will have to add an action on this rich text to go to your login page.
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0, 12.0, 0.0, 12.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(),
                      ),
                      TextSpan(
                          text: ' Log in here',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          )
                      )
                    ],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,

                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _listener() {
    // listen for error
    ref.listen(signUpControllerProvider.select((value) => value.error),
            (_, next) {
          if (next != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 100),
                backgroundColor: Colors.red,
                content: Text(next),
              ),
            );
          }
        });
    // listen for success
    ref.listen(
        signUpControllerProvider.select((value) => value.isSignUpSuccess),
            (_, next) { //_la gia tri cu, next la gia tri moi
          if (next != null && next) {
            //
          }
        });
  }
  void _onSubmit() {
    if (true) {
      final formData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'confirmPassword':_passwordConfirm.text,
      };
      ref.read(signUpControllerProvider.notifier).setFormData(formData);
      ref.read(signUpControllerProvider.notifier).signUp();
    }
  }

}