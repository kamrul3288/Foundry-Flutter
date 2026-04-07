import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/app_named_route.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Verify Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => context.pushReplacementNamed(AppNamedRoute.signUp),
              style: FilledButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Verify OTP'),
            ),
          ),
        ),
      ),
    );
  }
}
