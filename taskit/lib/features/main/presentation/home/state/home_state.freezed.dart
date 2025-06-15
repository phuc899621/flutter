// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {
  String? get error;
  bool get isScheduledLoading;
  bool get isDeadLineLoading;
  bool get isToDoLoading;
  List<TaskEntity> get scheduledTasks;
  List<TaskEntity> get allTasks;
  TaskEntity? get selectedTask;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isScheduledLoading, isScheduledLoading) ||
                other.isScheduledLoading == isScheduledLoading) &&
            (identical(other.isDeadLineLoading, isDeadLineLoading) ||
                other.isDeadLineLoading == isDeadLineLoading) &&
            (identical(other.isToDoLoading, isToDoLoading) ||
                other.isToDoLoading == isToDoLoading) &&
            const DeepCollectionEquality()
                .equals(other.scheduledTasks, scheduledTasks) &&
            const DeepCollectionEquality().equals(other.allTasks, allTasks) &&
            (identical(other.selectedTask, selectedTask) ||
                other.selectedTask == selectedTask));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      isScheduledLoading,
      isDeadLineLoading,
      isToDoLoading,
      const DeepCollectionEquality().hash(scheduledTasks),
      const DeepCollectionEquality().hash(allTasks),
      selectedTask);

  @override
  String toString() {
    return 'HomeState(error: $error, isScheduledLoading: $isScheduledLoading, isDeadLineLoading: $isDeadLineLoading, isToDoLoading: $isToDoLoading, scheduledTasks: $scheduledTasks, allTasks: $allTasks, selectedTask: $selectedTask)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call(
      {String? error,
      bool isScheduledLoading,
      bool isDeadLineLoading,
      bool isToDoLoading,
      List<TaskEntity> scheduledTasks,
      List<TaskEntity> allTasks,
      TaskEntity? selectedTask});

  $TaskEntityCopyWith<$Res>? get selectedTask;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? isScheduledLoading = null,
    Object? isDeadLineLoading = null,
    Object? isToDoLoading = null,
    Object? scheduledTasks = null,
    Object? allTasks = null,
    Object? selectedTask = freezed,
  }) {
    return _then(_self.copyWith(
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isScheduledLoading: null == isScheduledLoading
          ? _self.isScheduledLoading
          : isScheduledLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeadLineLoading: null == isDeadLineLoading
          ? _self.isDeadLineLoading
          : isDeadLineLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isToDoLoading: null == isToDoLoading
          ? _self.isToDoLoading
          : isToDoLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledTasks: null == scheduledTasks
          ? _self.scheduledTasks
          : scheduledTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      allTasks: null == allTasks
          ? _self.allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      selectedTask: freezed == selectedTask
          ? _self.selectedTask
          : selectedTask // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
    ));
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<$Res>? get selectedTask {
    if (_self.selectedTask == null) {
      return null;
    }

    return $TaskEntityCopyWith<$Res>(_self.selectedTask!, (value) {
      return _then(_self.copyWith(selectedTask: value));
    });
  }
}

/// @nodoc

class _HomeState implements HomeState {
  _HomeState(
      {this.error,
      this.isScheduledLoading = false,
      this.isDeadLineLoading = false,
      this.isToDoLoading = false,
      final List<TaskEntity> scheduledTasks = const [],
      final List<TaskEntity> allTasks = const [],
      this.selectedTask})
      : _scheduledTasks = scheduledTasks,
        _allTasks = allTasks;

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isScheduledLoading;
  @override
  @JsonKey()
  final bool isDeadLineLoading;
  @override
  @JsonKey()
  final bool isToDoLoading;
  final List<TaskEntity> _scheduledTasks;
  @override
  @JsonKey()
  List<TaskEntity> get scheduledTasks {
    if (_scheduledTasks is EqualUnmodifiableListView) return _scheduledTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduledTasks);
  }

  final List<TaskEntity> _allTasks;
  @override
  @JsonKey()
  List<TaskEntity> get allTasks {
    if (_allTasks is EqualUnmodifiableListView) return _allTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTasks);
  }

  @override
  final TaskEntity? selectedTask;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isScheduledLoading, isScheduledLoading) ||
                other.isScheduledLoading == isScheduledLoading) &&
            (identical(other.isDeadLineLoading, isDeadLineLoading) ||
                other.isDeadLineLoading == isDeadLineLoading) &&
            (identical(other.isToDoLoading, isToDoLoading) ||
                other.isToDoLoading == isToDoLoading) &&
            const DeepCollectionEquality()
                .equals(other._scheduledTasks, _scheduledTasks) &&
            const DeepCollectionEquality().equals(other._allTasks, _allTasks) &&
            (identical(other.selectedTask, selectedTask) ||
                other.selectedTask == selectedTask));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      isScheduledLoading,
      isDeadLineLoading,
      isToDoLoading,
      const DeepCollectionEquality().hash(_scheduledTasks),
      const DeepCollectionEquality().hash(_allTasks),
      selectedTask);

  @override
  String toString() {
    return 'HomeState(error: $error, isScheduledLoading: $isScheduledLoading, isDeadLineLoading: $isDeadLineLoading, isToDoLoading: $isToDoLoading, scheduledTasks: $scheduledTasks, allTasks: $allTasks, selectedTask: $selectedTask)';
  }
}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) _then) =
      __$HomeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? error,
      bool isScheduledLoading,
      bool isDeadLineLoading,
      bool isToDoLoading,
      List<TaskEntity> scheduledTasks,
      List<TaskEntity> allTasks,
      TaskEntity? selectedTask});

  @override
  $TaskEntityCopyWith<$Res>? get selectedTask;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = freezed,
    Object? isScheduledLoading = null,
    Object? isDeadLineLoading = null,
    Object? isToDoLoading = null,
    Object? scheduledTasks = null,
    Object? allTasks = null,
    Object? selectedTask = freezed,
  }) {
    return _then(_HomeState(
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isScheduledLoading: null == isScheduledLoading
          ? _self.isScheduledLoading
          : isScheduledLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeadLineLoading: null == isDeadLineLoading
          ? _self.isDeadLineLoading
          : isDeadLineLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isToDoLoading: null == isToDoLoading
          ? _self.isToDoLoading
          : isToDoLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledTasks: null == scheduledTasks
          ? _self._scheduledTasks
          : scheduledTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      allTasks: null == allTasks
          ? _self._allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      selectedTask: freezed == selectedTask
          ? _self.selectedTask
          : selectedTask // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
    ));
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<$Res>? get selectedTask {
    if (_self.selectedTask == null) {
      return null;
    }

    return $TaskEntityCopyWith<$Res>(_self.selectedTask!, (value) {
      return _then(_self.copyWith(selectedTask: value));
    });
  }
}

// dart format on
