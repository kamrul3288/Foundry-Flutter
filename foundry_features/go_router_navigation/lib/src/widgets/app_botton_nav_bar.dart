import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_navigation/src/router/app_named_route.dart';

class AppBottonNavBar extends StatelessWidget {
  final Widget? child;
  const AppBottonNavBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
      body: child,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/history')) {
      return 1;
    }
    if (location.startsWith('/notification')) {
      return 2;
    }
    if (location.startsWith('/menu')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed(AppNamedRoute.home);
      case 1:
        GoRouter.of(context).goNamed(AppNamedRoute.history);
      case 2:
        GoRouter.of(context).goNamed(AppNamedRoute.notification);
      case 3:
        GoRouter.of(context).goNamed(AppNamedRoute.menu);
    }
  }
}
