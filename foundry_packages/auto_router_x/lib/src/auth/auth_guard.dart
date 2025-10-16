// import 'dart:async';
// import 'package:auto_route/auto_route.dart';
// import 'package:auto_router_x/src/auth/auth_cubit.dart';
// import 'package:auto_router_x/src/router/app_router.dart';
//
// final class AuthGuard extends AutoRouteGuard{
//   final AuthCubit _authCubit;
//   late final StreamSubscription? _authSubscription;
//
//   AuthGuard(AuthCubit authCubit): _authCubit = authCubit;
//
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     resolver.next();
//
//
//     _authSubscription = _authCubit.stream.listen((state) {
//       if(!state.isAuthed || _authCubit.authConfig?.viaRedirect == false) return;
//
//       if(_authCubit.authConfig == null) {
//         router.replaceAll([NamedRoute(AppRoute.home)]);
//         _authCubit.clearAuthConfig();
//         return;
//       }
//
//       router.popUntil((route)=> route.settings.name == _authCubit.authConfig?.fromRoute);
//       _authCubit.clearAuthConfig();
//
//     });
//   }
//
//   void dispose() {
//     _authSubscription?.cancel();
//   }
// }