import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/app/routers/router_name.dart';

import '../../features/login/presentation/pages/login_page.dart';
import '../../features/signup/presentation/pages/signup_page.dart';

// Provider GoRouter để quản lý việc điều hướng trong ứng dụng
final goRouterProvider = Provider<GoRouter>(
        (ref){
      return GoRouter(
        //URL mặc định khi ứng dụng mở lần đầu
        initialLocation: '/signup',


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
            builder: (context, state) => const SignupPage(),
          ),

        ],
      );
    });