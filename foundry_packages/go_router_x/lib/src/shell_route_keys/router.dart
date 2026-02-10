part of 'shell_route_keys_main_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const _LoginScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return _BottomNavBar(child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const _HomeScreen(),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
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
