import 'package:clean_architecture_bloc/src/di/app_di_module.dart';
import 'package:clean_architecture_bloc/src/locale/cubit/locale_cubit.dart';
import 'package:clean_architecture_bloc/src/locale/l10n/generated/app_locale.dart';
import 'package:clean_architecture_bloc/src/router/app_router.dart';
import 'package:clean_architecture_bloc/src/local_storage/preferences/app_preferences_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

// treat this as a main.dart file
class CleanArchitectureBlocApp extends StatelessWidget {
  const CleanArchitectureBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    registerAppDiModule();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit(locator<AppPreferencesStorage>())..loadLocale()),
      ],
      child: FutureBuilder(
        future: locator.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const _App();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          title: 'Foundry Flutter',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          locale: locale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocale.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('bn', 'BD'),
          ],
          routerConfig: appRouter,
        );
      },
    );
  }
}
