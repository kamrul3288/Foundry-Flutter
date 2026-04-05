import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
part 'scope_injector_wrapper.dart';

final _di = GetIt.instance;

class ScopingScreen extends StatelessWidget {
  const ScopingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, textAlign: TextAlign.center),
            Text(email, textAlign: TextAlign.center),

            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => _ProfileScreen())),
              child: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }

  String get name {
    try {
      return _di<UserData>().name;
    } catch (e) {
      return "Name Not Found - It's scoped with ProfileScreen";
    }
  }

  String get email {
    try {
      return _di<UserData>().email;
    } catch (e) {
      return "Email Not Found - It's scoped with ProfileScreen";
    }
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return ScopeInjectorWrapper(
      initDi: (di) {
        di.registerSingleton<UserData>(UserData());
      },
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_di.get<UserData>().name),
              Text(_di.get<UserData>().email),
            ],
          ),
        ),
      ),
    );
  }
}

final class UserData {
  final String _name;
  final String _email;
  UserData() : _name = "Kamrul Hasan", _email = "kamrulhasan3288@gmail.com";

  String get name => _name;
  String get email => _email;
}
