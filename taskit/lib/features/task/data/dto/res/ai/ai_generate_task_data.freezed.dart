// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_generate_task_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiGenerateTaskData {
  String get title;
  String get description;
  DateTime? get userUtcDueDate;
  bool get hasTime;
  String get categoryId;
  String get priority;
  String get status;

  /// Create a copy of AiGenerateTaskData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiGenerateTaskDataCopyWith<AiGenerateTaskData> get copyWith =>
      _$AiGenerateTaskDataCopyWithImpl<AiGenerateTaskData>(
          this as AiGenerateTaskData, _$identity);

  /// Serializes this AiGenerateTaskData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiGenerateTaskData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userUtcDueDate, userUtcDueDate) ||
                other.userUtcDueDate == userUtcDueDate) &&
            (identical(other.hasTime, hasTime) || other.hasTime == hasTime) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      userUtcDueDate, hasTime, categoryId, priority, status);

  @override
  String toString() {
    return 'AiGenerateTaskData(title: $title, description: $description, userUtcDueDate: $userUtcDueDate, hasTime: $hasTime, categoryId: $categoryId, priority: $priority, status: $status)';
  }
}

/// @nodoc
abstract mixin class $AiGenerateTaskDataCopyWith<$Res> {
  factory $AiGenerateTaskDataCopyWith(
          AiGenerateTaskData value, $Res Function(AiGenerateTaskData) _then) =
      _$AiGenerateTaskDataCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime? userUtcDueDate,
      bool hasTime,
      String categoryId,
      String priority,
      String status});
}

/// @nodoc
class _$AiGenerateTaskDataCopyWithImpl<$Res>
    implements $AiGenerateTaskDataCopyWith<$Res> {
  _$AiGenerateTaskDataCopyWithImpl(this._self, this._then);

  final AiGenerateTaskData _self;
  final $Res Function(AiGenerateTaskData) _then;

  /// Create a copy of AiGenerateTaskData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? userUtcDueDate = freezed,
    Object? hasTime = null,
    Object? categoryId = null,
    Object? priority = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userUtcDueDate: freezed == userUtcDueDate
          ? _self.userUtcDueDate
          : userUtcDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTime: null == hasTime
          ? _self.hasTime
          : hasTime // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AiGenerateTaskData implements AiGenerateTaskData {
  const _AiGenerateTaskData(
      {required this.title,
      required this.description,
      this.userUtcDueDate,
      required this.hasTime,
      required this.categoryId,
      required this.priority,
      required this.status});
  factory _AiGenerateTaskData.fromJson(Map<String, dynamic> json) =>
      _$AiGenerateTaskDataFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime? userUtcDueDate;
  @override
  final bool hasTime;
  @override
  final String categoryId;
  @override
  final String priority;
  @override
  final String status;

  /// Create a copy of AiGenerateTaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiGenerateTaskDataCopyWith<_AiGenerateTaskData> get copyWith =>
      __$AiGenerateTaskDataCopyWithImpl<_AiGenerateTaskData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AiGenerateTaskDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiGenerateTaskData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userUtcDueDate, userUtcDueDate) ||
                other.userUtcDueDate == userUtcDueDate) &&
            (identical(other.hasTime, hasTime) || other.hasTime == hasTime) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      userUtcDueDate, hasTime, categoryId, priority, status);

  @override
  String toString() {
    return 'AiGenerateTaskData(title: $title, description: $description, userUtcDueDate: $userUtcDueDate, hasTime: $hasTime, categoryId: $categoryId, priority: $priority, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$AiGenerateTaskDataCopyWith<$Res>
    implements $AiGenerateTaskDataCopyWith<$Res> {
  factory _$AiGenerateTaskDataCopyWith(
          _AiGenerateTaskData value, $Res Function(_AiGenerateTaskData) _then) =
      __$AiGenerateTaskDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      DateTime? userUtcDueDate,
      bool hasTime,
      String categoryId,
      String priority,
      String status});
}

/// @nodoc
class __$AiGenerateTaskDataCopyWithImpl<$Res>
    implements _$AiGenerateTaskDataCopyWith<$Res> {
  __$AiGenerateTaskDataCopyWithImpl(this._self, this._then);

  final _AiGenerateTaskData _self;
  final $Res Function(_AiGenerateTaskData) _then;

  /// Create a copy of AiGenerateTaskData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? userUtcDueDate = freezed,
    Object? hasTime = null,
    Object? categoryId = null,
    Object? priority = null,
    Object? status = null,
  }) {
    return _then(_AiGenerateTaskData(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      userUtcDueDate: freezed == userUtcDueDate
          ? _self.userUtcDueDate
          : userUtcDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTime: null == hasTime
          ? _self.hasTime
          : hasTime // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
