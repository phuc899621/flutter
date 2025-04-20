// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_verify_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginVerifyData {
  String get name;
  String get gmail;

  /// Create a copy of LoginVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginVerifyDataCopyWith<LoginVerifyData> get copyWith =>
      _$LoginVerifyDataCopyWithImpl<LoginVerifyData>(
          this as LoginVerifyData, _$identity);

  /// Serializes this LoginVerifyData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginVerifyData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gmail, gmail) || other.gmail == gmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, gmail);

  @override
  String toString() {
    return 'LoginVerifyData(name: $name, gmail: $gmail)';
  }
}

/// @nodoc
abstract mixin class $LoginVerifyDataCopyWith<$Res> {
  factory $LoginVerifyDataCopyWith(
          LoginVerifyData value, $Res Function(LoginVerifyData) _then) =
      _$LoginVerifyDataCopyWithImpl;
  @useResult
  $Res call({String name, String gmail});
}

/// @nodoc
class _$LoginVerifyDataCopyWithImpl<$Res>
    implements $LoginVerifyDataCopyWith<$Res> {
  _$LoginVerifyDataCopyWithImpl(this._self, this._then);

  final LoginVerifyData _self;
  final $Res Function(LoginVerifyData) _then;

  /// Create a copy of LoginVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? gmail = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gmail: null == gmail
          ? _self.gmail
          : gmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LoginVerifyData implements LoginVerifyData {
  const _LoginVerifyData({required this.name, required this.gmail});
  factory _LoginVerifyData.fromJson(Map<String, dynamic> json) =>
      _$LoginVerifyDataFromJson(json);

  @override
  final String name;
  @override
  final String gmail;

  /// Create a copy of LoginVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginVerifyDataCopyWith<_LoginVerifyData> get copyWith =>
      __$LoginVerifyDataCopyWithImpl<_LoginVerifyData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginVerifyDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginVerifyData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gmail, gmail) || other.gmail == gmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, gmail);

  @override
  String toString() {
    return 'LoginVerifyData(name: $name, gmail: $gmail)';
  }
}

/// @nodoc
abstract mixin class _$LoginVerifyDataCopyWith<$Res>
    implements $LoginVerifyDataCopyWith<$Res> {
  factory _$LoginVerifyDataCopyWith(
          _LoginVerifyData value, $Res Function(_LoginVerifyData) _then) =
      __$LoginVerifyDataCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String gmail});
}

/// @nodoc
class __$LoginVerifyDataCopyWithImpl<$Res>
    implements _$LoginVerifyDataCopyWith<$Res> {
  __$LoginVerifyDataCopyWithImpl(this._self, this._then);

  final _LoginVerifyData _self;
  final $Res Function(_LoginVerifyData) _then;

  /// Create a copy of LoginVerifyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? gmail = null,
  }) {
    return _then(_LoginVerifyData(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gmail: null == gmail
          ? _self.gmail
          : gmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
