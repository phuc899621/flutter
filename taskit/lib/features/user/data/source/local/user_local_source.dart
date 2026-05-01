import 'package:taskit/features/auth/data/dto/res/user/user_data.dart';
import 'package:taskit/features/user/domain/entity/user_entity.dart';

abstract interface class UserLocalSource {
  Stream<UserEntity> watchUserByLocalId(int localId);

  Future<UserEntity?> getUserByLocalId(int localId);

  Future<int> cacheUser(UserData data);

  Future<UserEntity?> getPreviousUser();

  Future<void> deleteLocalUser(int localId);
}
