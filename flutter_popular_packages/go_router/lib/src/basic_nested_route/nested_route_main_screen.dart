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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
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
      appBar: AppBar(
        title: const Text('Basic Nested Route'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.layers, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'Home Screen (Parent)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'This example demonstrates nested routes. The about route is a child of the home route.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.push('/about'),
              icon: const Icon(Icons.info_outline),
              label: const Text('Go to About (Child)'),
            ),
          ],
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
      appBar: AppBar(
        title: const Text('About (Child)'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.info, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'About Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            OutlinedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
