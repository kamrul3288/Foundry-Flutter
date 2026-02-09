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
              onPressed: () => context.goNamed("ProfileScreen", pathParameters: {"id": "2"}),
              child: Text('View Profile by Named Route'),
            ),
            TextButton(
              onPressed: () => context.go("/profile/2"),
              child: Text('View Profile by URI'),
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
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: Text('Profile ID: $profileId'),
      ),
    );
  }
}
