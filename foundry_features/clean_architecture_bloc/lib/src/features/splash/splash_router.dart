import 'package:clean_architecture_bloc/src/di/app_di_module.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/get_profile_usecase.dart';
import 'package:clean_architecture_bloc/src/features/splash/bloc/splash_cubit.dart';
import 'package:clean_architecture_bloc/src/features/splash/splash_screen.dart';
import 'package:clean_architecture_bloc/src/router/app_route_name.dart';
import 'package:clean_architecture_bloc/src/router/base_router.dart';
import 'package:clean_architecture_bloc/src/secure_storage/repository/auth_token_repository.dart';
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
            locator.get<AuthTokenRepository>(),
            locator.get<GetProfileUseCase>(),
          ),
          child: const SplashScreen(),
        ),
        routes: children,
      ),
    ];
  }
}
