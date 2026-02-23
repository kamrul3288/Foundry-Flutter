import 'package:clean_architecture_bloc/src/data/di/data_di_module.dart';
import 'package:clean_architecture_bloc/src/secure_storage/di/secure_storage_di_module.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> registerAppDiModule() async {
  //Registering SecureStorageDiModule
  await registerSecureStorageDiModule(locator);

  //Registering DataSourcesDiModule
  await registerDataDiModule(locator);
}
