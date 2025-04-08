import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/signup/presentation/ui/widget/back_button.dart';
import 'package:taskit/features/signup/presentation/ui/widget/signup_button.dart';
import 'package:taskit/features/signup/presentation/ui/widget/signup_form.dart';
import 'package:taskit/shared/extension/string_hardcoded.dart';

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

    return Scaffold(
      body: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
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
                    color: Theme.of(context).colorScheme.secondaryContainer,
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
                            color: Theme.of(context).colorScheme.secondaryContainer,
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
                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: SignUpBackButton(onPressed: (){}),
                              ),
                            ],
                          ),
                        ),
                        const SignupForm(),
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


}