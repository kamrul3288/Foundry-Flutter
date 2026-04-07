import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///======================= Router Config =======================
final _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: "HomeScreen",
      builder: (context, state) => const _HomeScreen(),
      routes: [
        GoRoute(
          path: "profile/:id",
          name: "ProfileScreen",
          builder: (context, state) {
            final profileId = state.pathParameters['id'] ?? "-1";
            return _ProfileScreen(profileId: profileId);
          },
        ),
      ],
    ),
  ],
);

///======================= Main Screen =======================
class NamedRouteMainScreen extends StatelessWidget {
  const NamedRouteMainScreen({super.key});

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
        title: const Text('Named Route'),
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
            const Icon(Icons.label, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'This example shows how to use named routes to navigate, which is often safer than using hardcoded URI strings.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.goNamed("ProfileScreen", pathParameters: {"id": "123"}),
              icon: const Icon(Icons.badge),
              label: const Text('View Profile (Named Route)'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => context.go("/profile/456"),
              icon: const Icon(Icons.link),
              label: const Text('View Profile (URI Path)'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  final String profileId;
  const _ProfileScreen({required this.profileId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.indigo.withAlpha(25),
              child: const Icon(Icons.person, size: 40, color: Colors.indigo),
            ),
            const SizedBox(height: 16),
            const Text(
              'Profile Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Chip(
              label: Text('ID: $profileId'),
              backgroundColor: Colors.indigo.withAlpha(25),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.goNamed("HomeScreen"),
              icon: const Icon(Icons.home),
              label: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
