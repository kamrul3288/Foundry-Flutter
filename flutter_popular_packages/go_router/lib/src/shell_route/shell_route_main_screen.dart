import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
part 'bottom_nav_bar.dart';
part 'router.dart';

class ShellRouteMainScreen extends StatelessWidget {
  const ShellRouteMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      routerConfig: _router,
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shell Home'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 80, color: Colors.indigo),
            const SizedBox(height: 24),
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This screen is wrapped by a ShellRoute with a persistent bottom navigation bar.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.go('/home/details'),
              icon: const Icon(Icons.info_outline),
              label: const Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsScreen extends StatelessWidget {
  const _DetailsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.description, size: 80, color: Colors.indigo),
            const SizedBox(height: 24),
            const Text(
              'Details Content',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('A sub-route within the Home shell.'),
            const SizedBox(height: 32),
            OutlinedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 24),
            const Text(
              'Profile Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.go('/profile/profile-update'),
              icon: const Icon(Icons.edit),
              label: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileUpdateScreen extends StatelessWidget {
  const _ProfileUpdateScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.settings_suggest, size: 80, color: Colors.indigo),
            const SizedBox(height: 24),
            const Text(
              'Profile Update Content',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            OutlinedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.check),
              label: const Text('Finish Update'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsScreen extends StatelessWidget {
  const _SettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, size: 80, color: Colors.indigo),
            SizedBox(height: 24),
            Text(
              'Settings Content',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Manage your application preferences here.'),
          ],
        ),
      ),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shell Route Login'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.login_rounded, size: 80, color: Colors.indigo),
              const SizedBox(height: 24),
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'This login screen is outside of the shell. Logging in will navigate you into the ShellRoute.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () => context.go('/home'),
                icon: const Icon(Icons.login),
                label: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
