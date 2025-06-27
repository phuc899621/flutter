import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/features/main/presentation/list/controller/list_controller.dart';
import 'package:taskit/features/task/application/task_service.dart';
import 'package:taskit/features/task/domain/entities/category_entity.dart';
import 'package:taskit/features/task/domain/entities/filter_date_option_enum.dart';
import 'package:taskit/features/task/domain/entities/task_priority_enum.dart';
import 'package:taskit/features/task/presentation/filter_task/state/filter_state.dart';
import 'package:taskit/shared/log/logger_provider.dart';

final filterControllerProvider =
    AutoDisposeNotifierProvider<FilterController, FilterState>(
        FilterController.new);

class FilterController extends AutoDisposeNotifier<FilterState> {
  late StreamSubscription _categorySub;

  @override
  FilterState build() {
    _startListening();
    return FilterState();
  }

  //==============================================
  //================= Listening ==================
  //==============================================
  //region LISTENING
  //endregion
  void _startListening() {
    _categorySub =
        ref.read(taskServiceProvider).watchAllCategories().listen((categories) {
      state = state.copyWith(categories: categories);
    });
  }

  //==============================================
  //================= SET VALUE ==================
  //==============================================
  //region SET VALUE
  //endregion
  void setFilteringDateOption(FilterDateOption option) {
    state = state.copyWith(filteringDateOption: option);
  }

  void setFilteringCategories(List<CategoryEntity> categories) {
    state = state.copyWith(filteringCategories: categories);
  }

  void setSelectedCategories(List<CategoryEntity> categories) {
    state = state.copyWith(selectedCategories: categories);
  }

  void setFilteringPriorities(List<TaskPriority> priorities) {
    state = state.copyWith(filteringPriorities: priorities);
  }

  void setSelectedPriorities(List<TaskPriority> priorities) {
    state = state.copyWith(selectedPriorities: priorities);
  }

  void setSelectedDateOption(FilterDateOption option) {
    if (state.selectedDateOption != option) {
      state = state.copyWith(selectedDateOption: option);
    }
    if (option != FilterDateOption.custom &&
        (state.filteringStartDate != null || state.filteringEndDate != null)) {
      state = state.copyWith(filteringStartDate: null, filteringEndDate: null);
    }
  }

  void setSelectedStartDate(DateTime? date) {
    state = state.copyWith(selectedStartDate: date);
  }

  void setFilteringStartDate(DateTime? date) {
    state = state.copyWith(filteringStartDate: date);
  }

  void setFilteringEndDate(DateTime? date) {
    state = state.copyWith(filteringEndDate: date);
  }

  void setSelectedEndDate(DateTime? date) {
    state = state.copyWith(selectedEndDate: date);
  }

  //==============================================
  //================= ON SELECT ====================
  //==============================================
  //region ON SELECT
  //endregion
  void onSelectCategory(CategoryEntity selectedCategory, bool isSelected) {
    if (!isSelected) {
      state = state.copyWith(
          selectedCategories: List.from(state.selectedCategories)
            ..removeWhere(
              (category) => category.localId == selectedCategory.localId,
            ));
    } else {
      state = state.copyWith(
          selectedCategories: [...state.selectedCategories, selectedCategory]);
    }
  }

  void onSelectPriority(TaskPriority selectedPriority, bool isSelected) {
    if (!isSelected) {
      state = state.copyWith(
          selectedPriorities: List.from(state.selectedPriorities)
            ..removeWhere(
              (priority) => priority == selectedPriority,
            ));
    } else {
      state = state.copyWith(
          selectedPriorities: [...state.selectedPriorities, selectedPriority]);
    }
  }

  //==============================================
  //================= ON CANCEL ====================
  //==============================================
  //region ON CANCEL
  //endregion

  void onCancelFilteringCategory() {
    state = state.copyWith(selectedCategories: []);
  }

  void onCancelFilteringPriority() {
    state = state.copyWith(selectedPriorities: []);
  }

  void onCancelFilteringStartDate() {
    state = state.copyWith(selectedStartDate: null);
  }

  void onCancelFilteringEndDate() {
    state = state.copyWith(selectedEndDate: null);
  }

  void onCancelFilteringDate() {
    state = state.copyWith(
        selectedStartDate: null,
        selectedEndDate: null,
        selectedDateOption: FilterDateOption.noDateFilter);
  }

  //==============================================
  //================= ON SAVE =====================
  //==============================================
  //region ON SAVE
  //endregion

  void onSaveFilteringCategory() {
    state = state.copyWith(
        filteringCategories: state.selectedCategories, selectedCategories: []);
    checkIsFiltering();
  }

  void onSaveFilteringPriority() {
    state = state.copyWith(
        filteringPriorities: state.selectedPriorities, selectedPriorities: []);
    checkIsFiltering();
  }

  void onSaveFilteringStartDate() {
    state = state.copyWith(
        filteringStartDate: state.selectedStartDate, selectedStartDate: null);
  }

  void onSaveFilteringEndDate() {
    state = state.copyWith(
        filteringEndDate: state.selectedEndDate, selectedEndDate: null);
  }

  void onSaveFilteringDate() {
    if (state.selectedDateOption == FilterDateOption.custom) {
      if (state.selectedStartDate != null || state.selectedEndDate != null) {
        state = state.copyWith(
            filteringDateOption: FilterDateOption.custom,
            filteringStartDate: state.selectedStartDate,
            filteringEndDate: state.selectedEndDate);
      } else {
        state = state.copyWith(
            filteringDateOption: FilterDateOption.noDateFilter,
            filteringStartDate: null,
            filteringEndDate: null);
      }
    } else {
      state = state.copyWith(
          filteringDateOption: state.selectedDateOption,
          filteringStartDate: null,
          filteringEndDate: null);
    }
    state = state.copyWith(
        selectedDateOption: FilterDateOption.noDateFilter,
        selectedStartDate: null,
        selectedEndDate: null);
    checkIsFiltering();
  }

  void onSaveFiltering() {
    checkIsFiltering();
    final listController = ref.read(listControllerProvider.notifier);
    listController.setIsFiltering(state.isFiltering);
    listController.setFilteringCategories(state.filteringCategories);
    listController.setFilteringPriorities(state.filteringPriorities);
    listController.setFilteringDateOption(state.filteringDateOption);
    listController.setFilteringStartDate(state.filteringStartDate);
    listController.setFilteringEndDate(state.filteringEndDate);
    logger.i(
        'onSaveFiltering ${state.isFiltering} ${state.filteringDateOption} ${state.filteringStartDate} ${state.filteringEndDate} ${state.filteringCategories} ${state.filteringPriorities}');
  }

  void checkIsFiltering() {
    if (state.filteringCategories.isNotEmpty ||
        state.filteringPriorities.isNotEmpty ||
        state.filteringDateOption != FilterDateOption.noDateFilter) {
      state = state.copyWith(isFiltering: true);
    } else {
      state = state.copyWith(isFiltering: false);
    }
  }

  void onResetAll() {
    state = state.copyWith(
      filteringCategories: [],
      filteringPriorities: [],
      filteringDateOption: FilterDateOption.noDateFilter,
      filteringStartDate: null,
      filteringEndDate: null,
    );
  }
}
