import 'package:drift/drift.dart';

import '../../../../shared/data/source/local/drift/database/database.dart';
import '../../domain/entity/user_entity.dart';

extension UserEntityMapper on UserEntity {
  UserTableData toTableData() => UserTableData(
    remoteId: remoteId,
    localId: localId,
    name: name,
    email: email,
    avatar: avatar,
  );

  UserTableCompanion toTableCompanion() => UserTableCompanion(
    remoteId: Value(remoteId),
    localId: Value(localId),
    name: Value(name),
    email: Value(email),
    avatar: Value(avatar),
  );
}
