import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkg_go_router/src/async_redirection/async_auth.dart';
import 'package:pkg_go_router/src/async_redirection/async_auth_notifier.dart';

///======================== AUTH STATE FOR TRACKING REDIRECT========================
final authRepositoryProvider = Provider.autoDispose<AsyncAuth>((ref) {
  final auth = AsyncAuth();
  ref.onDispose(() => auth.dispose());
  return auth;
});

/// ======================== ROUTER CONFIGURATION ========================
final _routerProvider = Provider<GoRouter>((ref) {
  final authService = ref.watch(authRepositoryProvider);
  return GoRouter(
    refreshListenable: AsyncAuthNotifier(authService),
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
    redirect: (context, state) async {
      final bool loggedIn = await authService.isLoggedIn();
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

class AsyncRedirectionMainScreen extends ConsumerWidget {
  const AsyncRedirectionMainScreen({super.key});

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
        title: const Text('Async Redirection (Home)'),
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
            const Icon(Icons.verified_user, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Async Authentication Success!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'This example simulates an asynchronous authentication check (e.g., calling an API or checking local storage).',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => ref.read(authRepositoryProvider).logout(),
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

class _LoginScreen extends ConsumerStatefulWidget {
  const _LoginScreen();
  @override
  ConsumerState<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<_LoginScreen> {
  bool loggingIn = false;

  void login() {
    setState(() => loggingIn = true);
    ref.read(authRepositoryProvider).login("Kamrul");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Login'),
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
            const Icon(Icons.sync_lock, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'Async Auth Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Logging in will trigger an asynchronous state change that GoRouter will listen to via refreshListenable.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 48),
            if (loggingIn)
              const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Authenticating...', style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              )
            else
              FilledButton.icon(
                onPressed: login,
                icon: const Icon(Icons.login),
                label: const Text('Login Asynchronously'),
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
