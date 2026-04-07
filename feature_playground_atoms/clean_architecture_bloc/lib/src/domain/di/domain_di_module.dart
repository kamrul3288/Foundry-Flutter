import '../repository/auth_repository.dart';
import '../repository/post_repository.dart';
import '../usecase/get_posts_usecase.dart';
import '../usecase/get_profile_usecase.dart';
import '../usecase/login_usecase.dart';
import '../../local_storage/auth/auth_token_storage.dart';
import 'package:get_it/get_it.dart';

Future<void> registerDomainDiModule(GetIt locator) async {
  ///Registering LoginUseCase & providing LoginUseCase
  locator.registerFactory<LoginUseCase>(() => LoginUseCase(locator<AuthRepository>(), locator<AuthTokenStorage>()));

  ///Registering GetProfileUseCase & providing GetProfileUseCase
  locator.registerFactory<GetProfileUseCase>(() => GetProfileUseCase(locator<AuthRepository>()));

  ///Registering GetPostsUseCase & providing GetPostsUseCase
  locator.registerFactory<GetPostsUseCase>(() => GetPostsUseCase(locator<PostRepository>()));
}
