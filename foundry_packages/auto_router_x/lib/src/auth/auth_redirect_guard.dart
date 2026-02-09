import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:auto_router_x/src/auth/auth_config.dart';
import 'package:auto_router_x/src/auth/auth_cubit.dart';
import 'package:auto_router_x/src/router/app_router.gr.dart';

import 'package:auto_router_x/src/router/app_router.dart';

final class AuthGuard extends AutoRouteGuard {
  final AuthCubit _authCubit;

  final _authRoutes = [AuthFlowShell.name, LoginRoute.name, OtpVerifyRoute.name, SignUpRoute.name];
  final _authGuardRoutes = [AccountRoute.name];
  StreamSubscription? _authSubscription;
  NavigationResolver? _pendingResolver;

  AuthGuard(AuthCubit authCubit) : _authCubit = authCubit;

  // Central place to start the flow only once
  void _startAuthFlowIfNeeded(StackRouter router, NavigationResolver resolver) {
    _pendingResolver = resolver;
    _authCubit.setAuthConfig(const AuthConfig(viaRedirect: true));
    router.push(const AuthFlowShell());
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    _ensureAuthSubscription(router);

    // 0) Let auth-flow routes pass through the global guard
    if (_authRoutes.contains(resolver.route.name)) {
      resolver.next();
      return;
    }

    final loggedIn = _authCubit.state.isAuthed == true;
    bool needAuth(String name) => _authGuardRoutes.contains(name);

    // 2) If route doesn't need auth, or user already logged in → allow
    if (!needAuth(resolver.route.name) || loggedIn) {
      resolver.next();
      return;
    }

    _startAuthFlowIfNeeded(router, resolver);
  }

  void _ensureAuthSubscription(StackRouter router) {
    if (_authSubscription != null) return;

    _authSubscription = _authCubit.stream.listen((state) async {
      if (!state.isAuthed) return;

      if (_authCubit.authConfig?.viaRedirect == true && _pendingResolver != null) {
        // Clean the whole auth flow stack (safe even if not present)
        router.removeWhere((route) => _authRoutes.contains(route.name));
        _authCubit.clearAuthConfig();
        _pendingResolver?.next();
      }

      if (_authCubit.authConfig == null) {
        router.replaceAll([const NamedRoute(AppRoute.home)]);
      }

      if (_authCubit.authConfig?.fromRoute != null) {
        router.popUntil((route) => route.settings.name == _authCubit.authConfig?.fromRoute);
      }

      _pendingResolver = null;
      _authCubit.clearAuthConfig();
      await _authSubscription?.cancel();
      _authSubscription = null;
    });
  }

  void dispose() {
    _authSubscription?.cancel();
  }
}
