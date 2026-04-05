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
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => context.goNamed(
                "ProfileScreen",
                pathParameters: {"id": "2"},
                queryParameters: {"token": "123"},
              ),
              child: Text('Path and Query Parameter with goNamed'),
            ),
            TextButton(
              onPressed: () => context.go("/profile/2?token=123"),
              child: Text('Path and Query Parameter with go'),
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
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: Text('Profile ID: $profileId, Token: $token'),
      ),
    );
  }
}
