// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskData {
  @JsonKey(name: '_id')
  String get id;
  String get title;
  String get description;
  String get category;
  String get priority;
  UserData get userId;
  String get status;
  DateTime get dueDate;
  List<SubtaskData> get subtasks;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskDataCopyWith<TaskData> get copyWith =>
      _$TaskDataCopyWithImpl<TaskData>(this as TaskData, _$identity);

  /// Serializes this TaskData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other.subtasks, subtasks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      priority,
      userId,
      status,
      dueDate,
      const DeepCollectionEquality().hash(subtasks),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'TaskData(id: $id, title: $title, description: $description, category: $category, priority: $priority, userId: $userId, status: $status, dueDate: $dueDate, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $TaskDataCopyWith<$Res> {
  factory $TaskDataCopyWith(TaskData value, $Res Function(TaskData) _then) =
      _$TaskDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      String description,
      String category,
      String priority,
      UserData userId,
      String status,
      DateTime dueDate,
      List<SubtaskData> subtasks,
      DateTime createdAt,
      DateTime updatedAt});

  $UserDataCopyWith<$Res> get userId;
}

/// @nodoc
class _$TaskDataCopyWithImpl<$Res> implements $TaskDataCopyWith<$Res> {
  _$TaskDataCopyWithImpl(this._self, this._then);

