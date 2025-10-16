import 'package:auto_route/annotations.dart';
import 'package:auto_router_x/src/model/complex_args.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ComplexArgumentsScreen extends StatelessWidget {
  final ComplexArgs args;
  const ComplexArgumentsScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Arguments'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('ID: ${args.id}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              Text('Name: ${args.name}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 8),
              Text('Tags:', style: TextStyle(fontSize: 20)),
              ...args.tags.map((tag) => Text(tag, style: TextStyle(fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }
}
