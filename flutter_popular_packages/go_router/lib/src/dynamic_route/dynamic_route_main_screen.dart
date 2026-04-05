import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DynamicRouteMainScreen extends StatefulWidget {
  const DynamicRouteMainScreen({super.key});

  @override
  State<DynamicRouteMainScreen> createState() => _DynamicRouteMainScreenState();
}

class _DynamicRouteMainScreenState extends State<DynamicRouteMainScreen> {
  late final ValueNotifier<RoutingConfig> _routerConfig;

  @override
  void initState() {
    super.initState();
    _routerConfig = ValueNotifier<RoutingConfig>(_guestConfig);
  }

  ///================== CONFIGURATION 2 (USER) WORLD ==================
  RoutingConfig get _userConfig => RoutingConfig(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => _DashboardScreen(
          onLogout: () {
            _routerConfig.value = _guestConfig;
          },
        ),
        routes: [
          GoRoute(
            path: 'profile',
            builder: (context, state) => const _ProfileScreen(),
          ),
        ],
      ),
    ],
  );

  ///================== CONFIGURATION 1 (GUEST) WORLD ==================
  RoutingConfig get _guestConfig => RoutingConfig(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => _LoginScreen(
          onLogin: () {
            _routerConfig.value = _userConfig;
          },
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.routingConfig(routingConfig: _routerConfig);
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class _LoginScreen extends StatelessWidget {
  final VoidCallback onLogin;
  const _LoginScreen({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: FilledButton(
          onPressed: onLogin,
          child: const Text('Login & Go to Dashboard'),
        ),
      ),
    );
  }
}

class _DashboardScreen extends StatelessWidget {
  final VoidCallback onLogout;
  const _DashboardScreen({required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: onLogout),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Dashboard!'),
            TextButton(onPressed: () => context.go('/profile'), child: const Text('Go to Profile')),
            const SizedBox(height: 20),

            FilledButton(onPressed: () => context.go('/login'), child: const Text('Go to Login')),
            const Text(
              'Note: If you click the login button, the login page will not be found because it is not in the widget tree. You have to click logout to change the route dynamically.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Page')),
    );
  }
}
