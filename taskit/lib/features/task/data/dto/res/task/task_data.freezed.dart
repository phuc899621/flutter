// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskData _$TaskDataFromJson(Map<String, dynamic> json) {
  return _TaskData.fromJson(json);
}

/// @nodoc
mixin _$TaskData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  UserData get userId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  List<SubtaskData> get subtasks => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TaskData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskDataCopyWith<TaskData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDataCopyWith<$Res> {
  factory $TaskDataCopyWith(TaskData value, $Res Function(TaskData) then) =
      _$TaskDataCopyWithImpl<$Res, TaskData>;
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
class _$TaskDataCopyWithImpl<$Res, $Val extends TaskData>
    implements $TaskDataCopyWith<$Res> {
  _$TaskDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserData,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _value.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskData>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get userId {
    return $UserDataCopyWith<$Res>(_value.userId, (value) {
      return _then(_value.copyWith(userId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskDataImplCopyWith<$Res>
    implements $TaskDataCopyWith<$Res> {
  factory _$$TaskDataImplCopyWith(
          _$TaskDataImpl value, $Res Function(_$TaskDataImpl) then) =
      __$$TaskDataImplCopyWithImpl<$Res>;
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
class __$$TaskDataImplCopyWithImpl<$Res>
    extends _$TaskDataCopyWithImpl<$Res, _$TaskDataImpl>
    implements _$$TaskDataImplCopyWith<$Res> {
  __$$TaskDataImplCopyWithImpl(
      _$TaskDataImpl _value, $Res Function(_$TaskDataImpl) _then)
      : super(_value, _then);

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
    return _then(_$TaskDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserData,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtasks: null == subtasks
          ? _value._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubtaskData>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskDataImpl implements _TaskData {
  const _$TaskDataImpl(
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

  factory _$TaskDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskDataImplFromJson(json);

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

  @override
  String toString() {
    return 'TaskData(id: $id, title: $title, description: $description, category: $category, priority: $priority, userId: $userId, status: $status, dueDate: $dueDate, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDataImpl &&
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

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDataImplCopyWith<_$TaskDataImpl> get copyWith =>
      __$$TaskDataImplCopyWithImpl<_$TaskDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskDataImplToJson(
      this,
    );
  }
}

abstract class _TaskData implements TaskData {
  const factory _TaskData(
      {@JsonKey(name: '_id') required final String id,
      required final String title,
      required final String description,
      required final String category,
      required final String priority,
      required final UserData userId,
      required final String status,
      required final DateTime dueDate,
      required final List<SubtaskData> subtasks,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$TaskDataImpl;

  factory _TaskData.fromJson(Map<String, dynamic> json) =
      _$TaskDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  String get priority;
  @override
  UserData get userId;
  @override
  String get status;
  @override
  DateTime get dueDate;
  @override
  List<SubtaskData> get subtasks;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of TaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDataImplCopyWith<_$TaskDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubtaskData _$SubtaskDataFromJson(Map<String, dynamic> json) {
  return _SubtaskData.fromJson(json);
}

/// @nodoc
mixin _$SubtaskData {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this SubtaskData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubtaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtaskDataCopyWith<SubtaskData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtaskDataCopyWith<$Res> {
  factory $SubtaskDataCopyWith(
          SubtaskData value, $Res Function(SubtaskData) then) =
      _$SubtaskDataCopyWithImpl<$Res, SubtaskData>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String title, bool isCompleted});
}

/// @nodoc
class _$SubtaskDataCopyWithImpl<$Res, $Val extends SubtaskData>
    implements $SubtaskDataCopyWith<$Res> {
  _$SubtaskDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubtaskData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubtaskDataImplCopyWith<$Res>
    implements $SubtaskDataCopyWith<$Res> {
  factory _$$SubtaskDataImplCopyWith(
          _$SubtaskDataImpl value, $Res Function(_$SubtaskDataImpl) then) =
      __$$SubtaskDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String title, bool isCompleted});
}

/// @nodoc
class __$$SubtaskDataImplCopyWithImpl<$Res>
    extends _$SubtaskDataCopyWithImpl<$Res, _$SubtaskDataImpl>
    implements _$$SubtaskDataImplCopyWith<$Res> {
  __$$SubtaskDataImplCopyWithImpl(
      _$SubtaskDataImpl _value, $Res Function(_$SubtaskDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubtaskData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
  }) {
    return _then(_$SubtaskDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtaskDataImpl implements _SubtaskData {
  const _$SubtaskDataImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required this.isCompleted});

  factory _$SubtaskDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtaskDataImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'SubtaskData(id: $id, title: $title, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtaskDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isCompleted);

  /// Create a copy of SubtaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtaskDataImplCopyWith<_$SubtaskDataImpl> get copyWith =>
      __$$SubtaskDataImplCopyWithImpl<_$SubtaskDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtaskDataImplToJson(
      this,
    );
  }
}

abstract class _SubtaskData implements SubtaskData {
  const factory _SubtaskData(
      {@JsonKey(name: '_id') required final String id,
      required final String title,
      required final bool isCompleted}) = _$SubtaskDataImpl;

  factory _SubtaskData.fromJson(Map<String, dynamic> json) =
      _$SubtaskDataImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get title;
  @override
  bool get isCompleted;

  /// Create a copy of SubtaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtaskDataImplCopyWith<_$SubtaskDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskDataLst _$TaskDataLstFromJson(Map<String, dynamic> json) {
  return _TaskDataLst.fromJson(json);
}

/// @nodoc
mixin _$TaskDataLst {
  List<TaskData> get tasks => throw _privateConstructorUsedError;

  /// Serializes this TaskDataLst to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskDataLst
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskDataLstCopyWith<TaskDataLst> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDataLstCopyWith<$Res> {
  factory $TaskDataLstCopyWith(
          TaskDataLst value, $Res Function(TaskDataLst) then) =
      _$TaskDataLstCopyWithImpl<$Res, TaskDataLst>;
  @useResult
  $Res call({List<TaskData> tasks});
}

/// @nodoc
class _$TaskDataLstCopyWithImpl<$Res, $Val extends TaskDataLst>
    implements $TaskDataLstCopyWith<$Res> {
  _$TaskDataLstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskDataLst
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskDataLstImplCopyWith<$Res>
    implements $TaskDataLstCopyWith<$Res> {
  factory _$$TaskDataLstImplCopyWith(
          _$TaskDataLstImpl value, $Res Function(_$TaskDataLstImpl) then) =
      __$$TaskDataLstImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TaskData> tasks});
}

/// @nodoc
class __$$TaskDataLstImplCopyWithImpl<$Res>
    extends _$TaskDataLstCopyWithImpl<$Res, _$TaskDataLstImpl>
    implements _$$TaskDataLstImplCopyWith<$Res> {
  __$$TaskDataLstImplCopyWithImpl(
      _$TaskDataLstImpl _value, $Res Function(_$TaskDataLstImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskDataLst
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$TaskDataLstImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskDataLstImpl implements _TaskDataLst {
  const _$TaskDataLstImpl({required final List<TaskData> tasks})
      : _tasks = tasks;

  factory _$TaskDataLstImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskDataLstImplFromJson(json);

  final List<TaskData> _tasks;
  @override
  List<TaskData> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskDataLst(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDataLstImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskDataLst
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDataLstImplCopyWith<_$TaskDataLstImpl> get copyWith =>
      __$$TaskDataLstImplCopyWithImpl<_$TaskDataLstImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskDataLstImplToJson(
      this,
    );
  }
}

abstract class _TaskDataLst implements TaskDataLst {
  const factory _TaskDataLst({required final List<TaskData> tasks}) =
      _$TaskDataLstImpl;

  factory _TaskDataLst.fromJson(Map<String, dynamic> json) =
      _$TaskDataLstImpl.fromJson;

  @override
  List<TaskData> get tasks;

  /// Create a copy of TaskDataLst
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDataLstImplCopyWith<_$TaskDataLstImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
