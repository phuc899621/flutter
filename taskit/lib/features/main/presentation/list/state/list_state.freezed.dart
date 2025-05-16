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
  String? get error;
  DateTime? get selectedDate;
  String? get selectedStatus;
  List<TaskModel> get tasks;

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
            (identical(other.error, error) || other.error == error) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedStatus, selectedStatus) ||
                other.selectedStatus == selectedStatus) &&
            const DeepCollectionEquality().equals(other.tasks, tasks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, selectedDate,
      selectedStatus, const DeepCollectionEquality().hash(tasks));

  @override
  String toString() {
    return 'ListState(error: $error, selectedDate: $selectedDate, selectedStatus: $selectedStatus, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class $ListStateCopyWith<$Res> {
  factory $ListStateCopyWith(ListState value, $Res Function(ListState) _then) =
      _$ListStateCopyWithImpl;
  @useResult
  $Res call(
      {String? error,
      DateTime? selectedDate,
      String? selectedStatus,
      List<TaskModel> tasks});
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
    Object? error = freezed,
    Object? selectedDate = freezed,
    Object? selectedStatus = freezed,
    Object? tasks = null,
  }) {
    return _then(_self.copyWith(
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedStatus: freezed == selectedStatus
          ? _self.selectedStatus
          : selectedStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _ListState implements ListState {
  const _ListState(
      {this.error,
      this.selectedDate,
      this.selectedStatus,
      final List<TaskModel> tasks = const []})
      : _tasks = tasks;

  @override
  final String? error;
  @override
  final DateTime? selectedDate;
  @override
  final String? selectedStatus;
  final List<TaskModel> _tasks;
  @override
  @JsonKey()
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

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
            (identical(other.error, error) || other.error == error) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedStatus, selectedStatus) ||
                other.selectedStatus == selectedStatus) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, selectedDate,
      selectedStatus, const DeepCollectionEquality().hash(_tasks));

  @override
  String toString() {
    return 'ListState(error: $error, selectedDate: $selectedDate, selectedStatus: $selectedStatus, tasks: $tasks)';
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
      {String? error,
      DateTime? selectedDate,
      String? selectedStatus,
      List<TaskModel> tasks});
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
    Object? error = freezed,
    Object? selectedDate = freezed,
    Object? selectedStatus = freezed,
    Object? tasks = null,
  }) {
    return _then(_ListState(
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedStatus: freezed == selectedStatus
          ? _self.selectedStatus
          : selectedStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      tasks: null == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

// dart format on
