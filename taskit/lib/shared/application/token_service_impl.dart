import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskit/shared/application/token_service.dart';

import '../data/repository/token_repository.dart';
import '../data/repository/token_repository_impl.dart';

final tokenServiceProvider = Provider<TokenService>((ref) {
  return TokenServiceImpl(ref.read(tokenRepositoryProvider));
});

class TokenServiceImpl implements TokenService {
  final TokenRepository _tokenRepository;

  TokenServiceImpl(this._tokenRepository);

  @override
  Future<int?> getActiveUserId() => _tokenRepository.getActiveUserId();

  @override
  Future<void> deleteActiveUserId() => _tokenRepository.deleteActiveUserId();

  @override
  Future<void> saveActiveUserId(int id) =>
      _tokenRepository.saveActiveUserId(id);

  @override
  Future<void> deleteTokens() => _tokenRepository.deleteTokens();

  @override
  Future<String?> getAccessToken() => _tokenRepository.getAccessToken();

  @override
  Future<String?> getRefreshToken() => _tokenRepository.getRefreshToken();

  @override
  Future<String?> getSessionId() => _tokenRepository.getSessionId();

  @override
  Future<void> saveTokens(String access, String refresh, String sessionId) =>
      _tokenRepository.saveTokens(access, refresh, sessionId);
}
