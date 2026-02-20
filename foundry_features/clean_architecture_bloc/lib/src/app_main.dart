import 'package:clean_architecture_bloc/src/router/app_router.dart';
import 'package:flutter/material.dart';

class CleanArchitectureBlocApp extends StatelessWidget {
  const CleanArchitectureBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Foundry Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
