import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/task/domain/entities/category_entity.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';

import '../../../domain/entities/filter_date_option_enum.dart';
import '../../../domain/entities/task_status_enum.dart';

part 'filter_state.freezed.dart';

@freezed
sealed class FilterState with _$FilterState {
  const factory FilterState(
      {@Default(true) bool isFiltering,
      @Default([]) List<TaskPriority> filteringPriorities,
      @Default([]) List<TaskPriority> selectedPriorities,
      @Default([]) List<TaskStatus> filteringStatus,
      @Default([]) List<CategoryEntity> categories,
      @Default([]) List<CategoryEntity> selectedCategories,
      @Default([]) List<CategoryEntity> filteringCategories,
      DateTime? selectedStartDate,
      DateTime? selectedEndDate,
      DateTime? filteringStartDate,
      DateTime? filteringEndDate,
      @Default(FilterDateOption.noDateFilter)
      FilterDateOption filteringDateOption,
      @Default(FilterDateOption.noDateFilter)
      FilterDateOption selectedDateOption}) = _FilterState;
}
