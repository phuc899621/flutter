// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCategoryReq {
  String get name;
  int get localId;

  /// Create a copy of AddCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddCategoryReqCopyWith<AddCategoryReq> get copyWith =>
      _$AddCategoryReqCopyWithImpl<AddCategoryReq>(
          this as AddCategoryReq, _$identity);

  /// Serializes this AddCategoryReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddCategoryReq &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.localId, localId) || other.localId == localId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, localId);

  @override
  String toString() {
    return 'AddCategoryReq(name: $name, localId: $localId)';
  }
}

/// @nodoc
abstract mixin class $AddCategoryReqCopyWith<$Res> {
  factory $AddCategoryReqCopyWith(
          AddCategoryReq value, $Res Function(AddCategoryReq) _then) =
      _$AddCategoryReqCopyWithImpl;
  @useResult
  $Res call({String name, int localId});
}

/// @nodoc
class _$AddCategoryReqCopyWithImpl<$Res>
    implements $AddCategoryReqCopyWith<$Res> {
  _$AddCategoryReqCopyWithImpl(this._self, this._then);

  final AddCategoryReq _self;
  final $Res Function(AddCategoryReq) _then;

  /// Create a copy of AddCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? localId = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
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
class _AddCategoryReq implements AddCategoryReq {
  const _AddCategoryReq({required this.name, required this.localId});
  factory _AddCategoryReq.fromJson(Map<String, dynamic> json) =>
      _$AddCategoryReqFromJson(json);

  @override
  final String name;
  @override
  final int localId;

  /// Create a copy of AddCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddCategoryReqCopyWith<_AddCategoryReq> get copyWith =>
      __$AddCategoryReqCopyWithImpl<_AddCategoryReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddCategoryReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCategoryReq &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.localId, localId) || other.localId == localId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, localId);

  @override
  String toString() {
    return 'AddCategoryReq(name: $name, localId: $localId)';
  }
}

/// @nodoc
abstract mixin class _$AddCategoryReqCopyWith<$Res>
    implements $AddCategoryReqCopyWith<$Res> {
  factory _$AddCategoryReqCopyWith(
          _AddCategoryReq value, $Res Function(_AddCategoryReq) _then) =
      __$AddCategoryReqCopyWithImpl;
  @override
  @useResult
  $Res call({String name, int localId});
}

/// @nodoc
class __$AddCategoryReqCopyWithImpl<$Res>
    implements _$AddCategoryReqCopyWith<$Res> {
  __$AddCategoryReqCopyWithImpl(this._self, this._then);

  final _AddCategoryReq _self;
  final $Res Function(_AddCategoryReq) _then;

  /// Create a copy of AddCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? localId = null,
  }) {
    return _then(_AddCategoryReq(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
