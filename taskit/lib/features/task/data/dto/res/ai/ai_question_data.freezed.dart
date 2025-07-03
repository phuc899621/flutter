// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_question_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiQuestionData {
  String get answer;

  /// Create a copy of AiQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiQuestionDataCopyWith<AiQuestionData> get copyWith =>
      _$AiQuestionDataCopyWithImpl<AiQuestionData>(
          this as AiQuestionData, _$identity);

  /// Serializes this AiQuestionData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiQuestionData &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, answer);

  @override
  String toString() {
    return 'AiQuestionData(answer: $answer)';
  }
}

/// @nodoc
abstract mixin class $AiQuestionDataCopyWith<$Res> {
  factory $AiQuestionDataCopyWith(
          AiQuestionData value, $Res Function(AiQuestionData) _then) =
      _$AiQuestionDataCopyWithImpl;
  @useResult
  $Res call({String answer});
}

/// @nodoc
class _$AiQuestionDataCopyWithImpl<$Res>
    implements $AiQuestionDataCopyWith<$Res> {
  _$AiQuestionDataCopyWithImpl(this._self, this._then);

  final AiQuestionData _self;
  final $Res Function(AiQuestionData) _then;

  /// Create a copy of AiQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
  }) {
    return _then(_self.copyWith(
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AiQuestionData implements AiQuestionData {
  const _AiQuestionData({required this.answer});
  factory _AiQuestionData.fromJson(Map<String, dynamic> json) =>
      _$AiQuestionDataFromJson(json);

  @override
  final String answer;

  /// Create a copy of AiQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiQuestionDataCopyWith<_AiQuestionData> get copyWith =>
      __$AiQuestionDataCopyWithImpl<_AiQuestionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AiQuestionDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiQuestionData &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, answer);

  @override
  String toString() {
    return 'AiQuestionData(answer: $answer)';
  }
}

/// @nodoc
abstract mixin class _$AiQuestionDataCopyWith<$Res>
    implements $AiQuestionDataCopyWith<$Res> {
  factory _$AiQuestionDataCopyWith(
          _AiQuestionData value, $Res Function(_AiQuestionData) _then) =
      __$AiQuestionDataCopyWithImpl;
  @override
  @useResult
  $Res call({String answer});
}

/// @nodoc
class __$AiQuestionDataCopyWithImpl<$Res>
    implements _$AiQuestionDataCopyWith<$Res> {
  __$AiQuestionDataCopyWithImpl(this._self, this._then);

  final _AiQuestionData _self;
  final $Res Function(_AiQuestionData) _then;

  /// Create a copy of AiQuestionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? answer = null,
  }) {
    return _then(_AiQuestionData(
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
