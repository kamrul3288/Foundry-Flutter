import 'package:clean_architecture_bloc/src/secure_storage/repository/auth_token_repository.dart';
import 'package:clean_architecture_bloc/src/secure_storage/repository/app_data_repository.dart';
import 'package:clean_architecture_bloc/src/secure_storage/service/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

Future<void> registerSecureStorageDiModule(GetIt locator) async {
  //Registering SecureStorageService & providing SecureStorageService
  locator.registerSingleton<SecureStorageService>(SecureStorageService(const FlutterSecureStorage()));

  //Registering AuthTokenRepository & providing AuthTokenRepositoryImpl
  locator.registerSingleton<AuthTokenRepository>(AuthTokenRepositoryImpl(locator<SecureStorageService>()));

  //Registering AppDataRepository & providing AppDataRepositoryImpl
  locator.registerSingleton<AppDataRepository>(AppDataRepositoryImpl(locator<SecureStorageService>()));
}
