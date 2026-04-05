import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'async_auth.dart';
import 'async_auth_notifier.dart';

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
      if (!loggedIn) {
        return "/login";
      }
      if (loggedIn && state.fullPath == "/login") {
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
          onPressed: () => ref.read(authRepositoryProvider).logout(),
          child: const Text('Logout'),
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
      body: Center(
        child: loggingIn
            ? const CircularProgressIndicator()
            : TextButton(
                onPressed: login,
                child: const Text('Login'),
              ),
      ),
    );
  }
}
