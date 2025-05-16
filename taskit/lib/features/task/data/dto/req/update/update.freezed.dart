// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateReq<T> _$UpdateReqFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _UpdateReq<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$UpdateReq<T> {
  T get updateData => throw _privateConstructorUsedError;

  /// Serializes this UpdateReq to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of UpdateReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateReqCopyWith<T, UpdateReq<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateReqCopyWith<T, $Res> {
  factory $UpdateReqCopyWith(
          UpdateReq<T> value, $Res Function(UpdateReq<T>) then) =
      _$UpdateReqCopyWithImpl<T, $Res, UpdateReq<T>>;
  @useResult
  $Res call({T updateData});
}

/// @nodoc
class _$UpdateReqCopyWithImpl<T, $Res, $Val extends UpdateReq<T>>
    implements $UpdateReqCopyWith<T, $Res> {
  _$UpdateReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateData = freezed,
  }) {
    return _then(_value.copyWith(
      updateData: freezed == updateData
          ? _value.updateData
          : updateData // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateReqImplCopyWith<T, $Res>
    implements $UpdateReqCopyWith<T, $Res> {
  factory _$$UpdateReqImplCopyWith(
          _$UpdateReqImpl<T> value, $Res Function(_$UpdateReqImpl<T>) then) =
      __$$UpdateReqImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T updateData});
}

/// @nodoc
class __$$UpdateReqImplCopyWithImpl<T, $Res>
    extends _$UpdateReqCopyWithImpl<T, $Res, _$UpdateReqImpl<T>>
    implements _$$UpdateReqImplCopyWith<T, $Res> {
  __$$UpdateReqImplCopyWithImpl(
      _$UpdateReqImpl<T> _value, $Res Function(_$UpdateReqImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UpdateReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateData = freezed,
  }) {
    return _then(_$UpdateReqImpl<T>(
      updateData: freezed == updateData
          ? _value.updateData
          : updateData // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$UpdateReqImpl<T> implements _UpdateReq<T> {
  const _$UpdateReqImpl({required this.updateData});

  factory _$UpdateReqImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$UpdateReqImplFromJson(json, fromJsonT);

  @override
  final T updateData;

  @override
  String toString() {
    return 'UpdateReq<$T>(updateData: $updateData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateReqImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.updateData, updateData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(updateData));

  /// Create a copy of UpdateReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateReqImplCopyWith<T, _$UpdateReqImpl<T>> get copyWith =>
      __$$UpdateReqImplCopyWithImpl<T, _$UpdateReqImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$UpdateReqImplToJson<T>(this, toJsonT);
  }
}

abstract class _UpdateReq<T> implements UpdateReq<T> {
  const factory _UpdateReq({required final T updateData}) = _$UpdateReqImpl<T>;

  factory _UpdateReq.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$UpdateReqImpl<T>.fromJson;

  @override
  T get updateData;

  /// Create a copy of UpdateReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateReqImplCopyWith<T, _$UpdateReqImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
