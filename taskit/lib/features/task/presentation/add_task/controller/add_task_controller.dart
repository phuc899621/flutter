import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../application/task_service.dart';
import '../../../domain/entities/category_entity.dart';
import '../state/add_task_state.dart';

final addTaskControllerProvider =
    AutoDisposeNotifierProvider<AddTaskController, AddTaskState>(
        AddTaskController.new);

class AddTaskController extends AutoDisposeNotifier<AddTaskState> {
  late final StreamSubscription _categorySub;

  @override
  AddTaskState build() {
    _startListening();
    return const AddTaskState();
  }

  void setTitle(String s) {
    state = state.copyWith(title: s);
  }

  void setDescription(String s) {
    state = state.copyWith(description: s);
  }

  void setSelectedCategory(CategoryEntity category) {
    state = state.copyWith(selectedCategory: category);
  }

  void setSelectedPriority(TaskPriority s) {
    state = state.copyWith(selectedPriority: s);
  }

  void setSelectedDate(DateTime? s) {
    state = state.copyWith(selectedDate: s);
    if (s == null) state = state.copyWith(isTimeSelected: null);
  }

  void removeSelectedDate() {
    state = state.copyWith(selectedDate: null, isTimeSelected: false);
  }

  void setSelectedTime(TimeOfDay? s) {
    if (state.selectedDate == null) return;
    if (s == null) {
      state = state.copyWith(isTimeSelected: false);
      return;
    }
    state = state.copyWith(
        selectedDate:
            state.selectedDate!.copyWith(hour: s.hour, minute: s.minute));
  }

  Future<void> updateAiCategory(String title) async {
    debugPrintStack(stackTrace: StackTrace.current, label: 'aiCategories');
    state = state.copyWith(isCategoriesLoading: true);
    final taskService = ref.read(taskServiceProvider);
    final result = await taskService.getAICategory(title);
    result.when((aiCategories) {
      debugPrintStack(stackTrace: StackTrace.current, label: 'aiCategories');
      state = state.copyWith(aiCategories: aiCategories);
      if (aiCategories.contains(state.selectedCategory) ||
          state.categories.contains(state.selectedCategory)) {
        return;
      }
      state = state.copyWith(selectedCategory: state.categories.first);
    }, (failure) {
      debugPrintStack(stackTrace: StackTrace.current, label: 'aiCategories');
      state = state.copyWith(aiCategories: []);
    });
    state = state.copyWith(isCategoriesLoading: false);
  }

  void removeSelectedTime() {
    state = state.copyWith(isTimeSelected: false);
  }

  void _startListening() {
    logger.i('Category._startListening');
    final taskService = ref.watch(taskServiceProvider);
    _categorySub = taskService.watchAllCategories().listen((categories) {
      state = state.copyWith(categories: categories);
      if (state.selectedCategory == null) {
        state = state.copyWith(
            selectedCategory: categories
                .where((element) => element.name.toLowerCase() == 'any')
                .first);
      }
    });
  }

  Future<void> addTask() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 4));
    state = state.copyWith(isLoading: false);
  }
}
