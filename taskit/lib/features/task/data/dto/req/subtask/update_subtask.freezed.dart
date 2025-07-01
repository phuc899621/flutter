// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_subtask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UpdateSubtaskReq _$UpdateSubtaskReqFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'all':
      return _UpdateSubtaskAllReq.fromJson(json);
    case 'statusOnly':
      return _UpdateSubtaskStatusReq.fromJson(json);
    case 'titleOnly':
      return _UpdateSubtaskTitleReq.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UpdateSubtaskReq',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UpdateSubtaskReq {
  String get id;
  int get localId;

  /// Create a copy of UpdateSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateSubtaskReqCopyWith<UpdateSubtaskReq> get copyWith =>
      _$UpdateSubtaskReqCopyWithImpl<UpdateSubtaskReq>(
          this as UpdateSubtaskReq, _$identity);

  /// Serializes this UpdateSubtaskReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateSubtaskReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, localId);

  @override
  String toString() {
    return 'UpdateSubtaskReq(id: $id, localId: $localId)';
  }
}

/// @nodoc
abstract mixin class $UpdateSubtaskReqCopyWith<$Res> {
  factory $UpdateSubtaskReqCopyWith(
          UpdateSubtaskReq value, $Res Function(UpdateSubtaskReq) _then) =
      _$UpdateSubtaskReqCopyWithImpl;
  @useResult
  $Res call({String id, int localId});
}

/// @nodoc
class _$UpdateSubtaskReqCopyWithImpl<$Res>
    implements $UpdateSubtaskReqCopyWith<$Res> {
  _$UpdateSubtaskReqCopyWithImpl(this._self, this._then);

  final UpdateSubtaskReq _self;
  final $Res Function(UpdateSubtaskReq) _then;

  /// Create a copy of UpdateSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? localId = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateSubtaskAllReq implements UpdateSubtaskReq {
  const _UpdateSubtaskAllReq(
      {required this.id,
      required this.isCompleted,
      required this.localId,
      required this.title,
      final String? $type})
      : $type = $type ?? 'all';
  factory _UpdateSubtaskAllReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubtaskAllReqFromJson(json);

  @override
  final String id;
  final bool isCompleted;
  @override
  final int localId;
  final String title;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateSubtaskAllReqCopyWith<_UpdateSubtaskAllReq> get copyWith =>
      __$UpdateSubtaskAllReqCopyWithImpl<_UpdateSubtaskAllReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateSubtaskAllReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateSubtaskAllReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, isCompleted, localId, title);

  @override
  String toString() {
    return 'UpdateSubtaskReq.all(id: $id, isCompleted: $isCompleted, localId: $localId, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$UpdateSubtaskAllReqCopyWith<$Res>
    implements $UpdateSubtaskReqCopyWith<$Res> {
  factory _$UpdateSubtaskAllReqCopyWith(_UpdateSubtaskAllReq value,
          $Res Function(_UpdateSubtaskAllReq) _then) =
      __$UpdateSubtaskAllReqCopyWithImpl;
  @override
  @useResult
  $Res call({String id, bool isCompleted, int localId, String title});
}

/// @nodoc
class __$UpdateSubtaskAllReqCopyWithImpl<$Res>
    implements _$UpdateSubtaskAllReqCopyWith<$Res> {
  __$UpdateSubtaskAllReqCopyWithImpl(this._self, this._then);

  final _UpdateSubtaskAllReq _self;
  final $Res Function(_UpdateSubtaskAllReq) _then;

  /// Create a copy of UpdateSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isCompleted = null,
    Object? localId = null,
    Object? title = null,
  }) {
    return _then(_UpdateSubtaskAllReq(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateSubtaskStatusReq implements UpdateSubtaskReq {
  const _UpdateSubtaskStatusReq(
      {required this.id,
      required this.isCompleted,
      required this.localId,
      final String? $type})
      : $type = $type ?? 'statusOnly';
  factory _UpdateSubtaskStatusReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubtaskStatusReqFromJson(json);

  @override
  final String id;
  final bool isCompleted;
  @override
  final int localId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateSubtaskStatusReqCopyWith<_UpdateSubtaskStatusReq> get copyWith =>
      __$UpdateSubtaskStatusReqCopyWithImpl<_UpdateSubtaskStatusReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateSubtaskStatusReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateSubtaskStatusReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.localId, localId) || other.localId == localId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, isCompleted, localId);

  @override
  String toString() {
    return 'UpdateSubtaskReq.statusOnly(id: $id, isCompleted: $isCompleted, localId: $localId)';
  }
}

/// @nodoc
abstract mixin class _$UpdateSubtaskStatusReqCopyWith<$Res>
    implements $UpdateSubtaskReqCopyWith<$Res> {
  factory _$UpdateSubtaskStatusReqCopyWith(_UpdateSubtaskStatusReq value,
          $Res Function(_UpdateSubtaskStatusReq) _then) =
      __$UpdateSubtaskStatusReqCopyWithImpl;
  @override
  @useResult
  $Res call({String id, bool isCompleted, int localId});
}

/// @nodoc
class __$UpdateSubtaskStatusReqCopyWithImpl<$Res>
    implements _$UpdateSubtaskStatusReqCopyWith<$Res> {
  __$UpdateSubtaskStatusReqCopyWithImpl(this._self, this._then);

  final _UpdateSubtaskStatusReq _self;
  final $Res Function(_UpdateSubtaskStatusReq) _then;

  /// Create a copy of UpdateSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isCompleted = null,
    Object? localId = null,
  }) {
    return _then(_UpdateSubtaskStatusReq(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateSubtaskTitleReq implements UpdateSubtaskReq {
  const _UpdateSubtaskTitleReq(
      {required this.id,
      required this.localId,
      required this.title,
      final String? $type})
      : $type = $type ?? 'titleOnly';
  factory _UpdateSubtaskTitleReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubtaskTitleReqFromJson(json);

  @override
  final String id;
  @override
  final int localId;
  final String title;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UpdateSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateSubtaskTitleReqCopyWith<_UpdateSubtaskTitleReq> get copyWith =>
      __$UpdateSubtaskTitleReqCopyWithImpl<_UpdateSubtaskTitleReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateSubtaskTitleReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateSubtaskTitleReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, localId, title);

  @override
  String toString() {
    return 'UpdateSubtaskReq.titleOnly(id: $id, localId: $localId, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$UpdateSubtaskTitleReqCopyWith<$Res>
    implements $UpdateSubtaskReqCopyWith<$Res> {
  factory _$UpdateSubtaskTitleReqCopyWith(_UpdateSubtaskTitleReq value,
          $Res Function(_UpdateSubtaskTitleReq) _then) =
      __$UpdateSubtaskTitleReqCopyWithImpl;
  @override
  @useResult
  $Res call({String id, int localId, String title});
}

/// @nodoc
class __$UpdateSubtaskTitleReqCopyWithImpl<$Res>
    implements _$UpdateSubtaskTitleReqCopyWith<$Res> {
  __$UpdateSubtaskTitleReqCopyWithImpl(this._self, this._then);

  final _UpdateSubtaskTitleReq _self;
  final $Res Function(_UpdateSubtaskTitleReq) _then;

  /// Create a copy of UpdateSubtaskReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? localId = null,
    Object? title = null,
  }) {
    return _then(_UpdateSubtaskTitleReq(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
