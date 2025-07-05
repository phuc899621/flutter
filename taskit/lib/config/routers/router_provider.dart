import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_sheets/smooth_sheets.dart';
import 'package:taskit/config/routers/router_name.dart';
import 'package:taskit/features/auth/presentation/forgot_password/ui/reset_password_page.dart';
import 'package:taskit/features/auth/presentation/signup/ui/signup_veriry_page.dart';
import 'package:taskit/features/main/presentation/ai/ui/ai_page.dart';
import 'package:taskit/features/main/presentation/home/ui/home_page.dart';
import 'package:taskit/features/main/presentation/list/ui/list_page.dart';
import 'package:taskit/features/main/presentation/main/ui/bottom_sheet/task_generated_bottom_sheet.dart';
import 'package:taskit/features/splash/presentation/ui/splash_page.dart';
import 'package:taskit/features/task/presentation/add_task/ui/add_task_page.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/edit_due_date_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/edit_due_time_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/edit_subtasks_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/edit_task_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/edit_task/ui/sheet_shell.dart';
import 'package:taskit/features/task/presentation/filter_task/ui/category_filter_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/filter_task/ui/end_date_filter_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/filter_task/ui/filter_bottom_sheet.dart';

import '../../features/auth/presentation/forgot_password/ui/forgot_password_page.dart';
import '../../features/auth/presentation/forgot_password/ui/forgot_password_verify_page.dart';
import '../../features/auth/presentation/login/ui/login_page.dart';
import '../../features/auth/presentation/signup/ui/signup_page.dart';
import '../../features/main/presentation/main/ui/main_page.dart';
import '../../features/main/presentation/timeline/ui/timeline_page.dart';
import '../../features/task/presentation/filter_task/ui/date_filter_bottom_sheet.dart';
import '../../features/task/presentation/filter_task/ui/priority_filter_bottom_sheet.dart';
import '../../features/task/presentation/filter_task/ui/start_date_filter_bottom_sheet.dart';
import '../app/animation/router_anim.dart';

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
final navigationShellProvider =
    Provider<StatefulNavigationShell>((ref) => throw UnimplementedError());

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
              routes: [
                GoRoute(
                  path: 'reset',
                  name: forgotPasswordResetRoute,
                  pageBuilder: (context, state) =>
                      TaskitAnimation.slidePageTransition(
                          context, state, const ResetPasswordPage()),
                ),
              ]),
        ],
      ),
      GoRoute(
        path: '/add_task',
        name: addTaskRoute,
        pageBuilder: (context, state) => TaskitAnimation.slidePageTransition(
            context, state, const AddTaskPage()),
      ),
      ShellRoute(
          navigatorKey: ref.watch(editTaskNavigatorKeyProvider),
          pageBuilder: (context, state, navigator) => ModalSheetPage(
                swipeDismissible: true,
                viewportPadding: EdgeInsets.only(
                  // Add the top padding to avoid the status bar.
                  top: MediaQuery.viewPaddingOf(context).top,
                ),
                child: SheetShell(
                  navigator: navigator,
                ),
              ),
          routes: [
            GoRoute(
                path: '/edit_task',
                pageBuilder: (context, state) {
                  final localId = state.extra as int;
                  return PagedSheetPage(
                      transitionsBuilder: _fadeAndSlideTransition,
                      child: EditTaskBottomSheet(localId: localId));
                },
                routes: [
                  GoRoute(
                      path: 'due_date',
                      pageBuilder: (context, state) {
                        return PagedSheetPage(
                            transitionsBuilder: _fadeAndSlideTransition,
                            child: EditDueDateBottomSheet());
                      }),
                  GoRoute(
                      path: 'due_time',
                      pageBuilder: (context, state) {
                        return PagedSheetPage(
                            transitionsBuilder: _fadeAndSlideTransition,
                            child: EditDueTimeBottomSheet());
                      }),
                  GoRoute(
                      path: 'subtasks',
                      pageBuilder: (context, state) {
                        return PagedSheetPage(
                            transitionsBuilder: _fadeAndSlideTransition,
                            child: EditSubtasksBottomSheet());
                      })
                ]),
          ]),
      ShellRoute(
          navigatorKey: ref.watch(filteringTaskNavigatorKeyProvider),
          pageBuilder: (context, state, navigator) => ModalSheetPage(
                swipeDismissible: true,
                viewportPadding: EdgeInsets.only(
                  // Add the top padding to avoid the status bar.
                  top: MediaQuery.viewPaddingOf(context).top,
                ),
                child: SheetShell(
                  navigator: navigator,
                ),
              ),
          routes: [
            GoRoute(
                path: '/filter',
                pageBuilder: (context, state) {
                  return PagedSheetPage(
                      transitionsBuilder: _fadeAndSlideTransition,
                      child: FilterBottomSheet());
                },
                routes: [
                  GoRoute(
                      path: 'category',
                      pageBuilder: (context, state) {
                        return PagedSheetPage(
                            transitionsBuilder: _fadeAndSlideTransition,
                            child: CategoryFilterBottomSheet());
                      }),
                  GoRoute(
                      path: 'priority',
                      pageBuilder: (context, state) {
                        return PagedSheetPage(
                            transitionsBuilder: _fadeAndSlideTransition,
                            child: PriorityFilterBottomSheet());
                      }),
                  GoRoute(
                      path: 'date',
                      pageBuilder: (context, state) {
                        return PagedSheetPage(
                            transitionsBuilder: _fadeAndSlideTransition,
                            child: DateFilterBottomSheet());
                      },
                      routes: [
                        GoRoute(
                            path: 'start',
                            pageBuilder: (context, state) {
                              return PagedSheetPage(
                                  transitionsBuilder: _fadeAndSlideTransition,
                                  child: StartDateFilterBottomSheet());
                            }),
                        GoRoute(
                            path: 'end',
                            pageBuilder: (context, state) {
                              return PagedSheetPage(
                                  transitionsBuilder: _fadeAndSlideTransition,
                                  child: EndDateFilterBottomSheet());
                            }),
                      ]),
                ]),
          ]),
      ShellRoute(
          navigatorKey: ref.watch(taskGenerateNavigatorKeyProvider),
          pageBuilder: (context, state, navigator) => ModalSheetPage(
                swipeDismissible: true,
                viewportPadding: EdgeInsets.only(
                  // Add the top padding to avoid the status bar.
                  top: MediaQuery.viewPaddingOf(context).top,
                ),
                child: SheetShell(
                  navigator: navigator,
                ),
              ),
          routes: [
            GoRoute(
              path: '/voice',
              pageBuilder: (context, state) {
                return PagedSheetPage(
                    transitionsBuilder: _fadeAndSlideTransition,
                    child: TaskGenerateBottomSheet());
              },
            ),
          ]),
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
                  routes: []),
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
                path: '/timeline',
                name: timelineRoute,
                pageBuilder: (context, state) =>
                    TaskitAnimation.slidePageTransition(
                        context, state, const TimelinePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/ai',
                  name: aiRoute,
                  pageBuilder: (context, state) =>
                      TaskitAnimation.slidePageTransition(
                          context, state, const AiPage())),
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
