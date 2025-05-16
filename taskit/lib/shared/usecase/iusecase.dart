
abstract class UseCase<type,param>{
  Future<type> call({param? p});
}