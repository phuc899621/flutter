// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgotPassData _$ForgotPassDataFromJson(Map<String, dynamic> json) {
  return _ForgotPassVerifyData.fromJson(json);
}

/// @nodoc
mixin _$ForgotPassData {
  String get resetToken => throw _privateConstructorUsedError;

  /// Serializes this ForgotPassData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPassData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPassDataCopyWith<ForgotPassData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPassDataCopyWith<$Res> {
  factory $ForgotPassDataCopyWith(
          ForgotPassData value, $Res Function(ForgotPassData) then) =
      _$ForgotPassDataCopyWithImpl<$Res, ForgotPassData>;
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class _$ForgotPassDataCopyWithImpl<$Res, $Val extends ForgotPassData>
    implements $ForgotPassDataCopyWith<$Res> {
  _$ForgotPassDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPassData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_value.copyWith(
      resetToken: null == resetToken
          ? _value.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPassVerifyDataImplCopyWith<$Res>
    implements $ForgotPassDataCopyWith<$Res> {
  factory _$$ForgotPassVerifyDataImplCopyWith(_$ForgotPassVerifyDataImpl value,
          $Res Function(_$ForgotPassVerifyDataImpl) then) =
      __$$ForgotPassVerifyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class __$$ForgotPassVerifyDataImplCopyWithImpl<$Res>
    extends _$ForgotPassDataCopyWithImpl<$Res, _$ForgotPassVerifyDataImpl>
    implements _$$ForgotPassVerifyDataImplCopyWith<$Res> {
  __$$ForgotPassVerifyDataImplCopyWithImpl(_$ForgotPassVerifyDataImpl _value,
      $Res Function(_$ForgotPassVerifyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPassData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_$ForgotPassVerifyDataImpl(
      resetToken: null == resetToken
          ? _value.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPassVerifyDataImpl implements _ForgotPassVerifyData {
  const _$ForgotPassVerifyDataImpl({required this.resetToken});

  factory _$ForgotPassVerifyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPassVerifyDataImplFromJson(json);

  @override
  final String resetToken;

  @override
  String toString() {
    return 'ForgotPassData(resetToken: $resetToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPassVerifyDataImpl &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, resetToken);

  /// Create a copy of ForgotPassData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPassVerifyDataImplCopyWith<_$ForgotPassVerifyDataImpl>
      get copyWith =>
          __$$ForgotPassVerifyDataImplCopyWithImpl<_$ForgotPassVerifyDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPassVerifyDataImplToJson(
      this,
    );
  }
}

abstract class _ForgotPassVerifyData implements ForgotPassData {
  const factory _ForgotPassVerifyData({required final String resetToken}) =
      _$ForgotPassVerifyDataImpl;

  factory _ForgotPassVerifyData.fromJson(Map<String, dynamic> json) =
      _$ForgotPassVerifyDataImpl.fromJson;

  @override
  String get resetToken;

  /// Create a copy of ForgotPassData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPassVerifyDataImplCopyWith<_$ForgotPassVerifyDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
