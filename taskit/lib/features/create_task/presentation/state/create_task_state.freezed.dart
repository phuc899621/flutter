// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTaskState {
  bool get isLoading;
  bool? get isCreateTaskSuccess;
  String? get error;
  List<SubtaskReq> get subtasks;
  String get selectedPriority;
  String get selectedCategory;
  DateTime? get selectedDate;
  Map<String, dynamic> get createTaskForm;

  /// Create a copy of CreateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTaskStateCopyWith<CreateTaskState> get copyWith =>
      _$CreateTaskStateCopyWithImpl<CreateTaskState>(
          this as CreateTaskState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTaskState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCreateTaskSuccess, isCreateTaskSuccess) ||
                other.isCreateTaskSuccess == isCreateTaskSuccess) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks) &&
            (identical(other.selectedPriority, selectedPriority) ||
                other.selectedPriority == selectedPriority) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            const DeepCollectionEquality()
                .equals(other.createTaskForm, createTaskForm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isCreateTaskSuccess,
      error,
      const DeepCollectionEquality().hash(subtasks),
      selectedPriority,
      selectedCategory,
      selectedDate,
      const DeepCollectionEquality().hash(createTaskForm));

  @override
  String toString() {
    return 'CreateTaskState(isLoading: $isLoading, isCreateTaskSuccess: $isCreateTaskSuccess, error: $error, subtasks: $subtasks, selectedPriority: $selectedPriority, selectedCategory: $selectedCategory, selectedDate: $selectedDate, createTaskForm: $createTaskForm)';
  }
}

/// @nodoc
abstract mixin class $CreateTaskStateCopyWith<$Res> {
  factory $CreateTaskStateCopyWith(
          CreateTaskState value, $Res Function(CreateTaskState) _then) =
      _$CreateTaskStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      bool? isCreateTaskSuccess,
      String? error,
      List<SubtaskReq> subtasks,
      String selectedPriority,
      String selectedCategory,
      DateTime? selectedDate,
      Map<String, dynamic> createTaskForm});
}

/// @nodoc
class _$CreateTaskStateCopyWithImpl<$Res>
    implements $CreateTaskStateCopyWith<$Res> {
  _$CreateTaskStateCopyWithImpl(this._self, this._then);

  final CreateTaskState _self;
  final $Res Function(CreateTaskState) _then;

  /// Create a copy of CreateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCreateTaskSuccess = freezed,
    Object? error = freezed,
    Object? subtasks = null,
    Object? selectedPriority = null,
    Object? selectedCategory = null,
    Object? selectedDate = freezed,
    Object? createTaskForm = null,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskSuccess: freezed == isCreateTaskSuccess
          ? _self.isCreateTaskSuccess
          : isCreateTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      subtasks: null == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskReq>,
      selectedPriority: null == selectedPriority
          ? _self.selectedPriority
          : selectedPriority // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCategory: null == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createTaskForm: null == createTaskForm
          ? _self.createTaskForm
          : createTaskForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _CreateTaskState implements CreateTaskState {
  const _CreateTaskState(
      {this.isLoading = false,
      this.isCreateTaskSuccess,
      this.error,
      final List<SubtaskReq> subtasks = const [],
      this.selectedPriority = 'none',
      this.selectedCategory = 'All',
      this.selectedDate,
      final Map<String, dynamic> createTaskForm = const {}})
      : _subtasks = subtasks,
        _createTaskForm = createTaskForm;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? isCreateTaskSuccess;
  @override
  final String? error;
  final List<SubtaskReq> _subtasks;
  @override
  @JsonKey()
  List<SubtaskReq> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  @override
  @JsonKey()
  final String selectedPriority;
  @override
  @JsonKey()
  final String selectedCategory;
  @override
  final DateTime? selectedDate;
  final Map<String, dynamic> _createTaskForm;
  @override
  @JsonKey()
  Map<String, dynamic> get createTaskForm {
    if (_createTaskForm is EqualUnmodifiableMapView) return _createTaskForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_createTaskForm);
  }

  /// Create a copy of CreateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateTaskStateCopyWith<_CreateTaskState> get copyWith =>
      __$CreateTaskStateCopyWithImpl<_CreateTaskState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateTaskState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCreateTaskSuccess, isCreateTaskSuccess) ||
                other.isCreateTaskSuccess == isCreateTaskSuccess) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks) &&
            (identical(other.selectedPriority, selectedPriority) ||
                other.selectedPriority == selectedPriority) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            const DeepCollectionEquality()
                .equals(other._createTaskForm, _createTaskForm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isCreateTaskSuccess,
      error,
      const DeepCollectionEquality().hash(_subtasks),
      selectedPriority,
      selectedCategory,
      selectedDate,
      const DeepCollectionEquality().hash(_createTaskForm));

  @override
  String toString() {
    return 'CreateTaskState(isLoading: $isLoading, isCreateTaskSuccess: $isCreateTaskSuccess, error: $error, subtasks: $subtasks, selectedPriority: $selectedPriority, selectedCategory: $selectedCategory, selectedDate: $selectedDate, createTaskForm: $createTaskForm)';
  }
}

/// @nodoc
abstract mixin class _$CreateTaskStateCopyWith<$Res>
    implements $CreateTaskStateCopyWith<$Res> {
  factory _$CreateTaskStateCopyWith(
          _CreateTaskState value, $Res Function(_CreateTaskState) _then) =
      __$CreateTaskStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool? isCreateTaskSuccess,
      String? error,
      List<SubtaskReq> subtasks,
      String selectedPriority,
      String selectedCategory,
      DateTime? selectedDate,
      Map<String, dynamic> createTaskForm});
}

/// @nodoc
class __$CreateTaskStateCopyWithImpl<$Res>
    implements _$CreateTaskStateCopyWith<$Res> {
  __$CreateTaskStateCopyWithImpl(this._self, this._then);

  final _CreateTaskState _self;
  final $Res Function(_CreateTaskState) _then;

  /// Create a copy of CreateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? isCreateTaskSuccess = freezed,
    Object? error = freezed,
    Object? subtasks = null,
    Object? selectedPriority = null,
    Object? selectedCategory = null,
    Object? selectedDate = freezed,
    Object? createTaskForm = null,
  }) {
    return _then(_CreateTaskState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskSuccess: freezed == isCreateTaskSuccess
          ? _self.isCreateTaskSuccess
          : isCreateTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      subtasks: null == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskReq>,
      selectedPriority: null == selectedPriority
          ? _self.selectedPriority
          : selectedPriority // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCategory: null == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createTaskForm: null == createTaskForm
          ? _self._createTaskForm
          : createTaskForm // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

// dart format on
