import 'package:auto_route/auto_route.dart';
import 'package:auto_router_x/src/router/app_router.dart';
import 'package:auto_router_x/src/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              FilledButton.icon(
                icon: Icon(Icons.account_tree),
                label: Text("Go to Home Screen & clear stack"),
                onPressed: () => context.router.replaceAll([NamedRoute(AppRoute.home)])
              ),

              TextButton.icon(
                icon: Icon(Icons.login),
                label: Text("Go to Login Screen"),
                onPressed: () => context.router.push(LoginRoute())
              )

            ],
          ),
        ),
      ),

    );
  }
}
