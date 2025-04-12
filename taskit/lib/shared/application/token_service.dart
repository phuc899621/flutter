
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/application/itoken_service.dart';

import '../data/repository/itoken_repository.dart';
import '../data/repository/token_repository.dart';

final tokenServiceProvider=Provider<ITokenService>((ref){
  return TokenService(ref.read(tokenRepositoryProvider));
});


class TokenService implements ITokenService{
  final ITokenRepository _tokenRepository;
  TokenService(this._tokenRepository);
  @override
  Future<void> deleteToken() =>_tokenRepository.deleteToken();
  @override
  Future<String?> getToken() =>_tokenRepository.getToken();

  @override
  Future<void> saveToken(String token) =>_tokenRepository.saveToken(token);

}