// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListState {
  bool get isLoading;
  List<TaskEntity> get allTask;
  List<TaskEntity> get filteringTask;
  List<TaskEntity> get filteringPendingTask;
  List<TaskEntity> get filteringCompletedTask;
  List<TaskEntity> get filteringScheduledTask;
  List<CategoryEntity> get filteringCategories;
  List<TaskPriority> get filteringPriorities;
  FilterDateOption get filteringDateOption;
  DateTime? get filteringStartDate;
  DateTime? get filteringEndDate;
  String get searchText;
  bool get isFiltering;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ListStateCopyWith<ListState> get copyWith =>
      _$ListStateCopyWithImpl<ListState>(this as ListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.allTask, allTask) &&
            const DeepCollectionEquality()
                .equals(other.filteringTask, filteringTask) &&
            const DeepCollectionEquality()
                .equals(other.filteringPendingTask, filteringPendingTask) &&
            const DeepCollectionEquality()
                .equals(other.filteringCompletedTask, filteringCompletedTask) &&
            const DeepCollectionEquality()
                .equals(other.filteringScheduledTask, filteringScheduledTask) &&
            const DeepCollectionEquality()
                .equals(other.filteringCategories, filteringCategories) &&
            const DeepCollectionEquality()
                .equals(other.filteringPriorities, filteringPriorities) &&
            (identical(other.filteringDateOption, filteringDateOption) ||
                other.filteringDateOption == filteringDateOption) &&
            (identical(other.filteringStartDate, filteringStartDate) ||
                other.filteringStartDate == filteringStartDate) &&
            (identical(other.filteringEndDate, filteringEndDate) ||
                other.filteringEndDate == filteringEndDate) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.isFiltering, isFiltering) ||
                other.isFiltering == isFiltering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(allTask),
      const DeepCollectionEquality().hash(filteringTask),
      const DeepCollectionEquality().hash(filteringPendingTask),
      const DeepCollectionEquality().hash(filteringCompletedTask),
      const DeepCollectionEquality().hash(filteringScheduledTask),
      const DeepCollectionEquality().hash(filteringCategories),
      const DeepCollectionEquality().hash(filteringPriorities),
      filteringDateOption,
      filteringStartDate,
      filteringEndDate,
      searchText,
      isFiltering);

  @override
  String toString() {
    return 'ListState(isLoading: $isLoading, allTask: $allTask, filteringTask: $filteringTask, filteringPendingTask: $filteringPendingTask, filteringCompletedTask: $filteringCompletedTask, filteringScheduledTask: $filteringScheduledTask, filteringCategories: $filteringCategories, filteringPriorities: $filteringPriorities, filteringDateOption: $filteringDateOption, filteringStartDate: $filteringStartDate, filteringEndDate: $filteringEndDate, searchText: $searchText, isFiltering: $isFiltering)';
  }
}

/// @nodoc
abstract mixin class $ListStateCopyWith<$Res> {
  factory $ListStateCopyWith(ListState value, $Res Function(ListState) _then) =
      _$ListStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      List<TaskEntity> allTask,
      List<TaskEntity> filteringTask,
      List<TaskEntity> filteringPendingTask,
      List<TaskEntity> filteringCompletedTask,
      List<TaskEntity> filteringScheduledTask,
      List<CategoryEntity> filteringCategories,
      List<TaskPriority> filteringPriorities,
      FilterDateOption filteringDateOption,
      DateTime? filteringStartDate,
      DateTime? filteringEndDate,
      String searchText,
      bool isFiltering});
}

/// @nodoc
class _$ListStateCopyWithImpl<$Res> implements $ListStateCopyWith<$Res> {
  _$ListStateCopyWithImpl(this._self, this._then);

