// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilterState {
  bool get isFiltering;
  List<TaskPriority> get filteringPriorities;
  List<TaskPriority> get selectedPriorities;
  List<TaskStatus> get filteringStatus;
  List<CategoryEntity> get categories;
  List<CategoryEntity> get selectedCategories;
  List<CategoryEntity> get filteringCategories;
  DateTime? get selectedStartDate;
  DateTime? get selectedEndDate;
  DateTime? get filteringStartDate;
  DateTime? get filteringEndDate;
  FilterDateOption get filteringDateOption;
  FilterDateOption get selectedDateOption;

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterStateCopyWith<FilterState> get copyWith =>
      _$FilterStateCopyWithImpl<FilterState>(this as FilterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterState &&
            (identical(other.isFiltering, isFiltering) ||
                other.isFiltering == isFiltering) &&
            const DeepCollectionEquality()
                .equals(other.filteringPriorities, filteringPriorities) &&
            const DeepCollectionEquality()
                .equals(other.selectedPriorities, selectedPriorities) &&
            const DeepCollectionEquality()
                .equals(other.filteringStatus, filteringStatus) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.selectedCategories, selectedCategories) &&
            const DeepCollectionEquality()
                .equals(other.filteringCategories, filteringCategories) &&
            (identical(other.selectedStartDate, selectedStartDate) ||
                other.selectedStartDate == selectedStartDate) &&
            (identical(other.selectedEndDate, selectedEndDate) ||
                other.selectedEndDate == selectedEndDate) &&
            (identical(other.filteringStartDate, filteringStartDate) ||
                other.filteringStartDate == filteringStartDate) &&
            (identical(other.filteringEndDate, filteringEndDate) ||
                other.filteringEndDate == filteringEndDate) &&
            (identical(other.filteringDateOption, filteringDateOption) ||
                other.filteringDateOption == filteringDateOption) &&
            (identical(other.selectedDateOption, selectedDateOption) ||
                other.selectedDateOption == selectedDateOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFiltering,
      const DeepCollectionEquality().hash(filteringPriorities),
      const DeepCollectionEquality().hash(selectedPriorities),
      const DeepCollectionEquality().hash(filteringStatus),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(selectedCategories),
      const DeepCollectionEquality().hash(filteringCategories),
      selectedStartDate,
      selectedEndDate,
      filteringStartDate,
      filteringEndDate,
      filteringDateOption,
      selectedDateOption);

  @override
  String toString() {
    return 'FilterState(isFiltering: $isFiltering, filteringPriorities: $filteringPriorities, selectedPriorities: $selectedPriorities, filteringStatus: $filteringStatus, categories: $categories, selectedCategories: $selectedCategories, filteringCategories: $filteringCategories, selectedStartDate: $selectedStartDate, selectedEndDate: $selectedEndDate, filteringStartDate: $filteringStartDate, filteringEndDate: $filteringEndDate, filteringDateOption: $filteringDateOption, selectedDateOption: $selectedDateOption)';
  }
}

/// @nodoc
abstract mixin class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) _then) =
      _$FilterStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isFiltering,
      List<TaskPriority> filteringPriorities,
      List<TaskPriority> selectedPriorities,
      List<TaskStatus> filteringStatus,
      List<CategoryEntity> categories,
      List<CategoryEntity> selectedCategories,
      List<CategoryEntity> filteringCategories,
      DateTime? selectedStartDate,
      DateTime? selectedEndDate,
      DateTime? filteringStartDate,
      DateTime? filteringEndDate,
      FilterDateOption filteringDateOption,
      FilterDateOption selectedDateOption});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res> implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._self, this._then);

  final FilterState _self;
  final $Res Function(FilterState) _then;

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFiltering = null,
    Object? filteringPriorities = null,
    Object? selectedPriorities = null,
    Object? filteringStatus = null,
    Object? categories = null,
    Object? selectedCategories = null,
    Object? filteringCategories = null,
    Object? selectedStartDate = freezed,
    Object? selectedEndDate = freezed,
    Object? filteringStartDate = freezed,
    Object? filteringEndDate = freezed,
    Object? filteringDateOption = null,
    Object? selectedDateOption = null,
  }) {
    return _then(_self.copyWith(
      isFiltering: null == isFiltering
          ? _self.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
      filteringPriorities: null == filteringPriorities
          ? _self.filteringPriorities
          : filteringPriorities // ignore: cast_nullable_to_non_nullable
              as List<TaskPriority>,
      selectedPriorities: null == selectedPriorities
          ? _self.selectedPriorities
          : selectedPriorities // ignore: cast_nullable_to_non_nullable
              as List<TaskPriority>,
      filteringStatus: null == filteringStatus
          ? _self.filteringStatus
          : filteringStatus // ignore: cast_nullable_to_non_nullable
              as List<TaskStatus>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      selectedCategories: null == selectedCategories
          ? _self.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      filteringCategories: null == filteringCategories
          ? _self.filteringCategories
          : filteringCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      selectedStartDate: freezed == selectedStartDate
          ? _self.selectedStartDate
          : selectedStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedEndDate: freezed == selectedEndDate
          ? _self.selectedEndDate
          : selectedEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filteringStartDate: freezed == filteringStartDate
          ? _self.filteringStartDate
          : filteringStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filteringEndDate: freezed == filteringEndDate
          ? _self.filteringEndDate
          : filteringEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filteringDateOption: null == filteringDateOption
          ? _self.filteringDateOption
          : filteringDateOption // ignore: cast_nullable_to_non_nullable
              as FilterDateOption,
      selectedDateOption: null == selectedDateOption
          ? _self.selectedDateOption
          : selectedDateOption // ignore: cast_nullable_to_non_nullable
              as FilterDateOption,
    ));
  }
}

