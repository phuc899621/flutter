import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/main/presentation/home/state/home_state.dart';
import 'package:taskit/features/task/application/task_service.dart';
import 'package:taskit/shared/extension/date_time.dart';

import '../../../../../shared/log/logger_provider.dart';
import '../../../../task/domain/entities/task_entity.dart';
import '../../../../user/application/user_service.dart';

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

  late final DateTime _lastCheckTime;

  @override
  HomeState build() {
    _lastCheckTime = DateTime.now().toStartOfDay();
    ref.onDispose(() {
      _todaySub?.cancel();
      _tomorrowSub?.cancel();
      _thisWeekSub?.cancel();
      _todayOverDueSub?.cancel();
      _thisWeekOverDueSub?.cancel();
      _pendingSub?.cancel();
      _completedTodaySub?.cancel();
      _completedThisWeekSub?.cancel();
      _userSub?.cancel();
      _timeSub?.cancel();
    });
    _startUserListening();
    _startTaskListening();
    return HomeState();
  }

  void _startUserListening() {
    final user = ref.watch(userServiceProvider);
    _userSub = user.watchUser().listen((user) {
      state = state.copyWith(userName: user.name);
    });
  }

  void logout() async {
    logger.i("Logout at home page");
    await ref.read(authControllerProvider.notifier).logout();
  }

  void _restartListening() {
    _todaySub?.cancel();
    _tomorrowSub?.cancel();
    _thisWeekSub?.cancel();
    _todayOverDueSub?.cancel();
    _thisWeekOverDueSub?.cancel();
    _pendingSub?.cancel();
    _completedTodaySub?.cancel();
    _completedThisWeekSub?.cancel();
    _startTaskListening();
  }

  void onTimeChecker(DateTime now) {
    if (!now.isSameDay(_lastCheckTime)) {
      _lastCheckTime = now.toStartOfDay();
      _restartListening();
    }
  }

  void onCheck(int localId) {
    logger.i("Check $localId");
    ref.read(taskServiceProvider).updateTaskStatus(localId);
  }

  void onSubtaskCheck(int localId) =>
      ref.read(taskServiceProvider).updateSubtaskStatus(localId);

  void onDelete(int localId) =>
      ref.read(taskServiceProvider).deleteTask(localId);

  void onSubtaskDelete(int localId) =>
      ref.read(taskServiceProvider).deleteSubtask(localId);

  void setSelectedTask(TaskEntity task) =>
      state = state.copyWith(selectedTask: task);

  void _startTaskListening() {
    final taskService = ref.watch(taskServiceProvider);
    final user = ref.watch(userServiceProvider);
    _todaySub = taskService.watchTodayTask().listen((tasks) {
      logger.i("Today Task: $tasks");
      state = state.copyWith(todayTasks: tasks);
    });
    _tomorrowSub = taskService.watchTomorrowTask().listen((tasks) {
      debugPrint("Tomorrow: $tasks");
      state = state.copyWith(tomorrowTasks: tasks);
    });
    _thisWeekSub = taskService.watchThisWeekTask().listen((tasks) {
      debugPrint("This Week: $tasks");
      state = state.copyWith(thisWeekTasks: tasks);
    });
    _todayOverDueSub = taskService.watchTodayOverDueTask().listen((tasks) {
      debugPrint("Over Due: $tasks");
      state = state.copyWith(todayOverDueTasks: tasks);
    });
    _thisWeekOverDueSub = taskService.watchThisWeekOverDueTask().listen((
      tasks,
    ) {
      debugPrint("Over Due: $tasks");
      state = state.copyWith(thisWeekOverDueTasks: tasks);
    });
    _pendingSub = taskService.watchPendingTask().listen((tasks) {
      debugPrint("Pending: $tasks");
      state = state.copyWith(pendingTasks: tasks);
    });
    _completedTodaySub = taskService.watchCompletedTodayTask().listen((tasks) {
      debugPrint("Completed Today: $tasks");
      state = state.copyWith(todayCompletedTasks: tasks);
    });
    _completedThisWeekSub = taskService.watchCompletedThisWeekTask().listen((
      tasks,
    ) {
      debugPrint("Completed This Week: $tasks");
      state = state.copyWith(thisWeekCompletedTasks: tasks);
    });
  }
}
