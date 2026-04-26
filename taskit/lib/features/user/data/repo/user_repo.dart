import 'package:taskit/features/user/domain/entity/user_entity.dart';

import '../../../../shared/domain/entities/data_result.dart';

abstract interface class UserRepo {
  Stream<UserEntity> watchUserByLocalId(int localId);

  Future<DataResult<UserEntity>> syncUser();

  Future<UserEntity?> getCurrentUser();
}
