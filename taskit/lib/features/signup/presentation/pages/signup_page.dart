import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/core/extension/string_hardcoded.dart';

import '../controller/signup_controller.dart';

class SignupPage extends ConsumerStatefulWidget{

  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_SignupPageState();
}

//man hinh rebuild khi co thay doi tu controller
class _SignupPageState extends ConsumerState<SignupPage>{

  
  @override
  Widget build(BuildContext context) {
    _listener(); //lang nghe thay doi
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUpScreen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(" "),
            FilledButton(onPressed: _onSubmit,child: Text('',)),

          
            ]
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
        'name': 'phuc899',
        'email': 'mmbeo',
        'password': '123',
      };
    //tao 1instance sau do luu formData vao state
      ref.read(signUpControllerProvider.notifier).setFormData(formData);
      // sign up - call api
      ref.read(signUpControllerProvider.notifier).signUp();
    }
  }
}