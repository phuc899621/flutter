import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/auth/presentation/auth/controller/auth_controller.dart';
import 'package:taskit/features/category/domain/usecases/create_category_usecase.dart';
import 'package:taskit/features/category/presentation/ui/category_list_provider.dart';
import 'package:taskit/features/task/domain/entities/subtask_entity.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/features/user/domain/usecase/watch_user_by_local_id_use_case.dart';
import 'package:taskit/shared/log/logger_provider.dart';

import '../../../../category/domain/entities/category_entity.dart';
import '../../../application/task_service.dart';
import '../../../domain/entities/task_entity.dart';
import '../../../domain/entities/task_status_enum.dart';
import '../state/add_task_state.dart';

final addTaskControllerProvider =
    NotifierProvider.autoDispose<AddTaskController, AddTaskState>(
      AddTaskController.new,
    );

class AddTaskController extends Notifier<AddTaskState> {
  late final ProviderSubscription _authSub;

  @override
  AddTaskState build() {
    ref.listen(categoryListProvider, (_, next) {
      next.whenData((categories) {
        if (categories.isEmpty) return;
        state = state.copyWith(
          categories: categories,
          isCategoriesLoading: false,
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
    ref.onDispose(() {
      _authSub.close();
    });
    return const AddTaskState();
  }

  void setTitle(String s) {
    state = state.copyWith(title: s);
  }

  void setDescription(String s) {
    if (s != state.description) state = state.copyWith(description: s);
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
    state = state.copyWith(selectedDate: null, isTimeSelected: false);
  }

  void addSubtask() {
    state = state.copyWith(
      subtasks: [
        ...state.subtasks,
        SubtaskEntity(
          localId: -1,
          title: '',
          isCompleted: false,
          taskLocalId: -1,
        ),
      ],
    );
  }

  void onDeleteSubtask(int index) {
    final updatedSubtasks = [...state.subtasks];
    updatedSubtasks.removeAt(index);
    state = state.copyWith(subtasks: updatedSubtasks);
  }

  void onSubtaskInputSubmit(int index, String title) {
    logger.i('onSubtaskInputSubmit: $title');
    if (title != state.subtasks[index].title) {
      final updatedSubtasks = [...state.subtasks];
      updatedSubtasks[index] = updatedSubtasks[index].copyWith(title: title);
      state = state.copyWith(subtasks: updatedSubtasks);
    }
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

  void setAddCategory(String s) {
    if (s != state.addCategory) {
      state = state.copyWith(addCategory: s);
    }
  }

  void setAddTaskForm() {}

  void onAddCategory() async {
    final user = ref.read(currentUserProvider).value;
    if (user == null) return;
    final category = CategoryEntity.create(
      name: state.addCategory,
      userLocalId: user.localId,
    );
    ref.read(createCategoryUseCaseProvider).call(category);
    state = state.copyWith(addCategory: '');
  }

  Future<void> updateAiCategory(String title) async {
    debugPrintStack(stackTrace: StackTrace.current, label: 'aiCategories');
    final userLocalId = ref.read(
      authControllerProvider.select((value) => value.user?.localId),
    );
    if (userLocalId == null) return;
    state = state.copyWith(isCategoriesLoading: true);
    final taskService = ref.read(taskServiceProvider);
    final result = await taskService.getAICategory(title, userLocalId);
    result.when(
      (aiCategories) {
        debugPrintStack(stackTrace: StackTrace.current, label: 'aiCategories');

        state = state.copyWith(
          aiCategories: aiCategories
              .map((e) => e.copyWith(userLocalId: userLocalId))
              .toList(),
        );
        if (aiCategories.contains(state.selectedCategory) ||
            state.categories.contains(state.selectedCategory)) {
          return;
        }
        state = state.copyWith(selectedCategory: state.categories.first);
      },
      (failure) {
        debugPrintStack(stackTrace: StackTrace.current, label: 'aiCategories');
        state = state.copyWith(aiCategories: []);
      },
    );
    state = state.copyWith(isCategoriesLoading: false);
  }

  void removeSelectedTime() {
    state = state.copyWith(isTimeSelected: false);
  }

  Future<void> addTask() async {
    state = state.copyWith(
      isLoading: true,
      subtasks: state.subtasks
          .where((element) => element.title.isNotEmpty)
          .toList(),
    );
    final user = ref.read(currentUserProvider).value;
    if (user == null) return;
    final taskService = ref.read(taskServiceProvider);
    final userLocalId = user.localId;

    final task = TaskEntity(
      localId: -1,
      title: state.title,
      description: state.description,
      category:
          state.selectedCategory ??
          CategoryEntity(
            localId: -1,
            name: 'any',
            userLocalId: userLocalId,
            remoteId: '',
            isDefault: false,
            synced: false,
            deleted: false,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
      priority: state.selectedPriority,
      status: state.selectedDate == null
          ? TaskStatus.pending
          : TaskStatus.scheduled,
      userLocalId: userLocalId,
      dueDate: state.selectedDate,
      hasTime: state.isTimeSelected,
      subtasks: state.subtasks,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final result = await taskService.insertTask(task);
    result.when(
      (task) {
        state = state.copyWith(isLoading: false, isCreateTaskSuccess: true);
      },
      (error) {
        state = state.copyWith(error: error.message, isLoading: false);
      },
    );
  }
}
