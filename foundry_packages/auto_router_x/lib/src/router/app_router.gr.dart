// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:auto_router_x/src/model/complex_args.dart' as _i22;
import 'package:auto_router_x/src/screen/account_screen.dart' as _i1;
import 'package:auto_router_x/src/screen/auth/auth_flow_shell.dart' as _i2;
import 'package:auto_router_x/src/screen/auth/login_screen.dart' as _i6;
import 'package:auto_router_x/src/screen/auth/otp_verify_screen.dart' as _i11;
import 'package:auto_router_x/src/screen/auth/sign_up_screen.dart' as _i13;
import 'package:auto_router_x/src/screen/check_out_screen.dart' as _i3;
import 'package:auto_router_x/src/screen/complex_arguments_screen.dart' as _i4;
import 'package:auto_router_x/src/screen/nested/nested_nav1_screen.dart' as _i7;
import 'package:auto_router_x/src/screen/nested/nested_nav2_screen.dart' as _i8;
import 'package:auto_router_x/src/screen/nested/nested_nav3_screen.dart' as _i9;
import 'package:auto_router_x/src/screen/nested/nested_nav_main_screen.dart'
    as _i10;
import 'package:auto_router_x/src/screen/return_result_screen.dart' as _i12;
import 'package:auto_router_x/src/screen/shell/empty_shell_router_screen.dart'
    as _i5;
import 'package:auto_router_x/src/screen/splash_screen.dart' as _i14;
import 'package:auto_router_x/src/screen/tab/tab1_screen.dart' as _i15;
import 'package:auto_router_x/src/screen/tab/tab2_screen.dart' as _i16;
import 'package:auto_router_x/src/screen/tab/tab3_screen.dart' as _i17;
import 'package:auto_router_x/src/screen/tab/tab_info_screen.dart' as _i18;
import 'package:auto_router_x/src/screen/tab/tab_main_screen.dart' as _i19;
import 'package:flutter/material.dart' as _i21;

/// generated route for
/// [_i1.AccountScreen]
class AccountRoute extends _i20.PageRouteInfo<void> {
  const AccountRoute({List<_i20.PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountScreen();
    },
  );
}

/// generated route for
/// [_i2.AuthFlowShell]
class AuthFlowShell extends _i20.PageRouteInfo<void> {
  const AuthFlowShell({List<_i20.PageRouteInfo>? children})
    : super(AuthFlowShell.name, initialChildren: children);

  static const String name = 'AuthFlowShell';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthFlowShell();
    },
  );
}

/// generated route for
/// [_i3.CheckOutScreen]
class CheckOutRoute extends _i20.PageRouteInfo<void> {
  const CheckOutRoute({List<_i20.PageRouteInfo>? children})
    : super(CheckOutRoute.name, initialChildren: children);

  static const String name = 'CheckOutRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i3.CheckOutScreen();
    },
  );
}

/// generated route for
/// [_i4.ComplexArgumentsScreen]
class ComplexArgumentsRoute
    extends _i20.PageRouteInfo<ComplexArgumentsRouteArgs> {
  ComplexArgumentsRoute({
    _i21.Key? key,
    required _i22.ComplexArgs args,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         ComplexArgumentsRoute.name,
         args: ComplexArgumentsRouteArgs(key: key, args: args),
         initialChildren: children,
       );

  static const String name = 'ComplexArgumentsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ComplexArgumentsRouteArgs>();
      return _i4.ComplexArgumentsScreen(key: args.key, args: args.args);
    },
  );
}

class ComplexArgumentsRouteArgs {
  const ComplexArgumentsRouteArgs({this.key, required this.args});

  final _i21.Key? key;

  final _i22.ComplexArgs args;

  @override
  String toString() {
    return 'ComplexArgumentsRouteArgs{key: $key, args: $args}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ComplexArgumentsRouteArgs) return false;
    return key == other.key && args == other.args;
  }

  @override
  int get hashCode => key.hashCode ^ args.hashCode;
}

/// generated route for
/// [_i5.EmptyShellRouterScreen]
class EmptyShellRouterRoute extends _i20.PageRouteInfo<void> {
  const EmptyShellRouterRoute({List<_i20.PageRouteInfo>? children})
    : super(EmptyShellRouterRoute.name, initialChildren: children);

  static const String name = 'EmptyShellRouterRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i5.EmptyShellRouterScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute({List<_i20.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.NestedNav1Screen]
class NestedNav1Route extends _i20.PageRouteInfo<void> {
  const NestedNav1Route({List<_i20.PageRouteInfo>? children})
    : super(NestedNav1Route.name, initialChildren: children);

