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
          path: 'payment',
          builder: (context, state) => const _PaymentScreen(),

          ///==================== ON EXIT DIALOG FOR PAYMENT SCREEN ========================
          onExit: (BuildContext context, GoRouterState state) async {
            final bool? confirmed = await showDialog<bool>(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text('Exit Payment?'),
                  content: const Text('Are you sure you want to leave the payment page? Your progress may be lost.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(false),
                      child: const Text('Stay'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.of(dialogContext).pop(true),
                      child: const Text('Leave'),
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
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
      appBar: AppBar(
        title: const Text('On Exit Demo'),
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
            const Icon(Icons.exit_to_app, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'This example demonstrates the onExit callback, which can be used to prevent a user from accidentally leaving a screen.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.go('/payment'),
              icon: const Icon(Icons.payment),
              label: const Text('Go to Payment'),
            ),
          ],
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
      appBar: AppBar(
        title: const Text('Payment Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'Secure Payment Entry',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Try to go back or click the button below. A confirmation dialog will appear thanks to onExit.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 48),
            OutlinedButton.icon(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.home),
              label: const Text('Attempt to go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
