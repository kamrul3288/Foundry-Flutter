import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkg_go_router/src/async_redirection/async_redirection_main_screen.dart';
import 'package:pkg_go_router/src/basic_flat_route/flat_route_main_screen.dart';
import 'package:pkg_go_router/src/basic_nested_route/nested_route_main_screen.dart';
import 'package:pkg_go_router/src/dynamic_route/dynamic_route_main_screen.dart';
import 'package:pkg_go_router/src/named_route/named_route_main_screen.dart';
import 'package:pkg_go_router/src/onexit/on_exit_main_screen.dart';
import 'package:pkg_go_router/src/path_query_params/path_query_params_main_screen.dart';
import 'package:pkg_go_router/src/redirection/redirection_main_screen.dart';
import 'package:pkg_go_router/src/shell_route/shell_route_main_screen.dart';
import 'package:pkg_go_router/src/shell_route_keys/shell_route_keys_main_screen.dart';
import 'package:pkg_go_router/src/shell_route_statefull/statefull_shell_route_main_screen.dart';

class ExampleItem {
  final String title;
  final String description;
  final IconData icon;
  final Widget screen;
  final bool useProviderScope;

  ExampleItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.screen,
    this.useProviderScope = false,
  });
}

class GoRouterMainScreen extends StatelessWidget {
  const GoRouterMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Go Router Examples'),
          centerTitle: true,
          elevation: 2,
        ),
        body: const _AppBody(),
      ),
    );
  }
}

class _AppBody extends StatelessWidget {
  const _AppBody();

  @override
  Widget build(BuildContext context) {
    final List<ExampleItem> examples = [
      ExampleItem(
        title: 'Basic Flat Route',
        description: 'Demonstrate basic navigation between flat routes.',
        icon: Icons.swap_horiz,
        screen: const FlatRouteMainScreen(),
      ),
      ExampleItem(
        title: 'Basic Nested Route',
        description: 'Show how to handle nested routes within the application.',
        icon: Icons.layers,
        screen: const NestedRouteMainScreen(),
      ),
      ExampleItem(
        title: 'Named Route',
        description: 'Use named routes for navigation instead of path strings.',
        icon: Icons.label,
        screen: const NamedRouteMainScreen(),
      ),
      ExampleItem(
        title: 'Path and Query Parameter',
        description: 'Pass and receive parameters through the URL path and query.',
        icon: Icons.link,
        screen: const PathQueryParamsMainScreen(),
      ),
      ExampleItem(
        title: 'Redirection',
        description: 'Implement route redirection based on application state.',
        icon: Icons.alt_route,
        screen: RedirectionMainScreen(),
        useProviderScope: true,
      ),
      ExampleItem(
        title: 'Async Redirection',
        description: 'Handle asynchronous redirection (e.g., auth checks).',
        icon: Icons.sync_alt,
        screen: AsyncRedirectionMainScreen(),
        useProviderScope: true,
      ),
      ExampleItem(
        title: 'On Exit',
        description: 'Intercept and confirm navigation before leaving a route.',
        icon: Icons.exit_to_app,
        screen: OnExitMainScreen(),
        useProviderScope: true,
      ),
      ExampleItem(
        title: 'Shell Route',
        description: 'Use ShellRoute to wrap a set of sub-routes with a shared UI.',
        icon: Icons.web_asset,
        screen: ShellRouteMainScreen(),
        useProviderScope: true,
      ),
      ExampleItem(
        title: 'Shell Route Keys',
        description: 'Differentiate ShellRoutes using unique keys.',
        icon: Icons.vpn_key,
        screen: ShellRouteKeysMainScreen(),
        useProviderScope: true,
      ),
      ExampleItem(
        title: 'Stateful Shell Route',
        description: 'Maintain state across different shell route branches.',
        icon: Icons.account_tree,
        screen: StatefullShellRouteMainScreen(),
        useProviderScope: true,
      ),
      ExampleItem(
        title: 'Dynamic Route',
        description: 'Generate routes dynamically based on data.',
        icon: Icons.dynamic_feed,
        screen: DynamicRouteMainScreen(),
        useProviderScope: true,
      ),
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: examples.length,
      itemBuilder: (context, index) {
        final item = examples[index];
        return _ExampleCard(item: item);
      },
    );
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({required this.item});
  final ExampleItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => item.useProviderScope
                  ? ProviderScope(child: item.screen)
                  : item.screen,
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
