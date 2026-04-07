import 'package:auto_route/auto_route.dart';
import 'package:pkg_auto_router/src/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  var _counter = 0;

  void increment() => setState(()=>_counter++);
  void decrement() => setState(()=>_counter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => context.router.push(TabInfoRoute()),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          FloatingActionButton(
            onPressed: decrement,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: increment,
            child: const Icon(Icons.add),
          ),
        ],
      ),

      body: Center(
        child: Text(
          'Tab 1 Screen: $_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
