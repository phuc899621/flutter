import 'package:taskit/features/user/domain/entity/user_entity.dart';

abstract interface class IUserRepo {
  //region WATCH
  Stream<UserEntity> watchUserByLocalId(int localId);

  //endregion
  //region READ
  Future<int> getUserLocalId();

  Future<UserEntity> getUser();
  //endregion
}
