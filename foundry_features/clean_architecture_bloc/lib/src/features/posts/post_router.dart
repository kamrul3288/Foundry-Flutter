import 'package:clean_architecture_bloc/src/features/posts/posts_screen.dart';
import 'package:clean_architecture_bloc/src/router/app_route_name.dart';
import 'package:clean_architecture_bloc/src/router/base_router.dart';
import 'package:go_router/go_router.dart';

final class PostRouter implements BaseRouter {
  @override
  List<RouteBase> routes({List<RouteBase> children = const []}) {
    return [
      GoRoute(
        path: '/posts',
        name: AppRouteName.posts,
        builder: (context, state) => const PostsScreen(),
        routes: children,
      ),
    ];
  }
}
