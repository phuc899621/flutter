import '../../../../../shared/data/source/local/drift/database/database.dart';

abstract interface class IUserLocalSource {
  //region WATCH
  Stream<UserTableData> watchUser();

  //endregion
  //region READ
  Future<int> getUserLocalId();

  Future<UserTableData?> getUser();
//endregion
}
