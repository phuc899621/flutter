import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/taskit_icon.svg',
                width: 150,
                height: 150,
              ),
              Lottie.asset(
                'assets/lottie/loading_anim.json',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
