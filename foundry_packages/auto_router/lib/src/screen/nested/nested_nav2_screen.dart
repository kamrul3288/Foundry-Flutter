import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NestedNav2Screen extends StatelessWidget {
  const NestedNav2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nested Nav 2 Screen"),
      ),
      body: const Center(
        child: Text("Nested Nav 2 Screen"),
      ),
    );
  }
}
