import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/app_named_route.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => context.goNamed(AppNamedRoute.bikeService),
              child: const Text('Rebook bike - remove history in stack'),
            ),
            TextButton(
              onPressed: () => context.pushNamed(AppNamedRoute.carService),
              child: const Text('Rebook car - keep history in stack'),
            ),
          ],
        ),
      ),
    );
  }
}
