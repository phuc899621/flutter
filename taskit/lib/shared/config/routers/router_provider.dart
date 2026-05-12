import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_sheets/smooth_sheets.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/auth/presentation/forgot_password/ui/forgot_password_reset_page.dart';
import 'package:taskit/features/auth/presentation/signup/ui/signup_veriry_page.dart';
import 'package:taskit/features/category/presentation/ui/pages/category_management_page.dart';
import 'package:taskit/features/main/presentation/ai/ui/ai_page.dart';
import 'package:taskit/features/main/presentation/home/ui/home_page.dart';
import 'package:taskit/features/main/presentation/list/ui/list_page.dart';
import 'package:taskit/features/main/presentation/main/ui/bottom_sheet/task_generated_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/add_task/ui/add_task_page.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/edit_due_date_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/edit_due_time_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/edit_subtasks_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/edit_task_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/sheet_shell.dart';
import 'package:taskit/features/task/presentation/filter_task/ui/category_filter_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/filter_task/ui/end_date_filter_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/filter_task/ui/filter_bottom_sheet.dart';
import 'package:taskit/shared/config/routers/router_name.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../features/auth/presentation/auth/ui/splash_page.dart';
import '../../../features/auth/presentation/forgot_password/ui/forgot_password_page.dart';
import '../../../features/auth/presentation/forgot_password/ui/forgot_password_verify_page.dart';
import '../../../features/auth/presentation/login/ui/login_page.dart';
import '../../../features/auth/presentation/signup/ui/signup_page.dart';
import '../../../features/main/presentation/main/ui/main_page.dart';
import '../../../features/main/presentation/timeline/ui/timeline_page.dart';
import '../../../features/task/presentation/filter_task/ui/date_filter_bottom_sheet.dart';
import '../../../features/task/presentation/filter_task/ui/priority_filter_bottom_sheet.dart';
import '../../../features/task/presentation/filter_task/ui/start_date_filter_bottom_sheet.dart';
import '../../constants/auth_status.dart';
import '../app/animation/router_anim.dart';

int i = 0;
final editTaskNavigatorKeyProvider = Provider.autoDispose((ref) {
  return GlobalKey<NavigatorState>();
});
final filteringTaskNavigatorKeyProvider = Provider.autoDispose((ref) {
  return GlobalKey<NavigatorState>();
});
final taskGenerateNavigatorKeyProvider = Provider.autoDispose((ref) {
  return GlobalKey<NavigatorState>();
});
final categoryNavigationKeyProvider = Provider.autoDispose((ref) {
  return GlobalKey<NavigatorState>();
});
final navigationShellProvider = Provider<StatefulNavigationShell>(
  (ref) => throw UnimplementedError(),
);

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen(authControllerProvider, (previous, next) {
      logger.w('RouterNotifier: authControllerProvider: $next');
      if (previous?.status != next.status) {
        logger.w('RouterNotifier: authControllerProvider: status changed');
        notifyListeners();
      }
    });
  }
}

