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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
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
      appBar: AppBar(
        title: const Text('Dynamic Route Login'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_outline, size: 80, color: Colors.indigo),
              const SizedBox(height: 24),
              const Text(
                'Guest Access',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'This screen is part of the "Guest" routing configuration. Log in to switch to the "User" configuration dynamically.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: onLogin,
                icon: const Icon(Icons.login),
                label: const Text('Login & Update Config'),
              ),
            ],
          ),
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
        title: const Text('User Dashboard'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: onLogout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.dashboard_customize,
                  size: 80, color: Colors.indigo),
              const SizedBox(height: 24),
              const Text(
                'Welcome to your Dashboard!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'You are now in the "User" routing configuration. The Login route is no longer available in the current routing tree.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: () => context.go('/profile'),
                    icon: const Icon(Icons.person),
                    label: const Text('Go to Profile'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => context.go('/login'),
                    icon: const Icon(Icons.error_outline),
                    label: const Text('Try Login Route'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Card(
                color: Colors.amber.shade50,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.amber),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Note: If you click "Try Login Route", it will fail or show an error because it is not in the current configuration. Use Logout to switch back.',
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 24),
            const Text(
              'User Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('This route exists only in the "User" configuration.'),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
