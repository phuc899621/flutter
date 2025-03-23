import '../../../../core/resources/data_state.dart';
import '../entities/user.dart';

abstract class AuthRepository{
  Future<DataState<UserEntity>> login(String email, String password);
}