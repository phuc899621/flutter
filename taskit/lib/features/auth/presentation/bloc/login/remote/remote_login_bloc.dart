import 'package:taskit/features/auth/presentation/bloc/login/remote/remote_login_event.dart';
import 'package:taskit/features/auth/presentation/bloc/login/remote/remote_login_state.dart';
import 'package:bloc/bloc.dart';import '../../../../../../core/resources/data_state.dart';


import '../../../../domain/usecases/LoginUseCase.dart';

class RemoteLoginBloc extends Bloc<RemoteLoginEvent,RemoteLoginState>{
  final LoginUseCase _loginUseCase;

  RemoteLoginBloc(this._loginUseCase) : super(RemoteLoginInitial()){
    on<LoginRequest>((onLoginRequest));
  }
  void onLoginRequest(LoginRequest event, Emitter<RemoteLoginState> emit) async{
    final dataState=await _loginUseCase();
    if(dataState is DataSuccess && dataState.data!=null){
      emit(RemoteLoginSuccess(dataState.data!));
    }else{
      emit(RemoteLoginError(dataState.error!));
    }
  }


}