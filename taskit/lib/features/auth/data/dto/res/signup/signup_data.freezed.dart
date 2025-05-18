// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignupData {
  String get email;

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignupDataCopyWith<SignupData> get copyWith =>
      _$SignupDataCopyWithImpl<SignupData>(this as SignupData, _$identity);

  /// Serializes this SignupData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignupData &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'SignupData(email: $email)';
  }
}

/// @nodoc
abstract mixin class $SignupDataCopyWith<$Res> {
  factory $SignupDataCopyWith(
          SignupData value, $Res Function(SignupData) _then) =
      _$SignupDataCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$SignupDataCopyWithImpl<$Res> implements $SignupDataCopyWith<$Res> {
  _$SignupDataCopyWithImpl(this._self, this._then);

  final SignupData _self;
  final $Res Function(SignupData) _then;

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SignupData implements SignupData {
  const _SignupData({required this.email});
  factory _SignupData.fromJson(Map<String, dynamic> json) =>
      _$SignupDataFromJson(json);

  @override
  final String email;

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignupDataCopyWith<_SignupData> get copyWith =>
      __$SignupDataCopyWithImpl<_SignupData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignupDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupData &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'SignupData(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$SignupDataCopyWith<$Res>
    implements $SignupDataCopyWith<$Res> {
  factory _$SignupDataCopyWith(
          _SignupData value, $Res Function(_SignupData) _then) =
      __$SignupDataCopyWithImpl;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$SignupDataCopyWithImpl<$Res> implements _$SignupDataCopyWith<$Res> {
  __$SignupDataCopyWithImpl(this._self, this._then);

  final _SignupData _self;
  final $Res Function(_SignupData) _then;

  /// Create a copy of SignupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_SignupData(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
