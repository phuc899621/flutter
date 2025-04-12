import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/signup/presentation/ui/widget/signup_verify_form.dart';

class SignupVerifyPage extends ConsumerStatefulWidget{
  const SignupVerifyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_SignupVerifyPageState();

}

class _SignupVerifyPageState extends ConsumerState<SignupVerifyPage>{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                  child: SignupVerifyForm(),
                ),
              ),
            ],
          ),
        ),
    );
    }

}