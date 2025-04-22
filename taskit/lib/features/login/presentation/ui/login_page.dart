import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/login/presentation/ui/widget/login_form.dart';

import '../../../../config/app/app_color.dart';

class LoginPage extends ConsumerStatefulWidget{

  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_LoginPageState();
}
class _LoginPageState extends ConsumerState<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor(context).primaryContainer,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor(context).primaryContainer,
                  ),
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Container(
                            width: double.infinity,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: AppColor(context).primaryContainer,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'TASKIT ',
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ),
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                          ),
                          decoration: BoxDecoration(
                            color:AppColor(context).primaryContainer,
                          ),
                          child: LoginForm(),
                              ),
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