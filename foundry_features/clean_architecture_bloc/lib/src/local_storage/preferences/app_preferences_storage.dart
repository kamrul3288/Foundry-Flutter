abstract class AppPreferencesStorage {
  Future<void> saveLanguageCode(String code);
  Future<String?> getLanguageCode();
}
