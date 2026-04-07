import 'package:flutter/material.dart';
import 'router/app_router.dart';

class GoRouterNavigationApp extends StatelessWidget {
  const GoRouterNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
