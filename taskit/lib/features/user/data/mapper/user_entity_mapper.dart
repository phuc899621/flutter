import 'package:drift/drift.dart';

import '../../../../shared/data/source/local/drift/database/database.dart';
import '../../domain/entity/user_entity.dart';

extension UserEntityMapper on UserEntity {
  UserTableData toData() => UserTableData(
    remoteId: remoteId,
    localId: localId,
    name: name,
    email: email,
    avatar: avatar,
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
  );

  UserTableCompanion toCompanion() => UserTableCompanion(
    remoteId: Value(remoteId),
    localId: Value(localId),
    name: Value(name),
    email: Value(email),
    avatar: Value(avatar),
  );
}
