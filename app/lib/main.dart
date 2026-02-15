import 'package:flutter/material.dart';
import 'package:go_router_navigation/go_router_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GoRouterNavigationApp();
  }
}
