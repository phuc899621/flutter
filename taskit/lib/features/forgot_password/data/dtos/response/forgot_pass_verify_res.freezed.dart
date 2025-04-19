// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_verify_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPassVerifyData {
  String get resetToken;

  /// Create a copy of ForgotPassVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPassVerifyDataCopyWith<ForgotPassVerifyData> get copyWith =>
      _$ForgotPassVerifyDataCopyWithImpl<ForgotPassVerifyData>(
          this as ForgotPassVerifyData, _$identity);

  /// Serializes this ForgotPassVerifyData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPassVerifyData &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, resetToken);

  @override
  String toString() {
    return 'ForgotPassVerifyData(resetToken: $resetToken)';
  }
}

/// @nodoc
abstract mixin class $ForgotPassVerifyDataCopyWith<$Res> {
  factory $ForgotPassVerifyDataCopyWith(ForgotPassVerifyData value,
          $Res Function(ForgotPassVerifyData) _then) =
      _$ForgotPassVerifyDataCopyWithImpl;
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class _$ForgotPassVerifyDataCopyWithImpl<$Res>
    implements $ForgotPassVerifyDataCopyWith<$Res> {
  _$ForgotPassVerifyDataCopyWithImpl(this._self, this._then);

  final ForgotPassVerifyData _self;
  final $Res Function(ForgotPassVerifyData) _then;

  /// Create a copy of ForgotPassVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_self.copyWith(
      resetToken: null == resetToken
          ? _self.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ForgotPassVerifyData implements ForgotPassVerifyData {
  const _ForgotPassVerifyData({required this.resetToken});
  factory _ForgotPassVerifyData.fromJson(Map<String, dynamic> json) =>
      _$ForgotPassVerifyDataFromJson(json);

  @override
  final String resetToken;

  /// Create a copy of ForgotPassVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPassVerifyDataCopyWith<_ForgotPassVerifyData> get copyWith =>
      __$ForgotPassVerifyDataCopyWithImpl<_ForgotPassVerifyData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForgotPassVerifyDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPassVerifyData &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, resetToken);

  @override
  String toString() {
    return 'ForgotPassVerifyData(resetToken: $resetToken)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPassVerifyDataCopyWith<$Res>
    implements $ForgotPassVerifyDataCopyWith<$Res> {
  factory _$ForgotPassVerifyDataCopyWith(_ForgotPassVerifyData value,
          $Res Function(_ForgotPassVerifyData) _then) =
      __$ForgotPassVerifyDataCopyWithImpl;
  @override
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class __$ForgotPassVerifyDataCopyWithImpl<$Res>
    implements _$ForgotPassVerifyDataCopyWith<$Res> {
  __$ForgotPassVerifyDataCopyWithImpl(this._self, this._then);

  final _ForgotPassVerifyData _self;
  final $Res Function(_ForgotPassVerifyData) _then;

  /// Create a copy of ForgotPassVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_ForgotPassVerifyData(
      resetToken: null == resetToken
          ? _self.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
