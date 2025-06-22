import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskit/config/routers/router_name.dart';
import 'package:taskit/features/auth/presentation/forgot_password/ui/reset_password_page.dart';
import 'package:taskit/features/auth/presentation/signup/ui/signup_veriry_page.dart';
import 'package:taskit/features/main/presentation/calendar/ui/calendar_page.dart';
import 'package:taskit/features/main/presentation/home/ui/home_page.dart';
import 'package:taskit/features/main/presentation/list/ui/list_page.dart';
import 'package:taskit/features/splash/presentation/ui/splash_page.dart';
import 'package:taskit/features/task/presentation/add_task/ui/add_task_page.dart';

import '../../features/auth/presentation/forgot_password/ui/forgot_password_page.dart';
import '../../features/auth/presentation/forgot_password/ui/forgot_password_verify_page.dart';
import '../../features/auth/presentation/login/ui/login_page.dart';
import '../../features/auth/presentation/signup/ui/signup_page.dart';
import '../../features/main/presentation/main/ui/main_page.dart';
import '../../features/main/presentation/setting/ui/setting_page.dart';
import '../app/animation/router_anim.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        name: loginRoute,
        pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
            context, state, const LoginPage()),
      ),
      GoRoute(
          path: '/signup',
          name: signUpRoute,
          pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
              context, state, const SignupPage()),
          routes: [
            GoRoute(
              path: 'verify',
              name: signUpVerifyRoute,
              pageBuilder: (context, state) =>
                  TaskitAnimation.slidePageTransition(
                      context, state, const SignupVerifyPage()),
            )
          ]),
      GoRoute(
        path: '/forgot_password',
        name: forgotPasswordRoute,
        pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
            context, state, const ForgotPasswordPage()),
        routes: [
          GoRoute(
            path: 'verify',
            name: forgotPasswordVerifyRoute,
            pageBuilder: (context, state) =>
                TaskitAnimation.slidePageTransition(
                    context, state, const ForgotPasswordVerifyPage()),
          ),
          GoRoute(
            path: 'reset',
            name: forgotPasswordResetRoute,
            pageBuilder: (context, state) =>
                TaskitAnimation.slidePageTransition(
                    context, state, const ResetPasswordPage()),
          ),
        ],
      ),
      GoRoute(
        path: '/add_task',
        name: addTaskRoute,
        pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
            context, state, const AddTaskPage()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: homeRoute,
                pageBuilder: (context, state) =>
                    TaskitAnimation.slidePageTransition(
                        context, state, const HomePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/list',
                name: listRoute,
                pageBuilder: (context, state) =>
                    TaskitAnimation.slidePageTransition(
                        context, state, const ListPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/calendar',
                name: calendarRoute,
                pageBuilder: (context, state) =>
                    TaskitAnimation.slidePageTransition(
                        context, state, const CalendarPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/setting',
                  name: settingRoute,
                  pageBuilder: (context, state) =>
                      TaskitAnimation.slidePageTransition(
                          context, state, const SettingPage())),
            ],
          ),
        ],
      ),
    ],
  );
});
