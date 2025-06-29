// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineState {
  List<TaskEntity> get tasks;
  List<TaskEntity> get allTasks;
  bool get isLoading;
  DateTime? get focusDate;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimelineStateCopyWith<TimelineState> get copyWith =>
      _$TimelineStateCopyWithImpl<TimelineState>(
          this as TimelineState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimelineState &&
            const DeepCollectionEquality().equals(other.tasks, tasks) &&
            const DeepCollectionEquality().equals(other.allTasks, allTasks) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.focusDate, focusDate) ||
                other.focusDate == focusDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tasks),
      const DeepCollectionEquality().hash(allTasks),
      isLoading,
      focusDate);

  @override
  String toString() {
    return 'TimelineState(tasks: $tasks, allTasks: $allTasks, isLoading: $isLoading, focusDate: $focusDate)';
  }
}

/// @nodoc
abstract mixin class $TimelineStateCopyWith<$Res> {
  factory $TimelineStateCopyWith(
          TimelineState value, $Res Function(TimelineState) _then) =
      _$TimelineStateCopyWithImpl;
  @useResult
  $Res call(
      {List<TaskEntity> tasks,
      List<TaskEntity> allTasks,
      bool isLoading,
      DateTime? focusDate});
}

/// @nodoc
class _$TimelineStateCopyWithImpl<$Res>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._self, this._then);

  final TimelineState _self;
  final $Res Function(TimelineState) _then;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? allTasks = null,
    Object? isLoading = null,
    Object? focusDate = freezed,
  }) {
    return _then(_self.copyWith(
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      allTasks: null == allTasks
          ? _self.allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      focusDate: freezed == focusDate
          ? _self.focusDate
          : focusDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _TimelineState implements TimelineState {
  const _TimelineState(
      {final List<TaskEntity> tasks = const [],
      final List<TaskEntity> allTasks = const [],
      this.isLoading = true,
      this.focusDate})
      : _tasks = tasks,
        _allTasks = allTasks;

  final List<TaskEntity> _tasks;
  @override
  @JsonKey()
  List<TaskEntity> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
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
  @JsonKey()
  final bool isLoading;
  @override
  final DateTime? focusDate;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimelineStateCopyWith<_TimelineState> get copyWith =>
      __$TimelineStateCopyWithImpl<_TimelineState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimelineState &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(other._allTasks, _allTasks) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.focusDate, focusDate) ||
                other.focusDate == focusDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_allTasks),
      isLoading,
      focusDate);

  @override
  String toString() {
    return 'TimelineState(tasks: $tasks, allTasks: $allTasks, isLoading: $isLoading, focusDate: $focusDate)';
  }
}

/// @nodoc
abstract mixin class _$TimelineStateCopyWith<$Res>
    implements $TimelineStateCopyWith<$Res> {
  factory _$TimelineStateCopyWith(
          _TimelineState value, $Res Function(_TimelineState) _then) =
      __$TimelineStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<TaskEntity> tasks,
      List<TaskEntity> allTasks,
      bool isLoading,
      DateTime? focusDate});
}

/// @nodoc
class __$TimelineStateCopyWithImpl<$Res>
    implements _$TimelineStateCopyWith<$Res> {
  __$TimelineStateCopyWithImpl(this._self, this._then);

  final _TimelineState _self;
  final $Res Function(_TimelineState) _then;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tasks = null,
    Object? allTasks = null,
    Object? isLoading = null,
    Object? focusDate = freezed,
  }) {
    return _then(_TimelineState(
      tasks: null == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      allTasks: null == allTasks
          ? _self._allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      focusDate: freezed == focusDate
          ? _self.focusDate
          : focusDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
