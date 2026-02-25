import 'package:clean_architecture_bloc/src/local_storage/auth/auth_token_storage.dart';
import 'package:clean_architecture_bloc/src/local_storage/service/secure_storage_service.dart';

const String _accessTokenKey = 'access_token';
const String _refreshTokenKey = 'refresh_token';

final class AuthTokenStorageImpl implements AuthTokenStorage {
  final SecureStorageService _service;
  const AuthTokenStorageImpl(this._service);

  @override
  Future<void> saveToken({required String accessToken, required String refreshToken}) async {
    await _service.write(_accessTokenKey, accessToken);
    await _service.write(_refreshTokenKey, refreshToken);
  }

  @override
  Future<String?> get accessToken => _service.read(_accessTokenKey);

  @override
  Future<String?> get refreshToken => _service.read(_refreshTokenKey);

  @override
  Future<bool> isUserAuthorized() async {
    final accessToken = await this.accessToken;
    final refreshToken = await this.refreshToken;
    return accessToken != null && accessToken.isNotEmpty && refreshToken != null && refreshToken.isNotEmpty;
  }

  @override
  Future<void> deleteAll() async {
    return await _service.deleteAll();
  }
}
