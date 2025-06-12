import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/home/state/home_state.dart';
import 'package:taskit/features/task/application/task_service.dart';

final homeControllerProvider =
    NotifierProvider<HomeController, HomeState>(HomeController.new);

class HomeController extends Notifier<HomeState> {
  late final StreamSubscription _taskSub;
  late final StreamSubscription _scheduledTaskSub;
  @override
  HomeState build() {
    _startListening();
    return HomeState();
  }

  void _startListening() {
    final taskService = ref.watch(taskServiceProvider);
    _taskSub = taskService.watchAllTasks().listen((tasks) {
      debugPrint("tasks: $tasks");
      state = state.copyWith(allTasks: tasks);
    });
    _scheduledTaskSub = taskService.watchScheduledTasks().listen((tasks) {
      debugPrint("scheduled tasks: $tasks");
      state = state.copyWith(scheduledTasks: tasks);
    });
  }
}
