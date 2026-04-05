import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///======================= Router Config =======================
final _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const _HomeScreen(),
      routes: [
        GoRoute(
          path: "about",
          builder: (context, state) => const _AboutScreen(),
        ),
      ],
    ),
  ],
);

///======================= Main Screen =======================
class NestedRouteMainScreen extends StatelessWidget {
  const NestedRouteMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

///======================= Screens =======================
class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: TextButton(
          onPressed: () => context.push('/about'),
          child: Text('Go to About'),
        ),
      ),
    );
  }
}

class _AboutScreen extends StatelessWidget {
  const _AboutScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(child: Text("About Screen")),
    );
  }
}
