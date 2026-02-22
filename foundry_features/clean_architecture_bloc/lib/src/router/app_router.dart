import 'package:clean_architecture_bloc/src/features/login/login_screen.dart';
import 'package:clean_architecture_bloc/src/features/posts/posts_screen.dart';
import 'package:clean_architecture_bloc/src/features/splash/splash_router.dart';
import 'package:clean_architecture_bloc/src/router/app_route_name.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ...SplashRouter().routes(),
    GoRoute(
      path: '/login',
      name: AppRouteName.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/posts',
      name: AppRouteName.posts,
      builder: (context, state) => const PostsScreen(),
    ),
  ],
);
