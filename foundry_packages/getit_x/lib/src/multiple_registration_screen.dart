import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _di = GetIt.instance;

void _configureDependencies() {
  _di.registerSingleton<_RestApiClient>(
    _RestApiClient('https://dev.example.com'),
    instanceName: "dev",
  );
  _di.registerSingleton<_RestApiClient>(
    _RestApiClient('https://prod.example.com'),
    instanceName: "prod",
  );
}

class MultipleRegistrationScreen extends StatelessWidget {
  const MultipleRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// this is not a best practice please do it in main.dart, this is for demo purpose only
    _configureDependencies();
    return Scaffold(
      appBar: AppBar(title: Text('Multiple Registration')),
      body: Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('RestApiClient: ${_di.get<_RestApiClient>(instanceName: "dev").baseUrl}'),
            Text('RestApiClient: ${_di.get<_RestApiClient>(instanceName: "prod").baseUrl}'),
          ],
        ),
      ),
    );
  }
}

class _RestApiClient {
  final String _baseUrl;
  _RestApiClient(this._baseUrl);

  String get baseUrl => _baseUrl;
}
