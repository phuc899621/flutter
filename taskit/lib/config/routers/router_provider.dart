import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/routers/router_name.dart';
import 'package:taskit/features/signup/presentation/ui/signup_veriry_page.dart';

import '../../features/login/presentation/ui/login_page.dart';
import '../../features/signup/presentation/ui/signup_page.dart';

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
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: '/signup',
            name: signUpRoute,
            pageBuilder: (context, state) => CustomTransitionPage(
                child: SignupPage(),
                transitionDuration: const Duration(milliseconds: 800),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final curved = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                  );
                  return SlideTransition(
                        position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                    ).animate(curved),
                    child: child,
                  );
            },
          ),
          ),
          GoRoute(
            path: '/signup_verify',
            name: signUpVerifyRoute,
            builder: (context, state) => const SignupVerifyPage(),
          ),

        ],
      );
    });