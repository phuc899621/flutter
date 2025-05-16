// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggest_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuggestCategoryReq _$SuggestCategoryReqFromJson(Map<String, dynamic> json) {
  return _SuggestCategoryReq.fromJson(json);
}

/// @nodoc
mixin _$SuggestCategoryReq {
  String get title => throw _privateConstructorUsedError;

  /// Serializes this SuggestCategoryReq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuggestCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestCategoryReqCopyWith<SuggestCategoryReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestCategoryReqCopyWith<$Res> {
  factory $SuggestCategoryReqCopyWith(
          SuggestCategoryReq value, $Res Function(SuggestCategoryReq) then) =
      _$SuggestCategoryReqCopyWithImpl<$Res, SuggestCategoryReq>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$SuggestCategoryReqCopyWithImpl<$Res, $Val extends SuggestCategoryReq>
    implements $SuggestCategoryReqCopyWith<$Res> {
  _$SuggestCategoryReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestCategoryReqImplCopyWith<$Res>
    implements $SuggestCategoryReqCopyWith<$Res> {
  factory _$$SuggestCategoryReqImplCopyWith(_$SuggestCategoryReqImpl value,
          $Res Function(_$SuggestCategoryReqImpl) then) =
      __$$SuggestCategoryReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$SuggestCategoryReqImplCopyWithImpl<$Res>
    extends _$SuggestCategoryReqCopyWithImpl<$Res, _$SuggestCategoryReqImpl>
    implements _$$SuggestCategoryReqImplCopyWith<$Res> {
  __$$SuggestCategoryReqImplCopyWithImpl(_$SuggestCategoryReqImpl _value,
      $Res Function(_$SuggestCategoryReqImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuggestCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$SuggestCategoryReqImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestCategoryReqImpl implements _SuggestCategoryReq {
  const _$SuggestCategoryReqImpl({required this.title});

  factory _$SuggestCategoryReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestCategoryReqImplFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'SuggestCategoryReq(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestCategoryReqImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of SuggestCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestCategoryReqImplCopyWith<_$SuggestCategoryReqImpl> get copyWith =>
      __$$SuggestCategoryReqImplCopyWithImpl<_$SuggestCategoryReqImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestCategoryReqImplToJson(
      this,
    );
  }
}

abstract class _SuggestCategoryReq implements SuggestCategoryReq {
  const factory _SuggestCategoryReq({required final String title}) =
      _$SuggestCategoryReqImpl;

  factory _SuggestCategoryReq.fromJson(Map<String, dynamic> json) =
      _$SuggestCategoryReqImpl.fromJson;

  @override
  String get title;

  /// Create a copy of SuggestCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestCategoryReqImplCopyWith<_$SuggestCategoryReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
