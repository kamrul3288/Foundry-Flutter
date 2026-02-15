import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_navigation/src/auth/otp_verify_screen.dart';
import 'package:go_router_navigation/src/auth/sign_up_screen.dart';
import 'package:go_router_navigation/src/bike_service/bike_service_screen.dart';
import 'package:go_router_navigation/src/car_service/car_service_screen.dart';
import 'package:go_router_navigation/src/dashboard/history_screen.dart';
import 'package:go_router_navigation/src/dashboard/home_screen.dart';
import 'package:go_router_navigation/src/dashboard/menu_screen.dart';
import 'package:go_router_navigation/src/dashboard/notification_screen.dart';
import 'package:go_router_navigation/src/entry/splash_screen.dart';
import 'package:go_router_navigation/src/router/app_named_route.dart';
import 'package:go_router_navigation/src/widgets/app_botton_nav_bar.dart' show AppBottonNavBar;

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      name: AppNamedRoute.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: '/otp_verify',
      name: AppNamedRoute.otpVerify,
      builder: (context, state) => const OtpVerifyScreen(),
    ),

    GoRoute(
      path: '/sign_up',
      name: AppNamedRoute.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),

    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppBottonNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          name: AppNamedRoute.home,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'bike_service',
              parentNavigatorKey: _rootNavigatorKey,
              name: AppNamedRoute.bikeService,
              builder: (context, state) => const BikeServiceScreen(),
            ),
            GoRoute(
              path: 'car_service',
              parentNavigatorKey: _rootNavigatorKey,
              name: AppNamedRoute.carService,
              builder: (context, state) => const CarServiceScreen(),
            ),
          ],
        ),

        GoRoute(
          path: '/history',
          name: AppNamedRoute.history,
          builder: (context, state) => const HistoryScreen(),
        ),

        GoRoute(
          path: '/notification',
          name: AppNamedRoute.notification,
          builder: (context, state) => const NotificationScreen(),
        ),

        GoRoute(
          path: '/menu',
          name: AppNamedRoute.menu,
          builder: (context, state) => const MenuScreen(),
        ),
      ],
    ),
  ],
);
