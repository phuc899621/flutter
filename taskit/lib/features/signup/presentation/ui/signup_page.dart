import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/shared/extension/string_hardcoded.dart';

import '../controller/signup_controller.dart';

class SignupPage extends ConsumerStatefulWidget{

  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_SignupPageState();
}

//man hinh rebuild khi co thay doi tu controller
class _SignupPageState extends ConsumerState<SignupPage>{
  final _formKey=GlobalKey<FormState>();
  //controller
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener(); //lang nghe thay doi
    final signupController=ref.watch(signUpControllerProvider.notifier);
    final state = ref.watch(signUpControllerProvider);
    return Scaffold(
      body: Scaffold(
        key: _formKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 46.76,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 32.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: IconButton(
                                    iconSize: 46.2,
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
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
                                                .primaryColor,
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
                                            color: Theme.of(context).primaryColor,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context).primaryColor,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Theme.of(context).primaryColor,
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
                                                .primaryColor,
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
                                                .primaryColor,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .primaryColor,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .primaryColor,
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
                                            color: Theme.of(context).primaryColor,
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
                                                .primaryColor,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .primaryColor,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .primaryColor,
                                        suffixIcon: InkWell(
                                          onTap: () => signupController.togglePasswordVisibility(),
                                          focusNode:
                                          FocusNode(skipTraversal: true),
                                          child: Icon(
                                            state.isPasswordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Theme.of(context).primaryColor,
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
                                      controller:_confirmPasswordController,

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
                                            color: Theme.of(context).primaryColor,
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
                                                .primaryColor,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context).primaryColor,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: Theme.of(context).primaryColor,
                                        suffixIcon: InkWell(
                                          onTap: () => signupController.toggleConfirmPasswordVisibility(),
                                          focusNode:
                                          FocusNode(skipTraversal: true),
                                          child: Icon(
                                            state.isConfirmPasswordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Theme.of(context).primaryColor,
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
                                  child: ElevatedButton(
                                    onPressed: () async {
                                          _onSubmit();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(230,40),
                                      backgroundColor: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                    ) ,
                                    child: Text(
                                      'Sign Up',
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        fontFamily: 'Inter Tight',
                                      )
                                    ),


                                  ),
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
                        ),
                      ],
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

  void _listener() {
    // listen for error
    ref.listen(signUpControllerProvider.select((value) => value.error),
            (_, next) {
          if (next != null) {
            print(next+'=================================================');
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
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                    title: Text('Sign Up Successful'.hardcoded),
                    content: Text(
                        'Please check your email for verification and please  verify your account'
                            .hardcoded),
                    actions: [
                      TextButton(
                          onPressed: () {
                            // close dialog
                            context.pop();

                          },
                          child: Text('Ok'.hardcoded)),
                    ]);
              },
            );
          }
        });
  }
  void _onSubmit() {
    if (true) {
      final formData = {
        'name': 'phuc',
        'email': 'dinhlelytran1225@gmail.com',
        'password': '123',
        'confirmPassword':'123',
      };
      ref.read(signUpControllerProvider.notifier).setFormData(formData);
      // sign up - call api
      ref.read(signUpControllerProvider.notifier).signUp();
    }
  }
}