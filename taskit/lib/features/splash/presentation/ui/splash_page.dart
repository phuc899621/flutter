import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../controller/splash_controller.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            'assets/svg/taskit_icon.svg',
            width: 150,
            height: 150,
          ),
          Lottie.asset(
            'assets/lottie/loading_anim.json',
            width: 200,
            height: 200,
          )
        ])),
      ),
    );
  }

  void _checkLogin() async {
    final delay = Future.delayed(const Duration(seconds: 4));
    final result = ref.read(splashControllerProvider.notifier).checkLogin();
    await Future.wait([delay, result]);
    final isExpired = ref
        .read(splashControllerProvider.select((value) => value.isLoginExpired));
    if (!mounted) return;
    if (isExpired == true) {
      context.go('/login');
    } else {
      context.go('/task');
    }
  }
}
