import '../../di/app_di_module.dart';
import '../../domain/usecase/login_usecase.dart';
import 'bloc/login_cubit.dart';
import 'login_screen.dart';
import '../../router/app_route_name.dart';
import '../../router/base_router.dart';
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
