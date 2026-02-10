import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_x/src/async_redirection/async_redirection_main_screen.dart';
import 'package:go_router_x/src/basic_flat_route/flat_route_main_screen.dart';
import 'package:go_router_x/src/basic_nested_route/nested_route_main_screen.dart';
import 'package:go_router_x/src/named_route/named_route_main_screen.dart';
import 'package:go_router_x/src/onexit/on_exit_main_screen.dart';
import 'package:go_router_x/src/path_query_params/path_query_params_main_screen.dart';
import 'package:go_router_x/src/redirection/redirection_main_screen.dart';
import 'package:go_router_x/src/shell_route/shell_route_main_screen.dart';

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
        _ActionButton(
          title: 'Basic Nested Route',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NestedRouteMainScreen())),
        ),
        _ActionButton(
          title: 'Named Route',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NamedRouteMainScreen())),
        ),
        _ActionButton(
          title: 'Path and Query Parameter',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PathQueryParamsMainScreen())),
        ),
        _ActionButton(
          title: 'Redirection',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderScope(child: RedirectionMainScreen()))),
        ),
        _ActionButton(
          title: 'Async Redirection',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderScope(child: AsyncRedirectionMainScreen()))),
        ),
        _ActionButton(
          title: 'On Exit',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderScope(child: OnExitMainScreen()))),
        ),
        _ActionButton(
          title: 'Shell Route',
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderScope(child: ShellRouteMainScreen()))),
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
