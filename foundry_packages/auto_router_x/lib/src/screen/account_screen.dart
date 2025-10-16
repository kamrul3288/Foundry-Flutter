import 'package:auto_route/auto_route.dart';
import 'package:auto_router_x/src/auth/auth_cubit.dart';
import 'package:auto_router_x/src/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// This screen is protected by auth guard in the router configuration
// So, user can't access this screen without authentication
// If user is not authenticated, they will be redirected to the login screen
// After successful login, they will be redirected back to this screen
@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Screen"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: (){
              context.read<AuthCubit>().logout();
              context.router.replaceAll([SplashRoute()]);
            },
          ),
        ],
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text("This is a protected Account Screen.\n\nYou can only see this if you are authenticated.",style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),

            ],
          ),
        ),
      )
    );
  }
}
