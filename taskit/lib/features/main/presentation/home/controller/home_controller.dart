import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/main/presentation/home/state/home_state.dart';
import 'package:taskit/features/task/application/task_service.dart';
import 'package:taskit/shared/extension/date_time.dart';

import '../../../../../shared/log/logger_provider.dart';
import '../../../../task/domain/entities/task_entity.dart';
import '../../../../user/presentation/providers/user_provider.dart';

final homeControllerProvider =
    NotifierProvider.autoDispose<HomeController, HomeState>(HomeController.new);

class HomeController extends Notifier<HomeState> {
  StreamSubscription? _todaySub;
  StreamSubscription? _tomorrowSub;
  StreamSubscription? _thisWeekSub;
  StreamSubscription? _todayOverDueSub;
  StreamSubscription? _thisWeekOverDueSub;
  StreamSubscription? _pendingSub;
  StreamSubscription? _completedTodaySub;
  StreamSubscription? _completedThisWeekSub;

  StreamSubscription? _userSub;
  StreamSubscription? _timeSub;
  late final ProviderSubscription _authSub;

  late final DateTime _lastCheckTime;

  @override
  HomeState build() {
    _lastCheckTime = DateTime.now().toStartOfDay();
    ref.listen(currentUserProvider, (previous, next) {
      next.whenData((user) {
        logger.d("[HomeController] User name: ${user?.name}");
        state = state.copyWith(userName: user?.name ?? 'User');
      });
    });
    _authSub = ref.listen(
      authControllerProvider.select((value) => value.user),
      (_, next) {
        if (next == null) {
          _cancelStreams();
        } else {
          _startTaskListening(next.localId);
        }
      },
    );
    ref.onDispose(() {
      _authSub.close();
      _cancelStreams();
    });
    return HomeState();
  }

  void _cancelStreams() {
    _todaySub?.cancel();
    _tomorrowSub?.cancel();
    _thisWeekSub?.cancel();
    _todayOverDueSub?.cancel();
    _thisWeekOverDueSub?.cancel();
    _pendingSub?.cancel();
    _completedTodaySub?.cancel();
    _completedThisWeekSub?.cancel();
    _timeSub?.cancel();
  }

  void logout() async {
    logger.i("Logout at home page");
    await ref.read(authControllerProvider.notifier).logout();
  }

  void _restartListening(int userLocalId) {
    _todaySub?.cancel();
    _tomorrowSub?.cancel();
    _thisWeekSub?.cancel();
    _todayOverDueSub?.cancel();
    _thisWeekOverDueSub?.cancel();
    _pendingSub?.cancel();
    _completedTodaySub?.cancel();
    _completedThisWeekSub?.cancel();
    _startTaskListening(userLocalId);
  }

  void onTimeChecker(DateTime now) {
    if (!now.isSameDay(_lastCheckTime)) {
      _lastCheckTime = now.toStartOfDay();
      final userLocalId = ref.read(
        authControllerProvider.select((value) => value.user?.localId),
      );
      if (userLocalId == null) return;
      _restartListening(userLocalId);
    }
  }

  void onCheck(int localId) {
    logger.i("Check $localId");
    final userLocalId = ref.read(
      authControllerProvider.select((value) => value.user?.localId),
    );
    if (userLocalId == null) return;
    ref.read(taskServiceProvider).updateTaskStatus(localId, userLocalId);
  }

  void onSubtaskCheck(int localId) =>
      ref.read(taskServiceProvider).updateSubtaskStatus(localId);

  void onDelete(int localId) =>
      ref.read(taskServiceProvider).deleteTask(localId);

  void onSubtaskDelete(int localId) =>
      ref.read(taskServiceProvider).deleteSubtask(localId);

  void setSelectedTask(TaskEntity task) =>
      state = state.copyWith(selectedTask: task);

  void _startTaskListening(int userLocalId) {
    final taskService = ref.watch(taskServiceProvider);
    _todaySub = taskService.watchTodayTask(userLocalId).listen((tasks) {
      logger.i("Today Task: $tasks");
      state = state.copyWith(todayTasks: tasks);
    });
    _tomorrowSub = taskService.watchTomorrowTask(userLocalId).listen((tasks) {
      debugPrint("Tomorrow: $tasks");
      state = state.copyWith(tomorrowTasks: tasks);
    });
    _thisWeekSub = taskService.watchThisWeekTask(userLocalId).listen((tasks) {
      debugPrint("This Week: $tasks");
      state = state.copyWith(thisWeekTasks: tasks);
    });
    _todayOverDueSub = taskService.watchTodayOverDueTask(userLocalId).listen((
      tasks,
    ) {
      debugPrint("Over Due: $tasks");
      state = state.copyWith(todayOverDueTasks: tasks);
    });
    _thisWeekOverDueSub = taskService
        .watchThisWeekOverDueTask(userLocalId)
        .listen((tasks) {
          debugPrint("Over Due: $tasks");
          state = state.copyWith(thisWeekOverDueTasks: tasks);
        });
    _pendingSub = taskService.watchPendingTask(userLocalId).listen((tasks) {
      debugPrint("Pending: $tasks");
      state = state.copyWith(pendingTasks: tasks);
    });
    _completedTodaySub = taskService
        .watchCompletedTodayTask(userLocalId)
        .listen((tasks) {
          debugPrint("Completed Today: $tasks");
          state = state.copyWith(todayCompletedTasks: tasks);
        });
    _completedThisWeekSub = taskService
        .watchCompletedThisWeekTask(userLocalId)
        .listen((tasks) {
          debugPrint("Completed This Week: $tasks");
          state = state.copyWith(thisWeekCompletedTasks: tasks);
        });
  }
}
