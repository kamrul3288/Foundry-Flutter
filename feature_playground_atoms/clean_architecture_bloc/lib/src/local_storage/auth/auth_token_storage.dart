abstract class AuthTokenStorage {
  Future<void> saveToken({required String accessToken, required String refreshToken});
  Future<String?> get accessToken;
  Future<String?> get refreshToken;
  Future<bool> isUserAuthorized();
  Future<void> deleteAll();
}
