import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tab 3 Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
