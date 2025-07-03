// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiState {
  bool get isLoading;
  List<Message> get message;
  bool? get isReceiveAiMessage;

  /// Create a copy of AiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AiStateCopyWith<AiState> get copyWith =>
      _$AiStateCopyWithImpl<AiState>(this as AiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AiState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            (identical(other.isReceiveAiMessage, isReceiveAiMessage) ||
                other.isReceiveAiMessage == isReceiveAiMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(message), isReceiveAiMessage);

  @override
  String toString() {
    return 'AiState(isLoading: $isLoading, message: $message, isReceiveAiMessage: $isReceiveAiMessage)';
  }
}

/// @nodoc
abstract mixin class $AiStateCopyWith<$Res> {
  factory $AiStateCopyWith(AiState value, $Res Function(AiState) _then) =
      _$AiStateCopyWithImpl;
  @useResult
  $Res call({bool isLoading, List<Message> message, bool? isReceiveAiMessage});
}

/// @nodoc
class _$AiStateCopyWithImpl<$Res> implements $AiStateCopyWith<$Res> {
  _$AiStateCopyWithImpl(this._self, this._then);

  final AiState _self;
  final $Res Function(AiState) _then;

  /// Create a copy of AiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? message = null,
    Object? isReceiveAiMessage = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isReceiveAiMessage: freezed == isReceiveAiMessage
          ? _self.isReceiveAiMessage
          : isReceiveAiMessage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _AiState implements AiState {
  const _AiState(
      {this.isLoading = false,
      final List<Message> message = const [],
      this.isReceiveAiMessage})
      : _message = message;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Message> _message;
  @override
  @JsonKey()
  List<Message> get message {
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_message);
  }

  @override
  final bool? isReceiveAiMessage;

  /// Create a copy of AiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiStateCopyWith<_AiState> get copyWith =>
      __$AiStateCopyWithImpl<_AiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._message, _message) &&
            (identical(other.isReceiveAiMessage, isReceiveAiMessage) ||
                other.isReceiveAiMessage == isReceiveAiMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_message), isReceiveAiMessage);

  @override
  String toString() {
    return 'AiState(isLoading: $isLoading, message: $message, isReceiveAiMessage: $isReceiveAiMessage)';
  }
}

/// @nodoc
abstract mixin class _$AiStateCopyWith<$Res> implements $AiStateCopyWith<$Res> {
  factory _$AiStateCopyWith(_AiState value, $Res Function(_AiState) _then) =
      __$AiStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isLoading, List<Message> message, bool? isReceiveAiMessage});
}

/// @nodoc
class __$AiStateCopyWithImpl<$Res> implements _$AiStateCopyWith<$Res> {
  __$AiStateCopyWithImpl(this._self, this._then);

  final _AiState _self;
  final $Res Function(_AiState) _then;

  /// Create a copy of AiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = null,
    Object? message = null,
    Object? isReceiveAiMessage = freezed,
  }) {
    return _then(_AiState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isReceiveAiMessage: freezed == isReceiveAiMessage
          ? _self.isReceiveAiMessage
          : isReceiveAiMessage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