  final TaskData _self;
  final $Res Function(TaskData) _then;

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? userId = null,
    Object? status = null,
    Object? dueDate = null,
    Object? subtasks = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserData,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _self.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskData>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get userId {
    return $UserDataCopyWith<$Res>(_self.userId, (value) {
      return _then(_self.copyWith(userId: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _TaskData implements TaskData {
  const _TaskData(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.priority,
      required this.userId,
      required this.status,
      required this.dueDate,
      required final List<SubtaskData> subtasks,
      required this.createdAt,
      required this.updatedAt})
      : _subtasks = subtasks;
  factory _TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final String priority;
  @override
  final UserData userId;
  @override
  final String status;
  @override
  final DateTime dueDate;
  final List<SubtaskData> _subtasks;
  @override
  List<SubtaskData> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskDataCopyWith<_TaskData> get copyWith =>
      __$TaskDataCopyWithImpl<_TaskData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      priority,
      userId,
      status,
      dueDate,
      const DeepCollectionEquality().hash(_subtasks),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'TaskData(id: $id, title: $title, description: $description, category: $category, priority: $priority, userId: $userId, status: $status, dueDate: $dueDate, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$TaskDataCopyWith<$Res>
    implements $TaskDataCopyWith<$Res> {
  factory _$TaskDataCopyWith(_TaskData value, $Res Function(_TaskData) _then) =
      __$TaskDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String title,
      String description,
      String category,
      String priority,
      UserData userId,
      String status,
      DateTime dueDate,
      List<SubtaskData> subtasks,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $UserDataCopyWith<$Res> get userId;
}

/// @nodoc
class __$TaskDataCopyWithImpl<$Res> implements _$TaskDataCopyWith<$Res> {
  __$TaskDataCopyWithImpl(this._self, this._then);

  final _TaskData _self;
  final $Res Function(_TaskData) _then;

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? userId = null,
    Object? status = null,
    Object? dueDate = null,
    Object? subtasks = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_TaskData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserData,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _self._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskData>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get userId {
    return $UserDataCopyWith<$Res>(_self.userId, (value) {
      return _then(_self.copyWith(userId: value));
    });
  }
}

/// @nodoc
mixin _$SubtaskData {
  @JsonKey(name: '_id')
  String get id;
  String get title;
  bool get isCompleted;

  /// Create a copy of SubtaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubtaskDataCopyWith<SubtaskData> get copyWith =>
      _$SubtaskDataCopyWithImpl<SubtaskData>(this as SubtaskData, _$identity);

  /// Serializes this SubtaskData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubtaskData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isCompleted);

  @override
  String toString() {
    return 'SubtaskData(id: $id, title: $title, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class $SubtaskDataCopyWith<$Res> {
  factory $SubtaskDataCopyWith(
          SubtaskData value, $Res Function(SubtaskData) _then) =
      _$SubtaskDataCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String title, bool isCompleted});
}

/// @nodoc
class _$SubtaskDataCopyWithImpl<$Res> implements $SubtaskDataCopyWith<$Res> {
  _$SubtaskDataCopyWithImpl(this._self, this._then);

  final SubtaskData _self;
  final $Res Function(SubtaskData) _then;

  /// Create a copy of SubtaskData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubtaskData implements SubtaskData {
  const _SubtaskData(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required this.isCompleted});
  factory _SubtaskData.fromJson(Map<String, dynamic> json) =>
      _$SubtaskDataFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  @override
  final bool isCompleted;

  /// Create a copy of SubtaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubtaskDataCopyWith<_SubtaskData> get copyWith =>
      __$SubtaskDataCopyWithImpl<_SubtaskData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubtaskDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubtaskData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isCompleted);

  @override
  String toString() {
    return 'SubtaskData(id: $id, title: $title, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class _$SubtaskDataCopyWith<$Res>
    implements $SubtaskDataCopyWith<$Res> {
  factory _$SubtaskDataCopyWith(
          _SubtaskData value, $Res Function(_SubtaskData) _then) =
      __$SubtaskDataCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String title, bool isCompleted});
}

/// @nodoc
class __$SubtaskDataCopyWithImpl<$Res> implements _$SubtaskDataCopyWith<$Res> {
  __$SubtaskDataCopyWithImpl(this._self, this._then);

  final _SubtaskData _self;
  final $Res Function(_SubtaskData) _then;

  /// Create a copy of SubtaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
  }) {
    return _then(_SubtaskData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$TaskDataLst {
  List<TaskData> get tasks;

  /// Create a copy of TaskDataLst
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskDataLstCopyWith<TaskDataLst> get copyWith =>
      _$TaskDataLstCopyWithImpl<TaskDataLst>(this as TaskDataLst, _$identity);

  /// Serializes this TaskDataLst to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskDataLst &&
            const DeepCollectionEquality().equals(other.tasks, tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tasks));

  @override
  String toString() {
    return 'TaskDataLst(tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class $TaskDataLstCopyWith<$Res> {
  factory $TaskDataLstCopyWith(
          TaskDataLst value, $Res Function(TaskDataLst) _then) =
      _$TaskDataLstCopyWithImpl;
  @useResult
  $Res call({List<TaskData> tasks});
}

/// @nodoc
class _$TaskDataLstCopyWithImpl<$Res> implements $TaskDataLstCopyWith<$Res> {
  _$TaskDataLstCopyWithImpl(this._self, this._then);

  final TaskDataLst _self;
  final $Res Function(TaskDataLst) _then;

  /// Create a copy of TaskDataLst
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_self.copyWith(
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TaskDataLst implements TaskDataLst {
  const _TaskDataLst({required final List<TaskData> tasks}) : _tasks = tasks;
  factory _TaskDataLst.fromJson(Map<String, dynamic> json) =>
      _$TaskDataLstFromJson(json);

  final List<TaskData> _tasks;
  @override
  List<TaskData> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  /// Create a copy of TaskDataLst
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskDataLstCopyWith<_TaskDataLst> get copyWith =>
      __$TaskDataLstCopyWithImpl<_TaskDataLst>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskDataLstToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskDataLst &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @override
  String toString() {
    return 'TaskDataLst(tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class _$TaskDataLstCopyWith<$Res>
    implements $TaskDataLstCopyWith<$Res> {
  factory _$TaskDataLstCopyWith(
          _TaskDataLst value, $Res Function(_TaskDataLst) _then) =
      __$TaskDataLstCopyWithImpl;
  @override
  @useResult
  $Res call({List<TaskData> tasks});
}

/// @nodoc
class __$TaskDataLstCopyWithImpl<$Res> implements _$TaskDataLstCopyWith<$Res> {
  __$TaskDataLstCopyWithImpl(this._self, this._then);

  final _TaskDataLst _self;
  final $Res Function(_TaskDataLst) _then;

  /// Create a copy of TaskDataLst
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_TaskDataLst(
      tasks: null == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskData>,
    ));
  }
}

// dart format on
