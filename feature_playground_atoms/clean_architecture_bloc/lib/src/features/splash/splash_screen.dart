import 'bloc/splash_cubit.dart';
import 'splash_body.dart';
import '../../router/app_route_name.dart';
import '../../ui/error_handling/failure_message_resolver.dart';
import '../../ui/widgets/network_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashCubit>().checkUserAhrorization();
    });
  }

  void _handleUiEventListener(BuildContext context, SplashUiEvent? uiEvent) {
    if (uiEvent == null) return;
    if (uiEvent == SplashUiEvent.authorized) {
      context.goNamed(AppRouteName.posts);
    } else if (uiEvent == SplashUiEvent.unauthorized) {
      context.goNamed(AppRouteName.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) => _handleUiEventListener(context, state.uiEvent),
        child: BlocSelector<SplashCubit, SplashState, ({SplashUiState uiState, String? errorMessage})>(
          selector: (state) => (uiState: state.uiState, errorMessage: state.failure?.resolveMessage(context)),
          builder: (context, state) {
            if (state.uiState == SplashUiState.error) {
              return NetworkErrorScreen(
                message: state.errorMessage,
                onRetry: () => context.read<SplashCubit>().checkUserAhrorization(),
              );
            } else {
              return const SplashBody();
            }
          },
        ),
      ),
    );
  }
}
