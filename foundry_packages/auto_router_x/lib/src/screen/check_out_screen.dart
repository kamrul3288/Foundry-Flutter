import 'package:auto_route/auto_route.dart';
import 'package:auto_router_x/src/auth/auth_config.dart';
import 'package:auto_router_x/src/auth/auth_cubit.dart';
import 'package:auto_router_x/src/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: FilledButton(
            onPressed: () {
              context.read<AuthCubit>().setAuthConfig(AuthConfig(fromRoute: CheckOutRoute.name));
              context.router.push(LoginRoute());
            },
            child: Text("Send trip request"),
          ),
        ),
      ),
    );
  }
}
