import 'package:flutter/material.dart';
import '../../../../foundry_packages/getit/lib/src/async_object_registration/async_object_registration_screen.dart';
import '../../../../foundry_packages/getit/lib/src/multiple_registration/multiple_registration_screen.dart';
import '../../../../foundry_packages/getit/lib/src/object_registration/object_registration_screen.dart';
import '../../../../foundry_packages/getit/lib/src/scoping/scopeing_screen.dart';

class GetitMainScreen extends StatelessWidget {
  const GetitMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: ListView(
            children: [
              _ActionButton(
                title: "Object Registration",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ObjectRegistrationScreen())),
              ),
              _ActionButton(
                title: "Async Object Registration",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AsyncObjectRegistrationScreen())),
              ),
              _ActionButton(
                title: "Multiple Object Registration",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MultipleRegistrationScreen())),
              ),
              _ActionButton(
                title: "Scoping",
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScopingScreen())),
              ),
            ],
          ),
        ),
      ),
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
