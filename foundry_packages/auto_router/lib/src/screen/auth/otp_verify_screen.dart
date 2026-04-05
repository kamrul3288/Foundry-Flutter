import 'package:auto_route/auto_route.dart';
import '../../auth/auth_cubit.dart';
import '../../router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verify Screen"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              FilledButton.icon(
                onPressed: ()=>context.read<AuthCubit>().logIn(),
                label: Text("Authenticate User"),
                icon: Icon(Icons.verified),
              ),

              TextButton.icon(
                onPressed: ()=>context.router.replace(SignUpRoute()),
                label: Text("Create New Account"),
                icon: Icon(Icons.ads_click),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
