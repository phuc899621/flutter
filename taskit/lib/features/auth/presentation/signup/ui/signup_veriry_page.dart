import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/signup/ui/signup_verify_form.dart';

class SignupVerifyPage extends ConsumerStatefulWidget {
  const SignupVerifyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignupVerifyPageState();
}

class _SignupVerifyPageState extends ConsumerState<SignupVerifyPage> {
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.surface,
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
                  color: color.surface,
                ),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: const SignupVerifyForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
