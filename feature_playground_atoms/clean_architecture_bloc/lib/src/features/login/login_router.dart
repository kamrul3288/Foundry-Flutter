import 'package:clean_architecture_bloc/src/di/app_di_module.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/login_usecase.dart';
import 'package:clean_architecture_bloc/src/features/login/bloc/login_cubit.dart';
import 'package:clean_architecture_bloc/src/features/login/login_screen.dart';
import 'package:clean_architecture_bloc/src/router/app_route_name.dart';
import 'package:clean_architecture_bloc/src/router/base_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class LoginRouter implements BaseRouter {
  @override
  List<RouteBase> routes({List<RouteBase> children = const []}) {
    return [
      GoRoute(
        path: '/login',
        name: AppRouteName.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(locator.get<LoginUseCase>()),
          child: const LoginScreen(),
        ),
        routes: children,
      ),
    ];
  }
}