final routerNotifierProvider = Provider((ref) => RouterNotifier(ref));
final goRouterProvider = Provider<GoRouter>((ref) {
  final routerNotifier = ref.watch(routerNotifierProvider);
  return GoRouter(
    initialLocation: '/',
    refreshListenable: routerNotifier,
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      logger.i(
        'state.matchedLocation: ${state.matchedLocation} and authStatus: ${authState.status}',
      );
      final isAuthRoute =
          state.matchedLocation.startsWith('/login') ||
          state.matchedLocation.startsWith('/signup') ||
          state.matchedLocation.startsWith('/forgot_password');
      final status = authState.status;
      logger.i('status1: $status');
      if (status == AuthStatus.initial) return null;
      logger.i('status2: $status');
      if (status == AuthStatus.unauthenticated && !isAuthRoute) {
        logger.i('status3: $status');
        return '/login';
      }
      if (status == AuthStatus.authenticated &&
          (isAuthRoute || state.matchedLocation == '/')) {
        logger.i('status4: $status');
        return '/home';
      }
      return null;
    },
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const CategoryManagementPage(),
      // ),
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/category',
        name: RouteName.category,
        pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
          context,
          state,
          const CategoryManagementPage(),
        ),
      ),
      GoRoute(
        path: '/login',
        name: RouteName.login,
        pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
          context,
          state,
          const LoginPage(),
        ),
      ),
      GoRoute(
        path: '/signup',
        name: RouteName.signup,
        pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
          context,
          state,
          const SignupPage(),
        ),
        routes: [
          GoRoute(
            path: 'verify',
            name: RouteName.signupVerify,
            pageBuilder: (context, state) =>
                TaskitAnimation.slidePageTransition(
                  context,
                  state,
                  const SignupVerifyPage(),
                ),
          ),
        ],
      ),
      GoRoute(
        path: '/forgot_password',
        name: RouteName.forgotPassword,
        pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
          context,
          state,
          const ForgotPasswordPage(),
        ),
        routes: [
          GoRoute(
            path: 'verify',
            name: RouteName.forgotPasswordVerify,
            pageBuilder: (context, state) =>
                TaskitAnimation.slidePageTransition(
                  context,
                  state,
                  const ForgotPasswordVerifyPage(),
                ),
            routes: [
              GoRoute(
                path: 'reset',
                name: RouteName.forgotPasswordReset,
                pageBuilder: (context, state) =>
                    TaskitAnimation.slidePageTransition(
                      context,
                      state,
                      const ForgotPasswordResetPage(),
                    ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/add_task',
        name: RouteName.addTask,
        pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
          context,
          state,
          const AddTaskPage(),
        ),
      ),
      ShellRoute(
        navigatorKey: ref.watch(editTaskNavigatorKeyProvider),
        pageBuilder: (context, state, navigator) => ModalSheetPage(
          swipeDismissible: true,
          viewportBuilder: (context, child) {
            return SheetViewport(
              padding: EdgeInsets.only(
                // Add the top padding to avoid the status bar.
                top: MediaQuery.viewPaddingOf(context).top,
              ),
              child: child,
            );
          },
          child: SheetShell(navigator: navigator),
        ),
        routes: [
          GoRoute(
            path: '/edit_task',
            pageBuilder: (context, state) {
              final localId = state.extra as int;
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: EditTaskBottomSheet(localId: localId),
              );
            },
            routes: [
              GoRoute(
                path: 'due_date',
                pageBuilder: (context, state) {
                  return PagedSheetPage(
                    transitionsBuilder: _fadeAndSlideTransition,
                    child: EditDueDateBottomSheet(),
                  );
                },
              ),
              GoRoute(
                path: 'due_time',
                pageBuilder: (context, state) {
                  return PagedSheetPage(
                    transitionsBuilder: _fadeAndSlideTransition,
                    child: EditDueTimeBottomSheet(),
                  );
                },
              ),
              GoRoute(
                path: 'subtasks',
                pageBuilder: (context, state) {
                  return PagedSheetPage(
                    transitionsBuilder: _fadeAndSlideTransition,
                    child: EditSubtasksBottomSheet(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: ref.watch(filteringTaskNavigatorKeyProvider),
        pageBuilder: (context, state, navigator) => ModalSheetPage(
          swipeDismissible: true,
          viewportBuilder: (context, child) {
            return SheetViewport(
              padding: EdgeInsets.only(
                top: MediaQuery.viewPaddingOf(context).top,
              ),
              child: child,
            );
          },
          child: SheetShell(navigator: navigator),
        ),
        routes: [
          GoRoute(
            path: '/filter',
            pageBuilder: (context, state) {
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: FilterBottomSheet(),
              );
            },
            routes: [
              GoRoute(
                path: 'category',
                pageBuilder: (context, state) {
                  return PagedSheetPage(
                    transitionsBuilder: _fadeAndSlideTransition,
                    child: CategoryFilterBottomSheet(),
                  );
                },
              ),
              GoRoute(
                path: 'priority',
                pageBuilder: (context, state) {
                  return PagedSheetPage(
                    transitionsBuilder: _fadeAndSlideTransition,
                    child: PriorityFilterBottomSheet(),
                  );
                },
              ),
              GoRoute(
                path: 'date',
                pageBuilder: (context, state) {
                  return PagedSheetPage(
                    transitionsBuilder: _fadeAndSlideTransition,
                    child: DateFilterBottomSheet(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'start',
                    pageBuilder: (context, state) {
                      return PagedSheetPage(
                        transitionsBuilder: _fadeAndSlideTransition,
                        child: StartDateFilterBottomSheet(),
                      );
                    },
                  ),
                  GoRoute(
                    path: 'end',
                    pageBuilder: (context, state) {
                      return PagedSheetPage(
                        transitionsBuilder: _fadeAndSlideTransition,
                        child: EndDateFilterBottomSheet(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: ref.watch(taskGenerateNavigatorKeyProvider),
        pageBuilder: (context, state, navigator) => ModalSheetPage(
          swipeDismissible: true,
          viewportBuilder: (context, child) {
            return SheetViewport(
              padding: EdgeInsets.only(
                // Add the top padding to avoid the status bar.
                top: MediaQuery.viewPaddingOf(context).top,
              ),
              child: child,
            );
          },
          child: SheetShell(navigator: navigator),
        ),
        routes: [
          GoRoute(
            path: '/voice',
            pageBuilder: (context, state) {
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: TaskGenerateBottomSheet(),
              );
            },
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: RouteName.home,
                pageBuilder: (context, state) =>
                    TaskitAnimation.slidePageTransition(
                      context,
                      state,
                      const HomePage(),
                    ),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/list',
                name: RouteName.list,
                pageBuilder: (context, state) =>
                    TaskitAnimation.slidePageTransition(
                      context,
                      state,
                      const ListPage(),
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/timeline',
                name: RouteName.timeline,
                pageBuilder: (context, state) =>
                    TaskitAnimation.slidePageTransition(
                      context,
                      state,
                      const TimelinePage(),
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/ai',
                name: RouteName.ai,
                pageBuilder: (context, state) =>
                    TaskitAnimation.slidePageTransition(
                      context,
                      state,
                      const AiPage(),
                    ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

Widget _fadeAndSlideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
  return FadeTransition(
    opacity: CurveTween(curve: Curves.easeInExpo).animate(animation),
    child: FadeTransition(
      opacity: Tween(begin: 1.0, end: 0.0)
          .chain(CurveTween(curve: Curves.easeOutExpo))
          .animate(secondaryAnimation),
      child: theme.buildTransitions(
        ModalRoute.of(context) as PageRoute,
        context,
        animation,
        secondaryAnimation,
        child,
      ),
    ),
  );
}
