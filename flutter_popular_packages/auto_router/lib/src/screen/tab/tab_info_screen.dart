import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TabInfoScreen extends StatelessWidget {
  const TabInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab Info"),
      ),
      body: const Center(
        child: Text(
          "This is Tab Info Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
