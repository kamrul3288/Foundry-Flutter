import '../../di/app_di_module.dart';
import '../../domain/usecase/get_posts_usecase.dart';
import 'bloc/posts_cubit.dart';
import 'posts_screen.dart';
import '../../router/app_route_name.dart';
import '../../router/base_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class PostRouter implements BaseRouter {
  @override
  List<RouteBase> routes({List<RouteBase> children = const []}) {
    return [
      GoRoute(
        path: '/posts',
        name: AppRouteName.posts,
        builder: (context, state) => BlocProvider(
          create: (context) => PostsCubit(locator.get<GetPostsUseCase>()),
          child: const PostsScreen(),
        ),
        routes: children,
      ),
    ];
  }
}
