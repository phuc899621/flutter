// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginData {
  String get token;
  SettingData get settings;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginDataCopyWith<LoginData> get copyWith =>
      _$LoginDataCopyWithImpl<LoginData>(this as LoginData, _$identity);

  /// Serializes this LoginData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginData &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, settings);

  @override
  String toString() {
    return 'LoginData(token: $token, settings: $settings)';
  }
}

/// @nodoc
abstract mixin class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) _then) =
      _$LoginDataCopyWithImpl;
  @useResult
  $Res call({String token, SettingData settings});

  $SettingDataCopyWith<$Res> get settings;
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res> implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._self, this._then);

  final LoginData _self;
  final $Res Function(LoginData) _then;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? settings = null,
  }) {
    return _then(_self.copyWith(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingData,
    ));
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingDataCopyWith<$Res> get settings {
    return $SettingDataCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LoginData implements LoginData {
  const _LoginData({required this.token, required this.settings});
  factory _LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  @override
  final String token;
  @override
  final SettingData settings;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginDataCopyWith<_LoginData> get copyWith =>
      __$LoginDataCopyWithImpl<_LoginData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginData &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, settings);

  @override
  String toString() {
    return 'LoginData(token: $token, settings: $settings)';
  }
}

/// @nodoc
abstract mixin class _$LoginDataCopyWith<$Res>
    implements $LoginDataCopyWith<$Res> {
  factory _$LoginDataCopyWith(
          _LoginData value, $Res Function(_LoginData) _then) =
      __$LoginDataCopyWithImpl;
  @override
  @useResult
  $Res call({String token, SettingData settings});

  @override
  $SettingDataCopyWith<$Res> get settings;
}

/// @nodoc
class __$LoginDataCopyWithImpl<$Res> implements _$LoginDataCopyWith<$Res> {
  __$LoginDataCopyWithImpl(this._self, this._then);

  final _LoginData _self;
  final $Res Function(_LoginData) _then;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? settings = null,
  }) {
    return _then(_LoginData(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingData,
    ));
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SettingDataCopyWith<$Res> get settings {
    return $SettingDataCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

// dart format on
