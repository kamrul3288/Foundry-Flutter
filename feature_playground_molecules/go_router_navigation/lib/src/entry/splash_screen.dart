import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/app_named_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
              onPressed: () => context.pushNamed(AppNamedRoute.otpVerify),
              style: FilledButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Login now'),
            ),

            FilledButton(
              onPressed: () => context.goNamed(AppNamedRoute.home),
              style: FilledButton.styleFrom(backgroundColor: Colors.blue.shade400),
              child: const Text('I\'m already authenticated'),
            ),
          ],
        ),
      ),
    );
  }
}
