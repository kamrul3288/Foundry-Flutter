import 'package:clean_architecture_bloc/src/data/di/data_di_module.dart';
import 'package:clean_architecture_bloc/src/domain/di/domain_di_module.dart';
import 'package:clean_architecture_bloc/src/local_storage/di/local_storage_di_module.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> registerAppDiModule() async {
  //Registering SecureStorageDiModule
  await registerSecureStorageDiModule(locator);

  //Registering DataSourcesDiModule
  await registerDataDiModule(locator);

  //Registering DomainDiModule
  await registerDomainDiModule(locator);
}
