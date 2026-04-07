import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///======================== AUTH STATE FOR TRACKING REDIRECT========================
final class AuthState extends Notifier<bool> {
  @override
  bool build() => false;

  void login() {
    state = true;
  }

  void logout() {
    state = false;
  }
}

final authProvider = NotifierProvider<AuthState, bool>(AuthState.new);

/// ======================== ROUTER CONFIGURATION ========================
final _routerProvider = Provider<GoRouter>((ref) {
  final bool loggedIn = ref.watch(authProvider);
  return GoRouter(
    initialLocation: loggedIn ? '/' : '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: "login",
        builder: (context, state) => const _LoginScreen(),
      ),
      GoRoute(
        path: '/',
        name: "home",
        builder: (context, state) => const _HomeScreen(),
      ),
    ],
    redirect: (context, state) {
      // if user is not logged in and not on login screen, redirect to login
      if (!loggedIn && state.matchedLocation != "/login") {
        return "/login";
      }
      // if user is logged in and trying to access login screen, redirect to home
      if (loggedIn && state.matchedLocation == "/login") {
        return "/";
      }
      return null;
    },
  );
});

/// ======================== MAIN SCREEN ========================

class RedirectionMainScreen extends ConsumerWidget {
  const RedirectionMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(_routerProvider);
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

///======================== SCREEN =======================
class _HomeScreen extends ConsumerWidget {
  const _HomeScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redirection (Home)'),
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
            const Icon(Icons.lock_open, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'You are Authenticated!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'GoRouter redirected you here because you are logged in. Try logging out to see redirection in action.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => ref.read(authProvider.notifier).logout(),
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
                foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginScreen extends ConsumerWidget {
  const _LoginScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Required'),
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
            const Icon(Icons.lock, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'Authentication Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'This screen demonstrates GoRouter\'s redirect property. You cannot access the home screen without "logging in" first.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 48),
            FilledButton.icon(
              onPressed: () => ref.read(authProvider.notifier).login(),
              icon: const Icon(Icons.login),
              label: const Text('Login to Continue'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
