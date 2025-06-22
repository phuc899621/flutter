import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int localId,
    required String remoteId,
    required String name,
    required String email,
    required String avatar,
  }) = _UserEntity;
}
