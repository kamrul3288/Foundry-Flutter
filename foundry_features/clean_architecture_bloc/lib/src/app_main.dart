import 'package:clean_architecture_bloc/src/di/app_di_module.dart';
import 'package:clean_architecture_bloc/src/router/app_router.dart';
import 'package:flutter/material.dart';

/// below code is the better approach to register di modules in flutter
// void main() async {
//   // Required if you are doing async work before runApp
//   WidgetsFlutterBinding.ensureInitialized();
//   // 1. Register all your modules (data, domain, feature)
//   await registerAppDiModule();
//   // 2. Wait for any registerSingletonAsync() calls to finish building
//   await getIt.allReady();
//   // 3. Start the app
//   runApp(const MyApp());
// }

class CleanArchitectureBlocApp extends StatelessWidget {
  const CleanArchitectureBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    registerAppDiModule();
    return FutureBuilder(
      future: locator.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp.router(
            title: 'Foundry Flutter',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: appRouter,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
