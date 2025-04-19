import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/features/forgot_password/presentation/ui/widget/forgot_password_form.dart';
import 'package:taskit/shared/presentation/widget/custom_taskit_button.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget{
  const ForgotPasswordPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ForgotPasswordPageState();
}
class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 570.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 32.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondaryContainer,
                              ),
                            ),
                            TaskitBackButton(onPressed: ()=>context.pop())
                          ],
                        ),
                      ),
                      ForgotPasswordForm(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}