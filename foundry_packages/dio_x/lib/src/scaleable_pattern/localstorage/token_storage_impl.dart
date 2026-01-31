import 'package:dio_x/src/scaleable_pattern/localstorage/token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class TokenStorageImpl implements TokenStorage {
  final FlutterSecureStorage _secureStorage;
  const TokenStorageImpl(this._secureStorage);

  @override
  Future<void> saveToken({required String accessToken, required String refreshToken}) async {
    await _secureStorage.write(key: 'access_token', value: accessToken);
    await _secureStorage.write(key: 'refresh_token', value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() {
    return _secureStorage.read(key: 'access_token');
  }

  @override
  Future<String?> getRefreshToken() {
    return _secureStorage.read(key: 'refresh_token');
  }

  @override
  Future<void> deleteTokens() {
    return _secureStorage.deleteAll();
  }
}
