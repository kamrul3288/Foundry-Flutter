import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NestedNav1Screen extends StatelessWidget {
  const NestedNav1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nested Nav 1 Screen"),
      ),
      body: const Center(
        child: Text("Nested Nav 1 Screen"),
      ),
    );
  }
}
