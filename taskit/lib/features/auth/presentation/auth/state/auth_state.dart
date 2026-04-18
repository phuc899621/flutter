import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/constants/auth_status.dart';
import '../../../../user/domain/entity/user_entity.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    UserEntity? user,
  }) = _AuthState;
}
