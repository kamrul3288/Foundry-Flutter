part of 'statefull_shell_route_main_screen.dart';

class _BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const _BottomNavBar(this.navigationShell);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
      ),
      body: navigationShell,
    );
  }
}
