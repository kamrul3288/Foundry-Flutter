import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _di = GetIt.instance;
void _configureDependencies() {
  _di.registerSingleton<_Singleton>(_Singleton());
  _di.registerLazySingleton<_LazySingleton>(() => _LazySingleton());
  _di.registerFactory<_Factory>(() => _Factory());
  _di.registerLazySingleton<_CachedFactory>(() => _CachedFactory());
}

class ObjectRegistrationScreen extends StatelessWidget {
  const ObjectRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// this is not a best practice please do it in main.dart
    _configureDependencies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Object Registration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Text(_di.get<_Singleton>().message()),
            Text(_di.get<_LazySingleton>().message()),
            Text(_di.get<_Factory>().message()),
            Text(_di.get<_CachedFactory>().message()),
          ],
        ),
      ),
    );
  }
}

/// it's created only once and live until the app is closed, and it's created object immediately and keep it in memory
final class _Singleton {
  const _Singleton();
  String message() => "Data from registered singleton";
}

/// it's like the singleton but it's created object when you first time call it
final class _LazySingleton {
  const _LazySingleton();
  String message() => "Data from registered lazy singleton";
}

/// it's created every time you call it
final class _Factory {
  const _Factory();
  String message() => "Data from registered factory";
}

/// it's created every time you call it but if it's in memory then reuse the instance.
final class _CachedFactory {
  const _CachedFactory();
  String message() => "Data from registered cached factory";
}
