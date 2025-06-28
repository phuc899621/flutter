import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/domain/entities/category_entity.dart';
import 'package:taskit/features/task/domain/entities/filter_date_option_enum.dart';
import 'package:taskit/features/task/domain/entities/order_option_enum.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';

import '../../../../task/domain/entities/task_entity.dart';

part 'list_state.freezed.dart';

@freezed
sealed class ListState with _$ListState {
  const factory ListState({
    @Default(true) bool isLoading,
    @Default([]) List<TaskEntity> allTask,
    @Default([]) List<TaskEntity> filteringTask,
    @Default([]) List<TaskEntity> filteringPendingTask,
    @Default([]) List<TaskEntity> filteringCompletedTask,
    @Default([]) List<TaskEntity> filteringScheduledTask,
    @Default([]) List<CategoryEntity> filteringCategories,
    @Default([]) List<TaskPriority> filteringPriorities,
    @Default(FilterDateOption.noDateFilter)
    FilterDateOption filteringDateOption,
    DateTime? filteringStartDate,
    @Default(OrderByOption.defaultOption) OrderByOption orderByOption,
    DateTime? filteringEndDate,
    @Default('') String searchText,
    @Default(false) bool isFiltering,
  }) = _ListState;
}
