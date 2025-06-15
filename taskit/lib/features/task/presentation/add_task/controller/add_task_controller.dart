/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/home/data/dto/req/suggest_category/suggest_category.dart';
import 'package:taskit/shared/application/token_service.dart';

import '../../../../../shared/application/local_service.dart';
import '../../../application/task_service.dart';
import '../../../data/dto/req/create_task/create_task.dart';
import '../../../data/dto/req/subtask/subtask.dart';
import '../state/create_task_state.dart';

final createTaskControllerProvider =
    NotifierProvider<CreateTaskController, CreateTaskState>(
        CreateTaskController.new);

class CreateTaskController extends Notifier<CreateTaskState> {
  @override
  CreateTaskState build() {
    return const CreateTaskState();
  }

  void setSelectedPriority(String priority) {
    state = state.copyWith(selectedPriority: priority.toLowerCase());
  }

  void setSelectedCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }

  void updateSelectedDate(int year, int month, int day, int hour, int minute) {
    state = state.copyWith(
        selectedDate: DateTime(
      year,
      month,
      day,
      hour,
      minute,
    ));
    debugPrint(state.selectedDate.toString());
  }

  void mapToSubtaskReq(List<TextEditingController> subtaskControllers) {
    state = state.copyWith(
      subtasks: subtaskControllers
          .where((controller) => controller.text.isNotEmpty)
          .map((e) => SubtaskReq(title: e.text))
          .toList(),
    );
  }

  void initSelectedDate() {
    state = state.copyWith(
        selectedDate: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 0, 0, 0));
  }

  void initCategories() async {
    await ref.read(localServiceProvider).getCategories().then((value) {
      state = state.copyWith(categories: value ?? []);
    });
  }

  void onDeleteSubtask(int index) {
    state.subtaskControllers[index].dispose();
    state = state.copyWith(subtaskControllers: [
      ...state.subtaskControllers.sublist(0, index),
      ...state.subtaskControllers.sublist(index + 1),
    ]);
  }

  Future<void> saveTask() async {
    mapToSubtaskReq(state.subtaskControllers);
    print(state.createTaskForm['title'].toString() +
        state.createTaskForm['description'].toString() +
        state.selectedCategory! +
        state.selectedPriority.toString() +
        state.selectedDate.toString() +
        state.subtasks.toString());
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
      );
      mapToSubtaskReq(state.subtaskControllers);
      if (state.selectedCategory == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'Please select a category',
        );
        return;
      }
      final token = await ref.read(tokenServiceProvider).getToken();
      final form = CreateTaskReq(
        title: state.createTaskForm['title'],
        description: state.createTaskForm['description'] ?? '',
        category: state.selectedCategory!,
        priority: state.selectedPriority,
        dueDate: state.selectedDate ??
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, 0, 0, 0),
        subtasks: state.subtasks ?? [],
      );
      final result =
          await ref.read(taskServiceProvider).createTask(token!, form);
      result.when((success) {
        state = state.copyWith(
          isLoading: false,
          isCreateTaskSuccess: true,
        );
      }, (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void setCreateTaskForm(Map<String, dynamic> form) {
    state = state.copyWith(createTaskForm: form);
  }

  void onAddSubtask() {
    state = state.copyWith(subtaskControllers: [
      ...state.subtaskControllers,
      TextEditingController(),
    ]);
  }

  Future<void> updateAICategories(String title) async {
    debugPrint("$title///////////////////////////");
    try {
      state = state.copyWith(
        isCategoriesLoading: true,
        error: null,
      );
      final token = await ref.read(tokenServiceProvider).getToken();
      final result = await ref
          .read(taskServiceProvider)
          .suggestCategory(token!, SuggestCategoryReq(title: title));

      result.when((success) {
        debugPrint("$success////////////////");
        state = state.copyWith(
          isCategoriesLoading: false,
          AICategories: success.categories,
        );
      }, (failure) {
        debugPrint("$failure///////////////////////////");
        state = state.copyWith(
          isCategoriesLoading: false,
          error: failure.message,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isCategoriesLoading: false,
        error: e.toString(),
      );
    }
  }
}
*/
