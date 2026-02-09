import 'package:flutter/material.dart';
import 'package:go_router_x/src/basic_flat_route/flat_route_main_screen.dart';

class GoRouterMainScreen extends StatelessWidget {
  const GoRouterMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Router',
      home: Scaffold(
        appBar: AppBar(title: const Text('Go Router')),
        body: _App(),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _ActionButton(
          title: 'Basic Flat Route',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FlatRouteMainScreen())),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Text(title, style: TextStyle(color: Colors.blue)),
      onTap: onTap,
    );
  }
}
