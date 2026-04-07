import 'package:pkg_auto_router/src/auth/auth_cubit.dart';
import 'package:pkg_auto_router/src/auth/auth_redirect_guard.dart';
import 'package:pkg_auto_router/src/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AutoRouterEntryScreen extends StatelessWidget {
  const AutoRouterEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>AuthCubit())
      ],
      child: _App(),
    );
  }
}

class _App extends StatefulWidget {
  const _App();
  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {

  late AppRouter appRouter;

  @override
  void initState() {
    super.initState();
    final authCubit = context.read<AuthCubit>();
    appRouter = AppRouter(AuthGuard(authCubit));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'My Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
