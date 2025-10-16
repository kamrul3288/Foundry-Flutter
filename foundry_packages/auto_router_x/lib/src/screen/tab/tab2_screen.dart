import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tab 2 Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