  final ListState _self;
  final $Res Function(ListState) _then;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? allTask = null,
    Object? filteringTask = null,
    Object? filteringPendingTask = null,
    Object? filteringCompletedTask = null,
    Object? filteringScheduledTask = null,
    Object? filteringCategories = null,
    Object? filteringPriorities = null,
    Object? filteringDateOption = null,
    Object? filteringStartDate = freezed,
    Object? filteringEndDate = freezed,
    Object? searchText = null,
    Object? isFiltering = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allTask: null == allTask
          ? _self.allTask
          : allTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringTask: null == filteringTask
          ? _self.filteringTask
          : filteringTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringPendingTask: null == filteringPendingTask
          ? _self.filteringPendingTask
          : filteringPendingTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringCompletedTask: null == filteringCompletedTask
          ? _self.filteringCompletedTask
          : filteringCompletedTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringScheduledTask: null == filteringScheduledTask
          ? _self.filteringScheduledTask
          : filteringScheduledTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringCategories: null == filteringCategories
          ? _self.filteringCategories
          : filteringCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      filteringPriorities: null == filteringPriorities
          ? _self.filteringPriorities
          : filteringPriorities // ignore: cast_nullable_to_non_nullable
              as List<TaskPriority>,
      filteringDateOption: null == filteringDateOption
          ? _self.filteringDateOption
          : filteringDateOption // ignore: cast_nullable_to_non_nullable
              as FilterDateOption,
      filteringStartDate: freezed == filteringStartDate
          ? _self.filteringStartDate
          : filteringStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filteringEndDate: freezed == filteringEndDate
          ? _self.filteringEndDate
          : filteringEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      searchText: null == searchText
          ? _self.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      isFiltering: null == isFiltering
          ? _self.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _ListState implements ListState {
  const _ListState(
      {this.isLoading = true,
      final List<TaskEntity> allTask = const [],
      final List<TaskEntity> filteringTask = const [],
      final List<TaskEntity> filteringPendingTask = const [],
      final List<TaskEntity> filteringCompletedTask = const [],
      final List<TaskEntity> filteringScheduledTask = const [],
      final List<CategoryEntity> filteringCategories = const [],
      final List<TaskPriority> filteringPriorities = const [],
      this.filteringDateOption = FilterDateOption.noDateFilter,
      this.filteringStartDate,
      this.filteringEndDate,
      this.searchText = '',
      this.isFiltering = false})
      : _allTask = allTask,
        _filteringTask = filteringTask,
        _filteringPendingTask = filteringPendingTask,
        _filteringCompletedTask = filteringCompletedTask,
        _filteringScheduledTask = filteringScheduledTask,
        _filteringCategories = filteringCategories,
        _filteringPriorities = filteringPriorities;

  @override
  @JsonKey()
  final bool isLoading;
  final List<TaskEntity> _allTask;
  @override
  @JsonKey()
  List<TaskEntity> get allTask {
    if (_allTask is EqualUnmodifiableListView) return _allTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTask);
  }

  final List<TaskEntity> _filteringTask;
  @override
  @JsonKey()
  List<TaskEntity> get filteringTask {
    if (_filteringTask is EqualUnmodifiableListView) return _filteringTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteringTask);
  }

  final List<TaskEntity> _filteringPendingTask;
  @override
  @JsonKey()
  List<TaskEntity> get filteringPendingTask {
    if (_filteringPendingTask is EqualUnmodifiableListView)
      return _filteringPendingTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteringPendingTask);
  }

  final List<TaskEntity> _filteringCompletedTask;
  @override
  @JsonKey()
  List<TaskEntity> get filteringCompletedTask {
    if (_filteringCompletedTask is EqualUnmodifiableListView)
      return _filteringCompletedTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteringCompletedTask);
  }

  final List<TaskEntity> _filteringScheduledTask;
  @override
  @JsonKey()
  List<TaskEntity> get filteringScheduledTask {
    if (_filteringScheduledTask is EqualUnmodifiableListView)
      return _filteringScheduledTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteringScheduledTask);
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

  final List<TaskPriority> _filteringPriorities;
  @override
  @JsonKey()
  List<TaskPriority> get filteringPriorities {
    if (_filteringPriorities is EqualUnmodifiableListView)
      return _filteringPriorities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteringPriorities);
  }

  @override
  @JsonKey()
  final FilterDateOption filteringDateOption;
  @override
  final DateTime? filteringStartDate;
  @override
  final DateTime? filteringEndDate;
  @override
  @JsonKey()
  final String searchText;
  @override
  @JsonKey()
  final bool isFiltering;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ListStateCopyWith<_ListState> get copyWith =>
      __$ListStateCopyWithImpl<_ListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._allTask, _allTask) &&
            const DeepCollectionEquality()
                .equals(other._filteringTask, _filteringTask) &&
            const DeepCollectionEquality()
                .equals(other._filteringPendingTask, _filteringPendingTask) &&
            const DeepCollectionEquality().equals(
                other._filteringCompletedTask, _filteringCompletedTask) &&
            const DeepCollectionEquality().equals(
                other._filteringScheduledTask, _filteringScheduledTask) &&
            const DeepCollectionEquality()
                .equals(other._filteringCategories, _filteringCategories) &&
            const DeepCollectionEquality()
                .equals(other._filteringPriorities, _filteringPriorities) &&
            (identical(other.filteringDateOption, filteringDateOption) ||
                other.filteringDateOption == filteringDateOption) &&
            (identical(other.filteringStartDate, filteringStartDate) ||
                other.filteringStartDate == filteringStartDate) &&
            (identical(other.filteringEndDate, filteringEndDate) ||
                other.filteringEndDate == filteringEndDate) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.isFiltering, isFiltering) ||
                other.isFiltering == isFiltering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_allTask),
      const DeepCollectionEquality().hash(_filteringTask),
      const DeepCollectionEquality().hash(_filteringPendingTask),
      const DeepCollectionEquality().hash(_filteringCompletedTask),
      const DeepCollectionEquality().hash(_filteringScheduledTask),
      const DeepCollectionEquality().hash(_filteringCategories),
      const DeepCollectionEquality().hash(_filteringPriorities),
      filteringDateOption,
      filteringStartDate,
      filteringEndDate,
      searchText,
      isFiltering);

  @override
  String toString() {
    return 'ListState(isLoading: $isLoading, allTask: $allTask, filteringTask: $filteringTask, filteringPendingTask: $filteringPendingTask, filteringCompletedTask: $filteringCompletedTask, filteringScheduledTask: $filteringScheduledTask, filteringCategories: $filteringCategories, filteringPriorities: $filteringPriorities, filteringDateOption: $filteringDateOption, filteringStartDate: $filteringStartDate, filteringEndDate: $filteringEndDate, searchText: $searchText, isFiltering: $isFiltering)';
  }
}

