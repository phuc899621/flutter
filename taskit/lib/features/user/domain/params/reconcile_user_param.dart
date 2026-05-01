import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';

part 'reconcile_user_param.freezed.dart';

@freezed
abstract class ReconcileUserParam with _$ReconcileUserParam {
  const factory ReconcileUserParam({
    required UserEntity newUser,
    required UserEntity? oldUser,
  }) = _ReconcileUserParam;
}
