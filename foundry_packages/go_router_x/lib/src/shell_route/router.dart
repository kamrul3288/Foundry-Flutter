part of 'shell_route_main_screen.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const _LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return _BottomNavBar(child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const _HomeScreen(),
          routes: [
            GoRoute(
              path: '/details',
              name: "details",
              builder: (context, state) => const _DetailsScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const _ProfileScreen(),
          routes: [
            GoRoute(
              path: '/profile-update',
              name: "profile-update",
              builder: (context, state) => const _ProfileUpdateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const _SettingsScreen(),
        ),
      ],
    ),
  ],
);
