import 'package:clean_architecture_bloc/src/features/login/login_screen.dart';
import 'package:clean_architecture_bloc/src/router/app_route_name.dart';
import 'package:clean_architecture_bloc/src/router/base_router.dart';
import 'package:go_router/go_router.dart';

final class LoginRouter implements BaseRouter {
  @override
  List<RouteBase> routes({List<RouteBase> children = const []}) {
    return [
      GoRoute(
        path: '/login',
        name: AppRouteName.login,
        builder: (context, state) => const LoginScreen(),
        routes: children,
      ),
    ];
  }
}
