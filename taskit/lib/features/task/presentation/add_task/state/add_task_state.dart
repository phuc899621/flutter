import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/category/domain/entities/category_entity.dart';

import '../../../domain/entities/task_entity.dart';

part 'add_task_state.freezed.dart';

@freezed
sealed class AddTaskState with _$AddTaskState {
  const factory AddTaskState({
    @Default(AddTaskStatus.initial) AddTaskStatus status,
    String? apiError,
    @Default([]) List<CategoryEntity> categories,
    @Default([]) List<CategoryEntity> aiCategories,
    @Default([]) List<TextEditingController> subtasks,
    @Default(TaskPriority.none) TaskPriority selectedPriority,
    @Default(TaskReminderType.none) TaskReminderType reminderType,
    DateTime? reminderAt,
    int? reminderOffset,
    CategoryEntity? selectedCategory,
    DateTime? selectedDate,
    @Default({}) Map<String, dynamic> addTaskForm,
    @Default(false) bool isTimeSelected,
  }) = _AddTaskState;
}

enum AddTaskStatus { initial, addLoading, aiLoading, createSuccess, error }
