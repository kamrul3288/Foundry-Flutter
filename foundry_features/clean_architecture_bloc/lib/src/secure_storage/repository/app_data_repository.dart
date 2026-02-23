import 'package:clean_architecture_bloc/src/secure_storage/service/secure_storage_service.dart';

abstract class AppDataRepository {
  Future<void> saveLanguageCode(String code);
  Future<String?> getLanguageCode();
}

final class AppDataRepositoryImpl implements AppDataRepository {
  final SecureStorageService _service;
  const AppDataRepositoryImpl(this._service);

  @override
  Future<void> saveLanguageCode(String code) async => await _service.write('language_code', code);

  @override
  Future<String?> getLanguageCode() async => await _service.read('language_code');
}
