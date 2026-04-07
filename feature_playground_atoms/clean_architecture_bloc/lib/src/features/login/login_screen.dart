import 'bloc/login_cubit.dart';
import '../../locale/cubit/locale_cubit.dart';
import '../../locale/extensions/app_locale_extension.dart';
import '../../locale/extensions/app_locale_key_extension.dart';
import '../../router/app_route_name.dart';
import '../../ui/error_handling/failure_message_resolver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _listener(BuildContext context, LoginState state) {
    if (state.status.isFailure) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.failure!.resolveMessage(context))));
    } else if (state.status.isSuccess) {
      context.goNamed(AppRouteName.posts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: _listener,
        child: SafeArea(
          child: const _LoginView(),
        ),
      ),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.lock_person_rounded, size: 80, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 32),
                Text(
                  context.l10n.title_welcome_back,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.message_signin,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 48),
                const _EmailField(),
                const SizedBox(height: 20),
                const _PasswordField(),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(context.l10n.button_forgot_password),
                  ),
                ),
                const SizedBox(height: 24),
                const _LoginButton(),
              ],
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return SegmentedButton<String>(
                segments: const [
                  ButtonSegment<String>(value: 'en', label: Text('EN')),
                  ButtonSegment<String>(value: 'bn', label: Text('BN')),
                ],
                selected: {locale.languageCode},
                onSelectionChanged: (Set<String> newSelection) {
                  context.read<LocaleCubit>().changeLocale(newSelection.first);
                },
                showSelectedIcon: false,
                style: SegmentedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, curr) => prev.email != curr.email,
      builder: (context, state) {
        return TextField(
          onChanged: context.read<LoginCubit>().onEmailChanged,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: context.l10n.hint_email,
            prefixIcon: const Icon(Icons.email_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            errorText: state.email.displayError?.locale(context, args: [context.l10n.hint_email]),
          ),
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, curr) => prev.password != curr.password,
      builder: (context, state) {
        return TextField(
          onChanged: context.read<LoginCubit>().onPasswordChanged,
          obscureText: true,
          decoration: InputDecoration(
            labelText: context.l10n.hint_password,
            prefixIcon: const Icon(Icons.lock_outline),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            errorText: state.password.displayError?.locale(context, args: [context.l10n.hint_password]),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return FilledButton(
          onPressed: state.status.isInProgress ? null : context.read<LoginCubit>().onLoginPressed,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: state.status.isInProgress
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              : Text(
                  context.l10n.button_signin,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
        );
      },
    );
  }
}
