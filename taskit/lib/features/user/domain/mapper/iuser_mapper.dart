import '../../../../shared/data/source/local/drift/database/database.dart';
import '../entity/user_entity.dart';

abstract interface class IUserMapper {
  UserEntity toUserEntity(UserTableData data);

  UserTableData toUserTableData(UserEntity entity);

  UserTableCompanion toUserTableCompanion(UserEntity entity);
}
