import '../auth/auth_token_storage.dart';
import '../auth/auth_token_storage_impl.dart';
import '../preferences/app_preferences_storage.dart';
import '../preferences/app_preferences_storage_impl.dart';
import '../service/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

Future<void> registerSecureStorageDiModule(GetIt locator) async {
  //Registering FlutterSecureStorage & providing FlutterSecureStorage
  locator.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  //Registering SecureStorageService & providing SecureStorageService
  locator.registerSingleton<SecureStorageService>(SecureStorageService(locator<FlutterSecureStorage>()));

  //Registering AuthTokenStorage & providing AuthTokenStorageImpl
  locator.registerSingleton<AuthTokenStorage>(AuthTokenStorageImpl(locator<SecureStorageService>()));

  //Registering AppPreferencesStorage & providing AppPreferencesStorageImpl
  locator.registerSingleton<AppPreferencesStorage>(AppPreferencesStorageImpl(locator<SecureStorageService>()));
}
