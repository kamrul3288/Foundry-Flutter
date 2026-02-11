import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _di = GetIt.instance;
void _configureDependencies() {
  _di.registerSingletonAsync<_AsyncSingleton>(() async => _AsyncSingleton().init());
  _di.registerLazySingletonAsync<_AsyncLazySingleton>(() async => _AsyncLazySingleton().init());
  _di.registerFactoryAsync<_AsyncFactory>(() async => _AsyncFactory().init());
  _di.registerLazySingletonAsync<_AsyncCachedFactory>(() async => _AsyncCachedFactory().init());
}

class AsyncObjectRegistrationScreen extends StatelessWidget {
  const AsyncObjectRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// this is not a best practice please do it in main.dart
    _configureDependencies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Object Registration'),
      ),
      body: FutureBuilder(
        // _di.allReady() only works for registerSingletonAsync
        future: _di.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: _Body());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Text(_di.get<_AsyncSingleton>().message()),
        FutureBuilder(
          future: _di.getAsync<_AsyncLazySingleton>(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.message());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        FutureBuilder(
          future: _di.getAsync<_AsyncFactory>(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.message());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        FutureBuilder(
          future: _di.getAsync<_AsyncCachedFactory>(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.message());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}

/// it's created only once and live until the app is closed, and it's created object immediately and keep it in memory
final class _AsyncSingleton {
  Future<_AsyncSingleton> init() async {
    await Future.delayed(const Duration(seconds: 3));
    return this;
  }

  String message() => "Data from registered async singleton";
}

/// it's like the singleton but it's created object when you first time call it
final class _AsyncLazySingleton {
  Future<_AsyncLazySingleton> init() async {
    await Future.delayed(const Duration(seconds: 2));
    return this;
  }

  String message() => "Data from registered async lazy singleton";
}

/// it's created every time you call it
final class _AsyncFactory {
  Future<_AsyncFactory> init() async {
    await Future.delayed(const Duration(seconds: 4));
    return this;
  }

  String message() => "Data from registered async factory";
}

/// it's created every time you call it but if it's in memory then reuse the instance.
final class _AsyncCachedFactory {
  Future<_AsyncCachedFactory> init() async {
    await Future.delayed(const Duration(seconds: 6));
    return this;
  }

  String message() => "Data from registered async cached factory";
}
