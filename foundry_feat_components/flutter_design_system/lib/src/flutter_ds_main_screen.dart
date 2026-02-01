import 'package:flutter/material.dart';

class FlutterDsMainScreen extends StatelessWidget {
  const FlutterDsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design System',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Design System'),
        ),
        body: _DesignSystemBody(),
      ),
    );
  }
}

class _DesignSystemBody extends StatelessWidget {
  const _DesignSystemBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _ActionButton(
          title: 'Buttons',
          onTap: () {},
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
