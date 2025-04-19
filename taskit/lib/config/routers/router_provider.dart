import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/routers/router_name.dart';
import 'package:taskit/features/signup/presentation/ui/signup_veriry_page.dart';

import '../../features/forgot_password/presentation/ui/forgot_password_page.dart';
import '../../features/login/presentation/ui/login_page.dart';
import '../../features/signup/presentation/ui/signup_page.dart';
import '../app/animation/router_anim.dart';

// Provider GoRouter để quản lý việc điều hướng trong ứng dụng
final goRouterProvider = Provider<GoRouter>(
        (ref){
      return GoRouter(
        //URL mặc định khi ứng dụng mở lần đầu
        initialLocation: '/login',


        // Định nghĩa các routes của ứng dụng
        routes: [
          GoRoute(
            path: '/login',
            name: loginRoute,
            pageBuilder: (context, state) =>
                TaskitAnimation.slidePageTransition(context, state, const LoginPage()),
          ),
          GoRoute(
            path: '/signup',
            name: signUpRoute,
            pageBuilder: (context, state) =>
                TaskitAnimation.slidePageTransition(context, state, const SignupPage()),
          ),
          GoRoute(
            path: '/signup_verify',
            name: signUpVerifyRoute,
            pageBuilder: (context, state) =>
                TaskitAnimation.slidePageTransition(context, state, const SignupVerifyPage()),
          ),
          GoRoute(
            path: '/forgot_password',
            name: forgotPasswordRoute,
            pageBuilder: (context, state) =>
                TaskitAnimation.slidePageTransition(context, state, const ForgotPasswordPage()),
          ),

        ],
      );
    });