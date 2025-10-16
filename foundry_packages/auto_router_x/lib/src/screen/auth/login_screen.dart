import 'package:auto_route/auto_route.dart';
import 'package:auto_router_x/src/router/app_router.dart';
import 'package:auto_router_x/src/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              FilledButton.icon(
                onPressed: ()=>context.router.push(OtpVerifyRoute()),
                label: Text("Send OTP"),
                icon: Icon(Icons.send),
              ),

              TextButton.icon(
                onPressed: ()=>context.router.replaceAll([NamedRoute(AppRoute.home)]),
                label: Text("Skip Login"),
                icon: Icon(Icons.ads_click),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
