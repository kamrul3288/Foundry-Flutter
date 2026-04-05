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
  return GoRouter(
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
      final bool loggedIn = ref.watch(authProvider);
      // if user is not logged in and trying to access login screen, redirect to login
      if (!loggedIn) {
        return "/login";
      }
      // if user is logged in and trying to access login screen, redirect to home
      if (loggedIn && state.fullPath == "/login") {
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
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: TextButton(
          onPressed: () => ref.read(authProvider.notifier).logout(),
          child: const Text('Logout'),
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
      body: Center(
        child: TextButton(
          onPressed: () => ref.read(authProvider.notifier).login(),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
