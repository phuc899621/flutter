import 'package:taskit/features/user/domain/entity/user_entity.dart';

abstract interface class IUserRepo {
  //region WATCH
  Stream<UserEntity> watchUser();

  //endregion
  //region READ
  Future<int> getUserLocalId();

  Future<UserEntity> getUser();
//endregion
}
