// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggest_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuggestCategoryReq {
  String get title;

  /// Create a copy of SuggestCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuggestCategoryReqCopyWith<SuggestCategoryReq> get copyWith =>
      _$SuggestCategoryReqCopyWithImpl<SuggestCategoryReq>(
          this as SuggestCategoryReq, _$identity);

  /// Serializes this SuggestCategoryReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuggestCategoryReq &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString() {
    return 'SuggestCategoryReq(title: $title)';
  }
}

/// @nodoc
abstract mixin class $SuggestCategoryReqCopyWith<$Res> {
  factory $SuggestCategoryReqCopyWith(
          SuggestCategoryReq value, $Res Function(SuggestCategoryReq) _then) =
      _$SuggestCategoryReqCopyWithImpl;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$SuggestCategoryReqCopyWithImpl<$Res>
    implements $SuggestCategoryReqCopyWith<$Res> {
  _$SuggestCategoryReqCopyWithImpl(this._self, this._then);

  final SuggestCategoryReq _self;
  final $Res Function(SuggestCategoryReq) _then;

  /// Create a copy of SuggestCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SuggestCategoryReq implements SuggestCategoryReq {
  const _SuggestCategoryReq({required this.title});
  factory _SuggestCategoryReq.fromJson(Map<String, dynamic> json) =>
      _$SuggestCategoryReqFromJson(json);

  @override
  final String title;

  /// Create a copy of SuggestCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuggestCategoryReqCopyWith<_SuggestCategoryReq> get copyWith =>
      __$SuggestCategoryReqCopyWithImpl<_SuggestCategoryReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuggestCategoryReqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuggestCategoryReq &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @override
  String toString() {
    return 'SuggestCategoryReq(title: $title)';
  }
}

/// @nodoc
abstract mixin class _$SuggestCategoryReqCopyWith<$Res>
    implements $SuggestCategoryReqCopyWith<$Res> {
  factory _$SuggestCategoryReqCopyWith(
          _SuggestCategoryReq value, $Res Function(_SuggestCategoryReq) _then) =
      __$SuggestCategoryReqCopyWithImpl;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$SuggestCategoryReqCopyWithImpl<$Res>
    implements _$SuggestCategoryReqCopyWith<$Res> {
  __$SuggestCategoryReqCopyWithImpl(this._self, this._then);

  final _SuggestCategoryReq _self;
  final $Res Function(_SuggestCategoryReq) _then;

  /// Create a copy of SuggestCategoryReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
  }) {
    return _then(_SuggestCategoryReq(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
