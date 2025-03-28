import '../../../../core/resources/data_state.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository{
  Future<DataState<UserEntity>> registerUser({
      required String email,
      required String name,
      required String password});

}