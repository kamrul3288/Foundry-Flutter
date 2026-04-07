import 'package:clean_architecture_bloc/src/di/app_di_module.dart';
import 'package:clean_architecture_bloc/src/domain/usecase/get_posts_usecase.dart';
import 'package:clean_architecture_bloc/src/features/posts/bloc/posts_cubit.dart';
import 'package:clean_architecture_bloc/src/features/posts/posts_screen.dart';
import 'package:clean_architecture_bloc/src/router/app_route_name.dart';
import 'package:clean_architecture_bloc/src/router/base_router.dart';
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