/// @nodoc
abstract mixin class _$ListStateCopyWith<$Res>
    implements $ListStateCopyWith<$Res> {
  factory _$ListStateCopyWith(
          _ListState value, $Res Function(_ListState) _then) =
      __$ListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<TaskEntity> allTask,
      List<TaskEntity> filteringTask,
      List<TaskEntity> filteringPendingTask,
      List<TaskEntity> filteringCompletedTask,
      List<TaskEntity> filteringScheduledTask,
      List<CategoryEntity> filteringCategories,
      List<TaskPriority> filteringPriorities,
      FilterDateOption filteringDateOption,
      DateTime? filteringStartDate,
      DateTime? filteringEndDate,
      String searchText,
      bool isFiltering});
}

/// @nodoc
class __$ListStateCopyWithImpl<$Res> implements _$ListStateCopyWith<$Res> {
  __$ListStateCopyWithImpl(this._self, this._then);

  final _ListState _self;
  final $Res Function(_ListState) _then;

  /// Create a copy of ListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? allTask = null,
    Object? filteringTask = null,
    Object? filteringPendingTask = null,
    Object? filteringCompletedTask = null,
    Object? filteringScheduledTask = null,
    Object? filteringCategories = null,
    Object? filteringPriorities = null,
    Object? filteringDateOption = null,
    Object? filteringStartDate = freezed,
    Object? filteringEndDate = freezed,
    Object? searchText = null,
    Object? isFiltering = null,
  }) {
    return _then(_ListState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allTask: null == allTask
          ? _self._allTask
          : allTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringTask: null == filteringTask
          ? _self._filteringTask
          : filteringTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringPendingTask: null == filteringPendingTask
          ? _self._filteringPendingTask
          : filteringPendingTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringCompletedTask: null == filteringCompletedTask
          ? _self._filteringCompletedTask
          : filteringCompletedTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringScheduledTask: null == filteringScheduledTask
          ? _self._filteringScheduledTask
          : filteringScheduledTask // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      filteringCategories: null == filteringCategories
          ? _self._filteringCategories
          : filteringCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      filteringPriorities: null == filteringPriorities
          ? _self._filteringPriorities
          : filteringPriorities // ignore: cast_nullable_to_non_nullable
              as List<TaskPriority>,
      filteringDateOption: null == filteringDateOption
          ? _self.filteringDateOption
          : filteringDateOption // ignore: cast_nullable_to_non_nullable
              as FilterDateOption,
      filteringStartDate: freezed == filteringStartDate
          ? _self.filteringStartDate
          : filteringStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filteringEndDate: freezed == filteringEndDate
          ? _self.filteringEndDate
          : filteringEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      searchText: null == searchText
          ? _self.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      isFiltering: null == isFiltering
          ? _self.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
