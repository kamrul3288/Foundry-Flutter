import 'package:flutter/material.dart';

class SecureStorageMainScreen extends StatelessWidget {
  const SecureStorageMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Storage"),
      ),
      body: const Center(
        child: Text('Welcome to Secure Storage!'),
      ),
    );
  }
}
