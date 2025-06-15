// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddTaskState {
  bool get isLoading;
  bool get isCategoriesLoading;
  bool? get isCreateTaskSuccess;
  String? get error;
  List<CategoryEntity> get categories;
  List<CategoryEntity> get aiCategories;
  List<SubtaskEntity> get subtasks;
  TaskPriority get selectedPriority;
  CategoryEntity? get selectedCategory;
  DateTime? get selectedDate;
  Map<String, dynamic> get addTaskForm;
  String get title;
  String get description;
  dynamic get isTimeSelected;

  /// Create a copy of AddTaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddTaskStateCopyWith<AddTaskState> get copyWith =>
      _$AddTaskStateCopyWithImpl<AddTaskState>(
          this as AddTaskState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddTaskState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCategoriesLoading, isCategoriesLoading) ||
                other.isCategoriesLoading == isCategoriesLoading) &&
            (identical(other.isCreateTaskSuccess, isCreateTaskSuccess) ||
                other.isCreateTaskSuccess == isCreateTaskSuccess) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.aiCategories, aiCategories) &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks) &&
            (identical(other.selectedPriority, selectedPriority) ||
                other.selectedPriority == selectedPriority) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            const DeepCollectionEquality()
                .equals(other.addTaskForm, addTaskForm) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.isTimeSelected, isTimeSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isCategoriesLoading,
      isCreateTaskSuccess,
      error,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(aiCategories),
      const DeepCollectionEquality().hash(subtasks),
      selectedPriority,
      selectedCategory,
      selectedDate,
      const DeepCollectionEquality().hash(addTaskForm),
      title,
      description,
      const DeepCollectionEquality().hash(isTimeSelected));

  @override
  String toString() {
    return 'AddTaskState(isLoading: $isLoading, isCategoriesLoading: $isCategoriesLoading, isCreateTaskSuccess: $isCreateTaskSuccess, error: $error, categories: $categories, aiCategories: $aiCategories, subtasks: $subtasks, selectedPriority: $selectedPriority, selectedCategory: $selectedCategory, selectedDate: $selectedDate, addTaskForm: $addTaskForm, title: $title, description: $description, isTimeSelected: $isTimeSelected)';
  }
}

/// @nodoc
abstract mixin class $AddTaskStateCopyWith<$Res> {
  factory $AddTaskStateCopyWith(
          AddTaskState value, $Res Function(AddTaskState) _then) =
      _$AddTaskStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool isCategoriesLoading,
      bool? isCreateTaskSuccess,
      String? error,
      List<CategoryEntity> categories,
      List<CategoryEntity> aiCategories,
      List<SubtaskEntity> subtasks,
      TaskPriority selectedPriority,
      CategoryEntity? selectedCategory,
      DateTime? selectedDate,
      Map<String, dynamic> addTaskForm,
      String title,
      String description,
      dynamic isTimeSelected});

  $CategoryEntityCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class _$AddTaskStateCopyWithImpl<$Res> implements $AddTaskStateCopyWith<$Res> {
  _$AddTaskStateCopyWithImpl(this._self, this._then);

  final AddTaskState _self;
  final $Res Function(AddTaskState) _then;

  /// Create a copy of AddTaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCategoriesLoading = null,
    Object? isCreateTaskSuccess = freezed,
    Object? error = freezed,
    Object? categories = null,
    Object? aiCategories = null,
    Object? subtasks = null,
    Object? selectedPriority = null,
    Object? selectedCategory = freezed,
    Object? selectedDate = freezed,
    Object? addTaskForm = null,
    Object? title = null,
    Object? description = null,
    Object? isTimeSelected = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoriesLoading: null == isCategoriesLoading
          ? _self.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskSuccess: freezed == isCreateTaskSuccess
          ? _self.isCreateTaskSuccess
          : isCreateTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      aiCategories: null == aiCategories
          ? _self.aiCategories
          : aiCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      subtasks: null == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskEntity>,
      selectedPriority: null == selectedPriority
          ? _self.selectedPriority
          : selectedPriority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryEntity?,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addTaskForm: null == addTaskForm
          ? _self.addTaskForm
          : addTaskForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isTimeSelected: freezed == isTimeSelected
          ? _self.isTimeSelected
          : isTimeSelected // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of AddTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryEntityCopyWith<$Res>? get selectedCategory {
    if (_self.selectedCategory == null) {
      return null;
    }

    return $CategoryEntityCopyWith<$Res>(_self.selectedCategory!, (value) {
      return _then(_self.copyWith(selectedCategory: value));
    });
  }
}

/// @nodoc

