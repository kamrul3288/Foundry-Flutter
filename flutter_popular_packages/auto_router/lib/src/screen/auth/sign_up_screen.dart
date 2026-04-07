import 'package:auto_route/annotations.dart';
import 'package:pkg_auto_router/src/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Screen"),
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

            ],
          ),
        ),
      ),
    );
  }
}
