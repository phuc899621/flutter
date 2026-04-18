import 'package:taskit/features/user/domain/entity/user_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

extension UserMapper on UserTableData {
  UserEntity toEntity() => UserEntity(
    localId: localId,
    remoteId: remoteId,
    name: name,
    email: email,
    avatar: avatar,
  );
}
