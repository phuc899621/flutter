import '../../../../../shared/data/source/local/drift/database/database.dart';

abstract interface class IUserLocalSource {
  //region WATCH
  Stream<UserTableData> watchUserByLocalId(int localId);

  //endregion
  //region READ
  Future<int> getUserLocalId();

  Future<UserTableData?> getUserByLocalId(int localId);

  Future<UserTableData?> getUser();
  //endregion
}
