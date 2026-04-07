import 'package:clean_architecture_bloc/src/local_storage/preferences/app_preferences_storage.dart';
import 'package:clean_architecture_bloc/src/local_storage/service/secure_storage_service.dart';

const String _languageCodeKey = 'language_code';

final class AppPreferencesStorageImpl implements AppPreferencesStorage {
  final SecureStorageService _service;
  const AppPreferencesStorageImpl(this._service);

  @override
  Future<void> saveLanguageCode(String code) async => await _service.write(_languageCodeKey, code);

  @override
  Future<String?> getLanguageCode() async => await _service.read(_languageCodeKey);
}
