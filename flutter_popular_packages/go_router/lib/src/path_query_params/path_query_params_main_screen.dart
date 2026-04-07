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
            final token = state.uri.queryParameters['token'];
            return _ProfileScreen(profileId: profileId, token: token);
          },
        ),
      ],
    ),
  ],
);

///======================= Main Screen =======================
class PathQueryParamsMainScreen extends StatelessWidget {
  const PathQueryParamsMainScreen({super.key});

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
        title: const Text('Path & Query Params'),
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
            const Icon(Icons.link, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'This example demonstrates how to pass parameters through both the URL path and as query parameters.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.goNamed(
                "ProfileScreen",
                pathParameters: {"id": "user-789"},
                queryParameters: {"token": "secret-123"},
              ),
              icon: const Icon(Icons.pin_drop),
              label: const Text('View Profile (goNamed)'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => context.go("/profile/user-456?token=public-987"),
              icon: const Icon(Icons.query_stats),
              label: const Text('View Profile (URI with Query)'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  final String profileId;
  final String? token;
  const _ProfileScreen({required this.profileId, this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Params'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 0,
                color: Colors.indigo.withAlpha(13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.indigo.withAlpha(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      _ParamRow(label: 'Path Param (ID)', value: profileId),
                      const Divider(height: 32),
                      _ParamRow(label: 'Query Param (Token)', value: token ?? 'None'),
                    ],
                  ),
                ),
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
      ),
    );
  }
}

class _ParamRow extends StatelessWidget {
  const _ParamRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }
}