class _AddTaskState implements AddTaskState {
  const _AddTaskState(
      {this.isLoading = false,
      this.isCategoriesLoading = false,
      this.isCreateTaskSuccess,
      this.error,
      final List<CategoryEntity> categories = const [],
      final List<CategoryEntity> aiCategories = const [],
      final List<SubtaskEntity> subtasks = const [],
      this.selectedPriority = TaskPriority.none,
      this.selectedCategory,
      this.selectedDate,
      final Map<String, dynamic> addTaskForm = const {},
      this.title = '',
      this.description = '',
      this.isTimeSelected = false})
      : _categories = categories,
        _aiCategories = aiCategories,
        _subtasks = subtasks,
        _addTaskForm = addTaskForm;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCategoriesLoading;
  @override
  final bool? isCreateTaskSuccess;
  @override
  final String? error;
  final List<CategoryEntity> _categories;
  @override
  @JsonKey()
  List<CategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryEntity> _aiCategories;
  @override
  @JsonKey()
  List<CategoryEntity> get aiCategories {
    if (_aiCategories is EqualUnmodifiableListView) return _aiCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aiCategories);
  }

  final List<SubtaskEntity> _subtasks;
  @override
  @JsonKey()
  List<SubtaskEntity> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  @override
  @JsonKey()
  final TaskPriority selectedPriority;
  @override
  final CategoryEntity? selectedCategory;
  @override
  final DateTime? selectedDate;
  final Map<String, dynamic> _addTaskForm;
  @override
  @JsonKey()
  Map<String, dynamic> get addTaskForm {
    if (_addTaskForm is EqualUnmodifiableMapView) return _addTaskForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_addTaskForm);
  }

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final dynamic isTimeSelected;

  /// Create a copy of AddTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddTaskStateCopyWith<_AddTaskState> get copyWith =>
      __$AddTaskStateCopyWithImpl<_AddTaskState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddTaskState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCategoriesLoading, isCategoriesLoading) ||
                other.isCategoriesLoading == isCategoriesLoading) &&
            (identical(other.isCreateTaskSuccess, isCreateTaskSuccess) ||
                other.isCreateTaskSuccess == isCreateTaskSuccess) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._aiCategories, _aiCategories) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks) &&
            (identical(other.selectedPriority, selectedPriority) ||
                other.selectedPriority == selectedPriority) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            const DeepCollectionEquality()
                .equals(other._addTaskForm, _addTaskForm) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.isTimeSelected, isTimeSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isCategoriesLoading,
      isCreateTaskSuccess,
      error,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_aiCategories),
      const DeepCollectionEquality().hash(_subtasks),
      selectedPriority,
      selectedCategory,
      selectedDate,
      const DeepCollectionEquality().hash(_addTaskForm),
      title,
      description,
      const DeepCollectionEquality().hash(isTimeSelected));

  @override
  String toString() {
    return 'AddTaskState(isLoading: $isLoading, isCategoriesLoading: $isCategoriesLoading, isCreateTaskSuccess: $isCreateTaskSuccess, error: $error, categories: $categories, aiCategories: $aiCategories, subtasks: $subtasks, selectedPriority: $selectedPriority, selectedCategory: $selectedCategory, selectedDate: $selectedDate, addTaskForm: $addTaskForm, title: $title, description: $description, isTimeSelected: $isTimeSelected)';
  }
}

/// @nodoc
abstract mixin class _$AddTaskStateCopyWith<$Res>
    implements $AddTaskStateCopyWith<$Res> {
  factory _$AddTaskStateCopyWith(
          _AddTaskState value, $Res Function(_AddTaskState) _then) =
      __$AddTaskStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isCategoriesLoading,
      bool? isCreateTaskSuccess,
      String? error,
      List<CategoryEntity> categories,
      List<CategoryEntity> aiCategories,
      List<SubtaskEntity> subtasks,
      TaskPriority selectedPriority,
      CategoryEntity? selectedCategory,
      DateTime? selectedDate,
      Map<String, dynamic> addTaskForm,
      String title,
      String description,
      dynamic isTimeSelected});

  @override
  $CategoryEntityCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class __$AddTaskStateCopyWithImpl<$Res>
    implements _$AddTaskStateCopyWith<$Res> {
  __$AddTaskStateCopyWithImpl(this._self, this._then);

  final _AddTaskState _self;
  final $Res Function(_AddTaskState) _then;

  /// Create a copy of AddTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isCategoriesLoading = null,
    Object? isCreateTaskSuccess = freezed,
    Object? error = freezed,
    Object? categories = null,
    Object? aiCategories = null,
    Object? subtasks = null,
    Object? selectedPriority = null,
    Object? selectedCategory = freezed,
    Object? selectedDate = freezed,
    Object? addTaskForm = null,
    Object? title = null,
    Object? description = null,
    Object? isTimeSelected = freezed,
  }) {
    return _then(_AddTaskState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoriesLoading: null == isCategoriesLoading
          ? _self.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskSuccess: freezed == isCreateTaskSuccess
          ? _self.isCreateTaskSuccess
          : isCreateTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      aiCategories: null == aiCategories
          ? _self._aiCategories
          : aiCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
      subtasks: null == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskEntity>,
      selectedPriority: null == selectedPriority
          ? _self.selectedPriority
          : selectedPriority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      selectedCategory: freezed == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryEntity?,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addTaskForm: null == addTaskForm
          ? _self._addTaskForm
          : addTaskForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isTimeSelected: freezed == isTimeSelected
          ? _self.isTimeSelected
          : isTimeSelected // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of AddTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryEntityCopyWith<$Res>? get selectedCategory {
    if (_self.selectedCategory == null) {
      return null;
    }

    return $CategoryEntityCopyWith<$Res>(_self.selectedCategory!, (value) {
      return _then(_self.copyWith(selectedCategory: value));
    });
  }
}

// dart format on
