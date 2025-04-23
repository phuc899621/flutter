
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/data/repository/itoken_repository.dart';

import '../source/local/token_source.dart';

final tokenRepositoryProvider=Provider<ITokenRepository>((ref){
  return TokenRepository(ref.read(tokenSourceProvider));
});


class TokenRepository implements ITokenRepository{
  final TokenSource _tokenSource;
  TokenRepository(this._tokenSource);

  @override
  Future<void> deleteToken() =>_tokenSource.deleteToken();

  @override
  Future<String?> getToken() =>_tokenSource.getToken();
  @override
  Future<void> saveToken(String token) =>_tokenSource.saveToken(token);

}