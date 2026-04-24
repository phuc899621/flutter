import 'package:taskit/features/user/domain/entity/user_entity.dart';

abstract interface class IUserService {
  Stream<UserEntity> watchUserByLocalId(int localId);

  Future<int> getUserLocalId();

  Future<UserEntity> getUser();
}
