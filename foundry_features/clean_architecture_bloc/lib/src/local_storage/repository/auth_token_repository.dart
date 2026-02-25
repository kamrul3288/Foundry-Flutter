import 'package:clean_architecture_bloc/src/local_storage/service/secure_storage_service.dart';

abstract class AuthTokenRepository {
  Future<void> saveToken({required String accessToken, required String refreshToken});
  Future<String?> get accessToken;
  Future<String?> get refreshToken;
  Future<bool> isUserAuthorized();
  Future<void> deleteAll();
}

final class AuthTokenRepositoryImpl implements AuthTokenRepository {
  final SecureStorageService _service;
  const AuthTokenRepositoryImpl(this._service);

  @override
  Future<void> saveToken({required String accessToken, required String refreshToken}) async {
    await _service.write('access_token', accessToken);
    await _service.write('refresh_token', refreshToken);
  }

  @override
  Future<String?> get accessToken => _service.read('access_token');

  @override
  Future<String?> get refreshToken => _service.read('refresh_token');

  @override
  Future<bool> isUserAuthorized() async {
    return (await accessToken != null) && (await refreshToken != null);
  }

  @override
  Future<void> deleteAll() async {
    return await _service.deleteAll();
  }
}
