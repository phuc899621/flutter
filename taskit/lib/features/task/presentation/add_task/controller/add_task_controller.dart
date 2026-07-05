import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/category/domain/usecases/create_category_usecase.dart';
import 'package:taskit/features/category/presentation/ui/providers/categories_provider.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/task/domain/usecases/task/create_task_usecase.dart';
import 'package:taskit/features/user/presentation/providers/user_provider.dart';

import '../../../../category/domain/entities/category_entity.dart';
import '../../../../category/domain/usecases/validate_category_input_usecase.dart';
import '../../../domain/entities/task_entity.dart';
import '../state/add_task_state.dart';

final addTaskControllerProvider =
    NotifierProvider.autoDispose<AddTaskController, AddTaskState>(
      AddTaskController.new,
    );

class AddTaskController extends Notifier<AddTaskState> {
  @override
  AddTaskState build() {
    ref.listen(categoriesProvider, (_, next) {
      next.whenData((categories) {
        if (categories.isEmpty) return;
        state = state.copyWith(
          categories: categories,
          status: AddTaskStatus.initial,
        );
        if (state.selectedCategory == null) {
          final defaultCategories = categories.firstWhere(
            (e) => e.isDefault,
            orElse: () => categories.first,
          );
          state = state.copyWith(selectedCategory: defaultCategories);
        }
      });
    });
    return AddTaskState();
  }

  void setSelectedCategory(CategoryEntity category) {
    state = state.copyWith(selectedCategory: category);
  }

  void setSelectedPriority(TaskPriority s) {
    state = state.copyWith(selectedPriority: s);
  }

  void setSelectedDate(DateTime? s) {
    state = state.copyWith(selectedDate: s);
    if (s == null) state = state.copyWith(isTimeSelected: false);
  }

  void removeSelectedDate() {
    if (state.reminderType == TaskReminderType.beforeDeadline) {
      state = state.copyWith(
        selectedDate: null,
        isTimeSelected: false,
        reminderType: TaskReminderType.none,
      );
    } else {
      state = state.copyWith(selectedDate: null, isTimeSelected: false);
    }
  }

  String? validateCategoryInput(String value) => ref
      .read(validateCategoryInputUseCaseProvider)
      .call(ValidateCategoryInputParams(value, state.categories));

  void onDeleteSubtask(int index) {
    final updatedSubtasks = [...state.subtasks];
    updatedSubtasks.removeAt(index);
    state = state.copyWith(subtasks: updatedSubtasks);
  }

  void onSetReminder({
    DateTime? reminderAt,
    int? reminderOffset,
    TaskReminderType reminderType = TaskReminderType.none,
    ReminderRepeatType repeatType = ReminderRepeatType.none,
  }) {
    state = state.copyWith(
      reminderOffset: reminderOffset,
      reminderAt: reminderAt,
      reminderType: reminderType,
      repeatType: repeatType,
    );
  }

  void setSelectedTime(TimeOfDay? s) {
    if (state.selectedDate == null) return;
    if (s == null) {
      state = state.copyWith(isTimeSelected: false);
      return;
    }
    state = state.copyWith(
      isTimeSelected: true,
      selectedDate: state.selectedDate!.copyWith(
        hour: s.hour,
        minute: s.minute,
      ),
    );
  }

  void onAddCategory(String name) async {
    final user = ref.read(currentUserProvider).value;
    if (user == null) return;
    final category = CategoryEntity.insert(
      name: name,
      userLocalId: user.localId,
    );
    ref.read(createCategoryUseCaseProvider).call(category);
  }

  void onAddSubtask(String title) async {
    final user = ref.read(currentUserProvider).value;
    if (user == null) return;
    final subtask = SubtaskEntity.insert(title, -1);
    state = state.copyWith(subtasks: [...state.subtasks, subtask]);
  }

  void onEditSubtask(SubtaskEntity entity, int index) async {
    final subtasks = [...state.subtasks];
    subtasks[index] = entity;
    state = state.copyWith(subtasks: subtasks);
  }

  void removeSelectedTime() {
    state = state.copyWith(isTimeSelected: false);
  }

  String? validateSubtaskInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Subtask title must not be empty';
    }
    return null;
  }

  Future<void> addTask(String title, String description) async {
    state = state.copyWith(apiError: null, status: AddTaskStatus.addLoading);
    final user = ref.read(currentUserProvider).value;
    if (user == null) return;
    final userLocalId = user.localId;
    final task = TaskEntity.insert(
      title: title,
      description: description,
      reminderType: state.reminderType,
      reminderOffset: state.reminderOffset,
      reminderAt: state.reminderAt,
      category:
          state.selectedCategory ??
          state.categories.where((e) => e.isDefault).first,
      priority: state.selectedPriority,
      repeatType: state.repeatType,
      userLocalId: userLocalId,
      dueDate: state.selectedDate,
      hasTime: state.isTimeSelected,
      subtasks: state.subtasks,
    );

    final result = await ref.read(createTaskUseCaseProvider).call(task);
    result.when(
      (_) {
        state = state.copyWith(status: AddTaskStatus.createSuccess);
      },
      (error) {
        state = state.copyWith(
          apiError: error.message,
          status: AddTaskStatus.error,
        );
      },
    );
  }
}
