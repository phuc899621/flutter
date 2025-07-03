// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AiReq _$AiReqFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'generate':
      return _AiReqGenerate.fromJson(json);
    case 'question':
      return _AiReqQuestion.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AiReq',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AiReq {
  String get text;
  String get utcOffset;

  /// Create a copy of AiReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiReqCopyWith<AiReq> get copyWith =>
      _$AiReqCopyWithImpl<AiReq>(this as AiReq, _$identity);

  /// Serializes this AiReq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiReq &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.utcOffset, utcOffset) ||
                other.utcOffset == utcOffset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, utcOffset);

  @override
  String toString() {
    return 'AiReq(text: $text, utcOffset: $utcOffset)';
  }
}

/// @nodoc
abstract mixin class $AiReqCopyWith<$Res> {
  factory $AiReqCopyWith(AiReq value, $Res Function(AiReq) _then) =
      _$AiReqCopyWithImpl;
  @useResult
  $Res call({String text, String utcOffset});
}

/// @nodoc
class _$AiReqCopyWithImpl<$Res> implements $AiReqCopyWith<$Res> {
  _$AiReqCopyWithImpl(this._self, this._then);

  final AiReq _self;
  final $Res Function(AiReq) _then;

  /// Create a copy of AiReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? utcOffset = null,
  }) {
    return _then(_self.copyWith(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      utcOffset: null == utcOffset
          ? _self.utcOffset
          : utcOffset // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AiReqGenerate implements AiReq {
  const _AiReqGenerate(
      {required this.text, required this.utcOffset, final String? $type})
      : $type = $type ?? 'generate';
  factory _AiReqGenerate.fromJson(Map<String, dynamic> json) =>
      _$AiReqGenerateFromJson(json);

  @override
  final String text;
  @override
  final String utcOffset;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of AiReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiReqGenerateCopyWith<_AiReqGenerate> get copyWith =>
      __$AiReqGenerateCopyWithImpl<_AiReqGenerate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AiReqGenerateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiReqGenerate &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.utcOffset, utcOffset) ||
                other.utcOffset == utcOffset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, utcOffset);

  @override
  String toString() {
    return 'AiReq.generate(text: $text, utcOffset: $utcOffset)';
  }
}

/// @nodoc
abstract mixin class _$AiReqGenerateCopyWith<$Res>
    implements $AiReqCopyWith<$Res> {
  factory _$AiReqGenerateCopyWith(
          _AiReqGenerate value, $Res Function(_AiReqGenerate) _then) =
      __$AiReqGenerateCopyWithImpl;
  @override
  @useResult
  $Res call({String text, String utcOffset});
}

/// @nodoc
class __$AiReqGenerateCopyWithImpl<$Res>
    implements _$AiReqGenerateCopyWith<$Res> {
  __$AiReqGenerateCopyWithImpl(this._self, this._then);

  final _AiReqGenerate _self;
  final $Res Function(_AiReqGenerate) _then;

  /// Create a copy of AiReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? utcOffset = null,
  }) {
    return _then(_AiReqGenerate(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      utcOffset: null == utcOffset
          ? _self.utcOffset
          : utcOffset // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AiReqQuestion implements AiReq {
  const _AiReqQuestion(
      {required this.text,
      required this.utcOffset,
      required this.language,
      final String? $type})
      : $type = $type ?? 'question';
  factory _AiReqQuestion.fromJson(Map<String, dynamic> json) =>
      _$AiReqQuestionFromJson(json);

  @override
  final String text;
  @override
  final String utcOffset;
  final String language;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of AiReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiReqQuestionCopyWith<_AiReqQuestion> get copyWith =>
      __$AiReqQuestionCopyWithImpl<_AiReqQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AiReqQuestionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiReqQuestion &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.utcOffset, utcOffset) ||
                other.utcOffset == utcOffset) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, utcOffset, language);

  @override
  String toString() {
    return 'AiReq.question(text: $text, utcOffset: $utcOffset, language: $language)';
  }
}

/// @nodoc
abstract mixin class _$AiReqQuestionCopyWith<$Res>
    implements $AiReqCopyWith<$Res> {
  factory _$AiReqQuestionCopyWith(
          _AiReqQuestion value, $Res Function(_AiReqQuestion) _then) =
      __$AiReqQuestionCopyWithImpl;
  @override
  @useResult
  $Res call({String text, String utcOffset, String language});
}

/// @nodoc
class __$AiReqQuestionCopyWithImpl<$Res>
    implements _$AiReqQuestionCopyWith<$Res> {
  __$AiReqQuestionCopyWithImpl(this._self, this._then);

  final _AiReqQuestion _self;
  final $Res Function(_AiReqQuestion) _then;

  /// Create a copy of AiReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? utcOffset = null,
    Object? language = null,
  }) {
    return _then(_AiReqQuestion(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      utcOffset: null == utcOffset
          ? _self.utcOffset
          : utcOffset // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
