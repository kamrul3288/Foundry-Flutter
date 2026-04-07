import '../../di/app_di_module.dart';
import '../../domain/usecase/get_profile_usecase.dart';
import 'bloc/splash_cubit.dart';
import 'splash_screen.dart';
import '../../local_storage/auth/auth_token_storage.dart';
import '../../router/app_route_name.dart';
import '../../router/base_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class SplashRouter implements BaseRouter {
  @override
  List<RouteBase> routes({List<RouteBase> children = const []}) {
    return [
      GoRoute(
        path: '/',
        name: AppRouteName.splash,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit(
            locator.get<AuthTokenStorage>(),
            locator.get<GetProfileUseCase>(),
          ),
          child: const SplashScreen(),
        ),
        routes: children,
      ),
    ];
  }
}
