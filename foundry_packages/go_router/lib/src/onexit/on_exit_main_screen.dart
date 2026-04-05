import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///======================== ROUTER CONFIGURATION ========================
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const _HomeScreen(),
      routes: [
        GoRoute(
          path: '/payment',
          builder: (context, state) => const _PaymentScreen(),

          ///==================== ON EXIT DIALOG FOR PAYMENT SCREEN ========================
          onExit: (BuildContext context, GoRouterState state) async {
            final bool? confirmed = await showDialog<bool>(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  content: const Text('Are you sure to leave this page?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(true),
                      child: const Text('Confirm'),
                    ),
                  ],
                );
              },
            );
            return confirmed ?? false;
          },
        ),
      ],
    ),
  ],
);

///======================== MAIN SCREEN ========================
class OnExitMainScreen extends StatelessWidget {
  const OnExitMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

///======================== HOME SCREEN ========================
class _HomeScreen extends StatelessWidget {
  const _HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: TextButton(
          onPressed: () => context.go('/payment'),
          child: const Text('Go to Payment'),
        ),
      ),
    );
  }
}

class _PaymentScreen extends StatelessWidget {
  const _PaymentScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Center(
        child: TextButton(
          onPressed: () => context.go('/'),
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}
