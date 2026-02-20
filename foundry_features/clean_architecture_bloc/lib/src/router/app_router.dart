import 'package:clean_architecture_bloc/src/features/login/login_screen.dart';
import 'package:clean_architecture_bloc/src/features/posts/posts_screen.dart';
import 'package:clean_architecture_bloc/src/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/posts',
      builder: (context, state) => const PostsScreen(),
    ),
  ],
);
