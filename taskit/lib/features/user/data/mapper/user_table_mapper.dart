import 'package:taskit/features/user/domain/entity/user_entity.dart';
import 'package:taskit/shared/data/source/local/drift/database/database.dart';

extension UserTableDataMapper on UserTableData {
  UserEntity toEntity() => UserEntity(
    remoteId: remoteId,
    localId: localId,
    name: name,
    email: email,
    avatar: avatar,
  );
}