  static const String name = 'NestedNav1Route';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i7.NestedNav1Screen();
    },
  );
}

/// generated route for
/// [_i8.NestedNav2Screen]
class NestedNav2Route extends _i20.PageRouteInfo<void> {
  const NestedNav2Route({List<_i20.PageRouteInfo>? children})
    : super(NestedNav2Route.name, initialChildren: children);

  static const String name = 'NestedNav2Route';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i8.NestedNav2Screen();
    },
  );
}

/// generated route for
/// [_i9.NestedNav3Screen]
class NestedNav3Route extends _i20.PageRouteInfo<void> {
  const NestedNav3Route({List<_i20.PageRouteInfo>? children})
    : super(NestedNav3Route.name, initialChildren: children);

  static const String name = 'NestedNav3Route';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i9.NestedNav3Screen();
    },
  );
}

/// generated route for
/// [_i10.NestedNavMainScreen]
class NestedNavMainRoute extends _i20.PageRouteInfo<void> {
  const NestedNavMainRoute({List<_i20.PageRouteInfo>? children})
    : super(NestedNavMainRoute.name, initialChildren: children);

  static const String name = 'NestedNavMainRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i10.NestedNavMainScreen();
    },
  );
}

/// generated route for
/// [_i11.OtpVerifyScreen]
class OtpVerifyRoute extends _i20.PageRouteInfo<void> {
  const OtpVerifyRoute({List<_i20.PageRouteInfo>? children})
    : super(OtpVerifyRoute.name, initialChildren: children);

  static const String name = 'OtpVerifyRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i11.OtpVerifyScreen();
    },
  );
}

/// generated route for
/// [_i12.ReturnResultScreen]
class ReturnResultRoute extends _i20.PageRouteInfo<ReturnResultRouteArgs> {
  ReturnResultRoute({
    _i21.Key? key,
    dynamic Function(String)? onResult,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         ReturnResultRoute.name,
         args: ReturnResultRouteArgs(key: key, onResult: onResult),
         initialChildren: children,
       );

  static const String name = 'ReturnResultRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReturnResultRouteArgs>(
        orElse: () => const ReturnResultRouteArgs(),
      );
      return _i12.ReturnResultScreen(key: args.key, onResult: args.onResult);
    },
  );
}

class ReturnResultRouteArgs {
  const ReturnResultRouteArgs({this.key, this.onResult});

  final _i21.Key? key;

  final dynamic Function(String)? onResult;

  @override
  String toString() {
    return 'ReturnResultRouteArgs{key: $key, onResult: $onResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReturnResultRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i13.SignUpScreen]
class SignUpRoute extends _i20.PageRouteInfo<void> {
  const SignUpRoute({List<_i20.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i13.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i14.SplashScreen]
class SplashRoute extends _i20.PageRouteInfo<void> {
  const SplashRoute({List<_i20.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i14.SplashScreen();
    },
  );
}

/// generated route for
/// [_i15.Tab1Screen]
class Tab1Route extends _i20.PageRouteInfo<void> {
  const Tab1Route({List<_i20.PageRouteInfo>? children})
    : super(Tab1Route.name, initialChildren: children);

  static const String name = 'Tab1Route';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i15.Tab1Screen();
    },
  );
}

/// generated route for
/// [_i16.Tab2Screen]
class Tab2Route extends _i20.PageRouteInfo<void> {
  const Tab2Route({List<_i20.PageRouteInfo>? children})
    : super(Tab2Route.name, initialChildren: children);

  static const String name = 'Tab2Route';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i16.Tab2Screen();
    },
  );
}

/// generated route for
/// [_i17.Tab3Screen]
class Tab3Route extends _i20.PageRouteInfo<void> {
  const Tab3Route({List<_i20.PageRouteInfo>? children})
    : super(Tab3Route.name, initialChildren: children);

  static const String name = 'Tab3Route';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i17.Tab3Screen();
    },
  );
}

/// generated route for
/// [_i18.TabInfoScreen]
class TabInfoRoute extends _i20.PageRouteInfo<void> {
  const TabInfoRoute({List<_i20.PageRouteInfo>? children})
    : super(TabInfoRoute.name, initialChildren: children);

  static const String name = 'TabInfoRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i18.TabInfoScreen();
    },
  );
}

/// generated route for
/// [_i19.TabMainScreen]
class TabMainRoute extends _i20.PageRouteInfo<void> {
  const TabMainRoute({List<_i20.PageRouteInfo>? children})
    : super(TabMainRoute.name, initialChildren: children);

  static const String name = 'TabMainRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i19.TabMainScreen();
    },
  );
}
