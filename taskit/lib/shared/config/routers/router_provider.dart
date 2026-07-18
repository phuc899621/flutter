import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_sheets/smooth_sheets.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/auth/presentation/forgot_password/ui/forgot_password_reset_page.dart';
import 'package:taskit/features/auth/presentation/signup/ui/signup_veriry_page.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';
import 'package:taskit/features/category/presentation/ui/pages/category_management_page.dart';
import 'package:taskit/features/main/presentation/ai/ui/ai_page.dart';
import 'package:taskit/features/main/presentation/home/ui/pages/home_page.dart';
import 'package:taskit/features/main/presentation/list/ui/list_page.dart';
import 'package:taskit/features/main/presentation/main/ui/bottom_sheet/task_generated_bottom_sheet.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/task/domain/entities/task_entity.dart';
import 'package:taskit/features/task/presentation/add_task/ui/pages/add_task_page.dart';
import 'package:taskit/features/task/presentation/add_task/ui/widgets/task_reminder_picker.dart';
import 'package:taskit/features/task/presentation/filter_task/ui/category_filter_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/filter_task/ui/end_date_filter_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/filter_task/ui/filter_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/add_subtask_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/edit_category_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/edit_description_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/edit_due_date_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/edit_due_time_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/edit_priority_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/edit_subtask_title_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/edit_subtasks_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/edit_title_bottom_sheet.dart';
import 'package:taskit/features/task/presentation/view_task/ui/pages/view_task_bottom_sheet.dart';
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
import '../../../features/task/presentation/view_task/ui/sheet_shell.dart';
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
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      //GoRoute(path: '/', builder: (context, state) => const TestPage()),
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
                top: MediaQuery.viewPaddingOf(context).top,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: child,
            );
          },
          child: SheetShell(navigator: navigator),
        ),
        routes: [
          GoRoute(
            path: '/view_task',
            pageBuilder: (context, state) {
              final localId = state.extra as int;
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: ViewTaskBottomSheet(localId: localId),
              );
            },
            routes: [
              GoRoute(
                path: 'subtasks',
                pageBuilder: (context, state) {
                  return PagedSheetPage(
                    transitionsBuilder: _fadeAndSlideTransition,
                    child: EditSubtasksBottomSheet(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'add',
                    pageBuilder: (context, state) {
                      final extra = state.extra as Map<String, dynamic>;
                      return PagedSheetPage(
                        transitionsBuilder: _fadeAndSlideTransition,
                        child: AddSubtaskBottomSheet(
                          title: extra['title'] as String,
                          validator:
                              extra['validator'] as String? Function(String?),
                          onConfirm:
                              extra['onConfirm'] as void Function(String),
                        ),
                      );
                    },
                  ),
                  GoRoute(
                    path: 'edit',
                    pageBuilder: (context, state) {
                      final extra = state.extra as Map<String, dynamic>;
                      return PagedSheetPage(
                        transitionsBuilder: _fadeAndSlideTransition,
                        child: EditSubtaskTitleBottomSheet(
                          entity: extra['entity'] as SubtaskEntity,
                          onConfirm:
                              extra['onConfirm']
                                  as void Function(SubtaskEntity),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/edit_task_title',
            pageBuilder: (context, state) {
              final title = state.extra as String;
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: EditTitleBottomSheet(title: title ?? ''),
              );
            },
          ),
          GoRoute(
            path: '/edit_task_description',
            pageBuilder: (context, state) {
              final description = state.extra as String;
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: EditDescriptionBottomSheet(
                  description: description ?? '',
                ),
              );
            },
          ),
          GoRoute(
            path: '/edit_task_priority',
            pageBuilder: (context, state) {
              final priority = state.extra as TaskPriority;
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: EditPriorityBottomSheet(priority: priority),
              );
            },
          ),
          GoRoute(
            path: '/edit_task_category',
            pageBuilder: (context, state) {
              final category = state.extra as CategoryEntity;
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: EditCategoryBottomSheet(categoryEntity: category),
              );
            },
          ),
          GoRoute(
            path: '/edit_due_date',
            pageBuilder: (context, state) {
              final dueDate = state.extra as DateTime?;
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: EditDueDateBottomSheet(dueDate: dueDate),
              );
            },
          ),
          GoRoute(
            path: '/edit_due_time',
            pageBuilder: (context, state) {
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: EditDueTimeBottomSheet(),
              );
            },
          ),
          GoRoute(
            path: '/edit_reminder',
            pageBuilder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              return PagedSheetPage(
                transitionsBuilder: _fadeAndSlideTransition,
                child: TaskReminderPicker(
                  title: extra['title'] as String,
                  dueDate: extra['dueDate'] as DateTime?,
                  initialRepeatType:
                      extra['initialRepeatType'] as ReminderRepeatType?,
                  initialReminderType:
                      extra['initialReminder'] as TaskReminderType?,
                  initialReminderOffset: extra['initialReminderOffset'] as int?,
                  initialReminderAt: extra['initialReminderAt'] as DateTime?,
                  onConfirm:
                      extra['onConfirm']
                          as Function({
                            TaskReminderType reminderType,
                            int? reminderOffset,
                            DateTime? reminderAt,
                            ReminderRepeatType repeatType,
                          }),
                ),
              );
            },
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
