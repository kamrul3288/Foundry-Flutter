import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_navigation/src/router/app_named_route.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => context.goNamed(AppNamedRoute.home),
              style: FilledButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Sign Up'),
            ),
          ),
        ),
      ),
    );
  }
}
