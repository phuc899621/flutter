import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskit/features/auth/presentation/login/ui/login_form.dart';

import '../../../../../config/app/app_color.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor(context).primaryContainer,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: AppColor(context).secondaryContainer,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(4, 4),
                          spreadRadius: 1.0,
                        )
                      ]),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/taskit_icon.svg',
                      width: 60,
                      height: 60,
                    ),
                  )),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
