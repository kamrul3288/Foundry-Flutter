import '../features/login/login_router.dart';
import '../features/posts/post_router.dart';
import '../features/splash/splash_router.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ...SplashRouter().routes(),
    ...LoginRouter().routes(),
    ...PostRouter().routes(),
  ],
);
