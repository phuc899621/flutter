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
  bool get isTodayTaskLoading;
  bool get isTomorrowTaskLoading;
  bool get isThisWeekLoading;
  List<TaskEntity> get todayTasks;
  List<TaskEntity> get pendingTasks;
  List<TaskEntity> get todayCompletedTasks;
  List<TaskEntity> get tomorrowTasks;
  List<TaskEntity> get thisWeekTasks;
  List<TaskEntity> get thisWeekOverDueTasks;
  List<TaskEntity> get todayOverDueTasks;
  List<TaskEntity> get thisWeekCompletedTasks;
  TaskEntity? get selectedTask;
  String get userName;

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
            (identical(other.isTodayTaskLoading, isTodayTaskLoading) ||
                other.isTodayTaskLoading == isTodayTaskLoading) &&
            (identical(other.isTomorrowTaskLoading, isTomorrowTaskLoading) ||
                other.isTomorrowTaskLoading == isTomorrowTaskLoading) &&
            (identical(other.isThisWeekLoading, isThisWeekLoading) ||
                other.isThisWeekLoading == isThisWeekLoading) &&
            const DeepCollectionEquality()
                .equals(other.todayTasks, todayTasks) &&
            const DeepCollectionEquality()
                .equals(other.pendingTasks, pendingTasks) &&
            const DeepCollectionEquality()
                .equals(other.todayCompletedTasks, todayCompletedTasks) &&
            const DeepCollectionEquality()
                .equals(other.tomorrowTasks, tomorrowTasks) &&
            const DeepCollectionEquality()
                .equals(other.thisWeekTasks, thisWeekTasks) &&
            const DeepCollectionEquality()
                .equals(other.thisWeekOverDueTasks, thisWeekOverDueTasks) &&
            const DeepCollectionEquality()
                .equals(other.todayOverDueTasks, todayOverDueTasks) &&
            const DeepCollectionEquality()
                .equals(other.thisWeekCompletedTasks, thisWeekCompletedTasks) &&
            (identical(other.selectedTask, selectedTask) ||
                other.selectedTask == selectedTask) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      isTodayTaskLoading,
      isTomorrowTaskLoading,
      isThisWeekLoading,
      const DeepCollectionEquality().hash(todayTasks),
      const DeepCollectionEquality().hash(pendingTasks),
      const DeepCollectionEquality().hash(todayCompletedTasks),
      const DeepCollectionEquality().hash(tomorrowTasks),
      const DeepCollectionEquality().hash(thisWeekTasks),
      const DeepCollectionEquality().hash(thisWeekOverDueTasks),
      const DeepCollectionEquality().hash(todayOverDueTasks),
      const DeepCollectionEquality().hash(thisWeekCompletedTasks),
      selectedTask,
      userName);

  @override
  String toString() {
    return 'HomeState(error: $error, isTodayTaskLoading: $isTodayTaskLoading, isTomorrowTaskLoading: $isTomorrowTaskLoading, isThisWeekLoading: $isThisWeekLoading, todayTasks: $todayTasks, pendingTasks: $pendingTasks, todayCompletedTasks: $todayCompletedTasks, tomorrowTasks: $tomorrowTasks, thisWeekTasks: $thisWeekTasks, thisWeekOverDueTasks: $thisWeekOverDueTasks, todayOverDueTasks: $todayOverDueTasks, thisWeekCompletedTasks: $thisWeekCompletedTasks, selectedTask: $selectedTask, userName: $userName)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call(
      {String? error,
      bool isTodayTaskLoading,
      bool isTomorrowTaskLoading,
      bool isThisWeekLoading,
      List<TaskEntity> todayTasks,
      List<TaskEntity> pendingTasks,
      List<TaskEntity> todayCompletedTasks,
      List<TaskEntity> tomorrowTasks,
      List<TaskEntity> thisWeekTasks,
      List<TaskEntity> thisWeekOverDueTasks,
      List<TaskEntity> todayOverDueTasks,
      List<TaskEntity> thisWeekCompletedTasks,
      TaskEntity? selectedTask,
      String userName});

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
    Object? isTodayTaskLoading = null,
    Object? isTomorrowTaskLoading = null,
    Object? isThisWeekLoading = null,
    Object? todayTasks = null,
    Object? pendingTasks = null,
    Object? todayCompletedTasks = null,
    Object? tomorrowTasks = null,
    Object? thisWeekTasks = null,
    Object? thisWeekOverDueTasks = null,
    Object? todayOverDueTasks = null,
    Object? thisWeekCompletedTasks = null,
    Object? selectedTask = freezed,
    Object? userName = null,
  }) {
    return _then(_self.copyWith(
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isTodayTaskLoading: null == isTodayTaskLoading
          ? _self.isTodayTaskLoading
          : isTodayTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTomorrowTaskLoading: null == isTomorrowTaskLoading
          ? _self.isTomorrowTaskLoading
          : isTomorrowTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isThisWeekLoading: null == isThisWeekLoading
          ? _self.isThisWeekLoading
          : isThisWeekLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todayTasks: null == todayTasks
          ? _self.todayTasks
          : todayTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      pendingTasks: null == pendingTasks
          ? _self.pendingTasks
          : pendingTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      todayCompletedTasks: null == todayCompletedTasks
          ? _self.todayCompletedTasks
          : todayCompletedTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      tomorrowTasks: null == tomorrowTasks
          ? _self.tomorrowTasks
          : tomorrowTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      thisWeekTasks: null == thisWeekTasks
          ? _self.thisWeekTasks
          : thisWeekTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      thisWeekOverDueTasks: null == thisWeekOverDueTasks
          ? _self.thisWeekOverDueTasks
          : thisWeekOverDueTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      todayOverDueTasks: null == todayOverDueTasks
          ? _self.todayOverDueTasks
          : todayOverDueTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      thisWeekCompletedTasks: null == thisWeekCompletedTasks
          ? _self.thisWeekCompletedTasks
          : thisWeekCompletedTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      selectedTask: freezed == selectedTask
          ? _self.selectedTask
          : selectedTask // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.isTodayTaskLoading = false,
      this.isTomorrowTaskLoading = false,
      this.isThisWeekLoading = false,
      final List<TaskEntity> todayTasks = const [],
      final List<TaskEntity> pendingTasks = const [],
      final List<TaskEntity> todayCompletedTasks = const [],
      final List<TaskEntity> tomorrowTasks = const [],
      final List<TaskEntity> thisWeekTasks = const [],
      final List<TaskEntity> thisWeekOverDueTasks = const [],
      final List<TaskEntity> todayOverDueTasks = const [],
      final List<TaskEntity> thisWeekCompletedTasks = const [],
      this.selectedTask,
      this.userName = ''})
      : _todayTasks = todayTasks,
        _pendingTasks = pendingTasks,
        _todayCompletedTasks = todayCompletedTasks,
        _tomorrowTasks = tomorrowTasks,
        _thisWeekTasks = thisWeekTasks,
        _thisWeekOverDueTasks = thisWeekOverDueTasks,
        _todayOverDueTasks = todayOverDueTasks,
        _thisWeekCompletedTasks = thisWeekCompletedTasks;

  @override
  final String? error;
  @override
  @JsonKey()
  final bool isTodayTaskLoading;
  @override
  @JsonKey()
  final bool isTomorrowTaskLoading;
  @override
  @JsonKey()
  final bool isThisWeekLoading;
  final List<TaskEntity> _todayTasks;
  @override
  @JsonKey()
  List<TaskEntity> get todayTasks {
    if (_todayTasks is EqualUnmodifiableListView) return _todayTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayTasks);
  }

  final List<TaskEntity> _pendingTasks;
  @override
  @JsonKey()
  List<TaskEntity> get pendingTasks {
    if (_pendingTasks is EqualUnmodifiableListView) return _pendingTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingTasks);
  }

  final List<TaskEntity> _todayCompletedTasks;
  @override
  @JsonKey()
  List<TaskEntity> get todayCompletedTasks {
    if (_todayCompletedTasks is EqualUnmodifiableListView)
      return _todayCompletedTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayCompletedTasks);
  }

  final List<TaskEntity> _tomorrowTasks;
  @override
  @JsonKey()
  List<TaskEntity> get tomorrowTasks {
    if (_tomorrowTasks is EqualUnmodifiableListView) return _tomorrowTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tomorrowTasks);
  }

  final List<TaskEntity> _thisWeekTasks;
  @override
  @JsonKey()
  List<TaskEntity> get thisWeekTasks {
    if (_thisWeekTasks is EqualUnmodifiableListView) return _thisWeekTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thisWeekTasks);
  }

  final List<TaskEntity> _thisWeekOverDueTasks;
  @override
  @JsonKey()
  List<TaskEntity> get thisWeekOverDueTasks {
    if (_thisWeekOverDueTasks is EqualUnmodifiableListView)
      return _thisWeekOverDueTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thisWeekOverDueTasks);
  }

  final List<TaskEntity> _todayOverDueTasks;
  @override
  @JsonKey()
  List<TaskEntity> get todayOverDueTasks {
    if (_todayOverDueTasks is EqualUnmodifiableListView)
      return _todayOverDueTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayOverDueTasks);
  }

  final List<TaskEntity> _thisWeekCompletedTasks;
  @override
  @JsonKey()
  List<TaskEntity> get thisWeekCompletedTasks {
    if (_thisWeekCompletedTasks is EqualUnmodifiableListView)
      return _thisWeekCompletedTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thisWeekCompletedTasks);
  }

  @override
  final TaskEntity? selectedTask;
  @override
  @JsonKey()
  final String userName;

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
            (identical(other.isTodayTaskLoading, isTodayTaskLoading) ||
                other.isTodayTaskLoading == isTodayTaskLoading) &&
            (identical(other.isTomorrowTaskLoading, isTomorrowTaskLoading) ||
                other.isTomorrowTaskLoading == isTomorrowTaskLoading) &&
            (identical(other.isThisWeekLoading, isThisWeekLoading) ||
                other.isThisWeekLoading == isThisWeekLoading) &&
            const DeepCollectionEquality()
                .equals(other._todayTasks, _todayTasks) &&
            const DeepCollectionEquality()
                .equals(other._pendingTasks, _pendingTasks) &&
            const DeepCollectionEquality()
                .equals(other._todayCompletedTasks, _todayCompletedTasks) &&
            const DeepCollectionEquality()
                .equals(other._tomorrowTasks, _tomorrowTasks) &&
            const DeepCollectionEquality()
                .equals(other._thisWeekTasks, _thisWeekTasks) &&
            const DeepCollectionEquality()
                .equals(other._thisWeekOverDueTasks, _thisWeekOverDueTasks) &&
            const DeepCollectionEquality()
                .equals(other._todayOverDueTasks, _todayOverDueTasks) &&
            const DeepCollectionEquality().equals(
                other._thisWeekCompletedTasks, _thisWeekCompletedTasks) &&
            (identical(other.selectedTask, selectedTask) ||
                other.selectedTask == selectedTask) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      error,
      isTodayTaskLoading,
      isTomorrowTaskLoading,
      isThisWeekLoading,
      const DeepCollectionEquality().hash(_todayTasks),
      const DeepCollectionEquality().hash(_pendingTasks),
      const DeepCollectionEquality().hash(_todayCompletedTasks),
      const DeepCollectionEquality().hash(_tomorrowTasks),
      const DeepCollectionEquality().hash(_thisWeekTasks),
      const DeepCollectionEquality().hash(_thisWeekOverDueTasks),
      const DeepCollectionEquality().hash(_todayOverDueTasks),
      const DeepCollectionEquality().hash(_thisWeekCompletedTasks),
      selectedTask,
      userName);

  @override
  String toString() {
    return 'HomeState(error: $error, isTodayTaskLoading: $isTodayTaskLoading, isTomorrowTaskLoading: $isTomorrowTaskLoading, isThisWeekLoading: $isThisWeekLoading, todayTasks: $todayTasks, pendingTasks: $pendingTasks, todayCompletedTasks: $todayCompletedTasks, tomorrowTasks: $tomorrowTasks, thisWeekTasks: $thisWeekTasks, thisWeekOverDueTasks: $thisWeekOverDueTasks, todayOverDueTasks: $todayOverDueTasks, thisWeekCompletedTasks: $thisWeekCompletedTasks, selectedTask: $selectedTask, userName: $userName)';
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
      bool isTodayTaskLoading,
      bool isTomorrowTaskLoading,
      bool isThisWeekLoading,
      List<TaskEntity> todayTasks,
      List<TaskEntity> pendingTasks,
      List<TaskEntity> todayCompletedTasks,
      List<TaskEntity> tomorrowTasks,
      List<TaskEntity> thisWeekTasks,
      List<TaskEntity> thisWeekOverDueTasks,
      List<TaskEntity> todayOverDueTasks,
      List<TaskEntity> thisWeekCompletedTasks,
      TaskEntity? selectedTask,
      String userName});

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
    Object? isTodayTaskLoading = null,
    Object? isTomorrowTaskLoading = null,
    Object? isThisWeekLoading = null,
    Object? todayTasks = null,
    Object? pendingTasks = null,
    Object? todayCompletedTasks = null,
    Object? tomorrowTasks = null,
    Object? thisWeekTasks = null,
    Object? thisWeekOverDueTasks = null,
    Object? todayOverDueTasks = null,
    Object? thisWeekCompletedTasks = null,
    Object? selectedTask = freezed,
    Object? userName = null,
  }) {
    return _then(_HomeState(
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isTodayTaskLoading: null == isTodayTaskLoading
          ? _self.isTodayTaskLoading
          : isTodayTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTomorrowTaskLoading: null == isTomorrowTaskLoading
          ? _self.isTomorrowTaskLoading
          : isTomorrowTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isThisWeekLoading: null == isThisWeekLoading
          ? _self.isThisWeekLoading
          : isThisWeekLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todayTasks: null == todayTasks
          ? _self._todayTasks
          : todayTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      pendingTasks: null == pendingTasks
          ? _self._pendingTasks
          : pendingTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      todayCompletedTasks: null == todayCompletedTasks
          ? _self._todayCompletedTasks
          : todayCompletedTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      tomorrowTasks: null == tomorrowTasks
          ? _self._tomorrowTasks
          : tomorrowTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      thisWeekTasks: null == thisWeekTasks
          ? _self._thisWeekTasks
          : thisWeekTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      thisWeekOverDueTasks: null == thisWeekOverDueTasks
          ? _self._thisWeekOverDueTasks
          : thisWeekOverDueTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      todayOverDueTasks: null == todayOverDueTasks
          ? _self._todayOverDueTasks
          : todayOverDueTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      thisWeekCompletedTasks: null == thisWeekCompletedTasks
          ? _self._thisWeekCompletedTasks
          : thisWeekCompletedTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      selectedTask: freezed == selectedTask
          ? _self.selectedTask
          : selectedTask // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
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
