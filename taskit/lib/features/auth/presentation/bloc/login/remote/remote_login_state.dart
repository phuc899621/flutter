import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/user.dart';

class RemoteLoginState extends Equatable{
  final UserEntity? user;
  final DioException? dioException;
  const RemoteLoginState({this.user,this.dioException});
  @override
  List<Object?> get props => [user!,dioException!];
}

//State loading
class RemoteLoginLoading extends RemoteLoginState{
}
// 🟢 Trạng thái ban đầu
class RemoteLoginInitial extends RemoteLoginState {
}
//State success
class RemoteLoginSuccess extends RemoteLoginState{
  const RemoteLoginSuccess(UserEntity user):super(user: user);
}
//State error
class RemoteLoginError extends RemoteLoginState{
  const RemoteLoginError(DioException dioException):super(dioException: dioException);
}