/// @nodoc

class _FilterState implements FilterState {
  const _FilterState(
      {this.isFiltering = true,
      final List<TaskPriority> filteringPriorities = const [],
      final List<TaskPriority> selectedPriorities = const [],
      final List<TaskStatus> filteringStatus = const [],
      final List<CategoryEntity> categories = const [],
      final List<CategoryEntity> selectedCategories = const [],
      final List<CategoryEntity> filteringCategories = const [],
      this.selectedStartDate,
      this.selectedEndDate,
      this.filteringStartDate,
      this.filteringEndDate,
      this.filteringDateOption = FilterDateOption.noDateFilter,
      this.selectedDateOption = FilterDateOption.noDateFilter})
      : _filteringPriorities = filteringPriorities,
        _selectedPriorities = selectedPriorities,
        _filteringStatus = filteringStatus,
        _categories = categories,
        _selectedCategories = selectedCategories,
        _filteringCategories = filteringCategories;

  @override
  @JsonKey()
  final bool isFiltering;
  final List<TaskPriority> _filteringPriorities;
  @override
  @JsonKey()
  List<TaskPriority> get filteringPriorities {
    if (_filteringPriorities is EqualUnmodifiableListView)
      return _filteringPriorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteringPriorities);
  }

  final List<TaskPriority> _selectedPriorities;
  @override
  @JsonKey()
  List<TaskPriority> get selectedPriorities {
    if (_selectedPriorities is EqualUnmodifiableListView)
      return _selectedPriorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPriorities);
  }

  final List<TaskStatus> _filteringStatus;
  @override
  @JsonKey()
  List<TaskStatus> get filteringStatus {
    if (_filteringStatus is EqualUnmodifiableListView) return _filteringStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteringStatus);
  }

  final List<CategoryEntity> _categories;
  @override
  @JsonKey()
  List<CategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryEntity> _selectedCategories;
  @override
  @JsonKey()
  List<CategoryEntity> get selectedCategories {
    if (_selectedCategories is EqualUnmodifiableListView)
      return _selectedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategories);
  }

  final List<CategoryEntity> _filteringCategories;
  @override
  @JsonKey()
  List<CategoryEntity> get filteringCategories {
    if (_filteringCategories is EqualUnmodifiableListView)
      return _filteringCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteringCategories);
  }

  @override
  final DateTime? selectedStartDate;
  @override
  final DateTime? selectedEndDate;
  @override
  final DateTime? filteringStartDate;
  @override
  final DateTime? filteringEndDate;
  @override
  @JsonKey()
  final FilterDateOption filteringDateOption;
  @override
  @JsonKey()
  final FilterDateOption selectedDateOption;

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterStateCopyWith<_FilterState> get copyWith =>
      __$FilterStateCopyWithImpl<_FilterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterState &&
            (identical(other.isFiltering, isFiltering) ||
                other.isFiltering == isFiltering) &&
            const DeepCollectionEquality()
                .equals(other._filteringPriorities, _filteringPriorities) &&
            const DeepCollectionEquality()
                .equals(other._selectedPriorities, _selectedPriorities) &&
            const DeepCollectionEquality()
                .equals(other._filteringStatus, _filteringStatus) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._selectedCategories, _selectedCategories) &&
            const DeepCollectionEquality()
                .equals(other._filteringCategories, _filteringCategories) &&
            (identical(other.selectedStartDate, selectedStartDate) ||
                other.selectedStartDate == selectedStartDate) &&
            (identical(other.selectedEndDate, selectedEndDate) ||
                other.selectedEndDate == selectedEndDate) &&
            (identical(other.filteringStartDate, filteringStartDate) ||
                other.filteringStartDate == filteringStartDate) &&
            (identical(other.filteringEndDate, filteringEndDate) ||
                other.filteringEndDate == filteringEndDate) &&
            (identical(other.filteringDateOption, filteringDateOption) ||
                other.filteringDateOption == filteringDateOption) &&
            (identical(other.selectedDateOption, selectedDateOption) ||
                other.selectedDateOption == selectedDateOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFiltering,
      const DeepCollectionEquality().hash(_filteringPriorities),
      const DeepCollectionEquality().hash(_selectedPriorities),
      const DeepCollectionEquality().hash(_filteringStatus),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_selectedCategories),
      const DeepCollectionEquality().hash(_filteringCategories),
      selectedStartDate,
      selectedEndDate,
      filteringStartDate,
      filteringEndDate,
      filteringDateOption,
      selectedDateOption);

  @override
  String toString() {
    return 'FilterState(isFiltering: $isFiltering, filteringPriorities: $filteringPriorities, selectedPriorities: $selectedPriorities, filteringStatus: $filteringStatus, categories: $categories, selectedCategories: $selectedCategories, filteringCategories: $filteringCategories, selectedStartDate: $selectedStartDate, selectedEndDate: $selectedEndDate, filteringStartDate: $filteringStartDate, filteringEndDate: $filteringEndDate, filteringDateOption: $filteringDateOption, selectedDateOption: $selectedDateOption)';
  }
}

