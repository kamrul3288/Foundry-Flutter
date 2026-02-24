import 'package:clean_architecture_bloc/src/domain/repository/auth_repository.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/login_usecase.dart';
import 'package:get_it/get_it.dart';

Future<void> registerDomainDiModule(GetIt locator) async {
  ///Registering LoginUseCase & providing LoginUseCase
  locator.registerFactory<LoginUseCase>(() => LoginUseCase(locator<AuthRepository>()));
}