/// @nodoc
abstract mixin class _$FilterStateCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$FilterStateCopyWith(
          _FilterState value, $Res Function(_FilterState) _then) =
      __$FilterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isFiltering,
      List<TaskPriority> filteringPriorities,
      List<TaskPriority> selectedPriorities,
      List<TaskStatus> filteringStatus,
      List<CategoryEntity> categories,
      List<CategoryEntity> selectedCategories,
      List<CategoryEntity> filteringCategories,
      DateTime? selectedStartDate,
      DateTime? selectedEndDate,
      DateTime? filteringStartDate,
      DateTime? filteringEndDate,
      FilterDateOption filteringDateOption,
      FilterDateOption selectedDateOption});
}

/// @nodoc
class __$FilterStateCopyWithImpl<$Res> implements _$FilterStateCopyWith<$Res> {
  __$FilterStateCopyWithImpl(this._self, this._then);

  final _FilterState _self;
  final $Res Function(_FilterState) _then;

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isFiltering = null,
    Object? filteringPriorities = null,
    Object? selectedPriorities = null,
    Object? filteringStatus = null,
    Object? categories = null,
    Object? selectedCategories = null,
    Object? filteringCategories = null,
    Object? selectedStartDate = freezed,
    Object? selectedEndDate = freezed,
    Object? filteringStartDate = freezed,
    Object? filteringEndDate = freezed,
    Object? filteringDateOption = null,
    Object? selectedDateOption = null,
  }) {
    return _then(_FilterState(
      isFiltering: null == isFiltering
          ? _self.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
      filteringPriorities: null == filteringPriorities
          ? _self._filteringPriorities
          : filteringPriorities // ignore: cast_nullable_to_non_nullable
              as List<TaskPriority>,
      selectedPriorities: null == selectedPriorities
          ? _self._selectedPriorities
          : selectedPriorities // ignore: cast_nullable_to_non_nullable
              as List<TaskPriority>,
      filteringStatus: null == filteringStatus
          ? _self._filteringStatus
          : filteringStatus // ignore: cast_nullable_to_non_nullable
              as List<TaskStatus>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      selectedCategories: null == selectedCategories
          ? _self._selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      filteringCategories: null == filteringCategories
          ? _self._filteringCategories
          : filteringCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      selectedStartDate: freezed == selectedStartDate
          ? _self.selectedStartDate
          : selectedStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedEndDate: freezed == selectedEndDate
          ? _self.selectedEndDate
          : selectedEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filteringStartDate: freezed == filteringStartDate
          ? _self.filteringStartDate
          : filteringStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filteringEndDate: freezed == filteringEndDate
          ? _self.filteringEndDate
          : filteringEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filteringDateOption: null == filteringDateOption
          ? _self.filteringDateOption
          : filteringDateOption // ignore: cast_nullable_to_non_nullable
              as FilterDateOption,
      selectedDateOption: null == selectedDateOption
          ? _self.selectedDateOption
          : selectedDateOption // ignore: cast_nullable_to_non_nullable
              as FilterDateOption,
    ));
  }
}

// dart format on
