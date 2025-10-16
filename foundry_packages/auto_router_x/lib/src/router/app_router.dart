import 'package:auto_route/auto_route.dart';
import 'package:auto_router_x/src/auth/auth_redirect_guard.dart';
import 'package:auto_router_x/src/router/app_router.gr.dart';
import 'package:auto_router_x/src/screen/home_screen.dart' show HomeScreen;


final class AppRoute{
  const AppRoute._();
  static const String home = "home";
}

@AutoRouterConfig()
final class AppRouter extends RootStackRouter{
  final AuthGuard _authRedirectGuard;
  AppRouter(AuthGuard authRedirectGuard): _authRedirectGuard = authRedirectGuard;

  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRouteGuard> get guards => [_authRedirectGuard];


  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: AccountRoute.page,guards: [_authRedirectGuard]),
    //Use NamedRouteDef if you don't want to generate a separate class for the route
    NamedRouteDef(
      name: AppRoute.home,
      builder: (context, state) => HomeScreen(),
    ),

    AutoRoute(page: ComplexArgumentsRoute.page),
    AutoRoute(page: ReturnResultRoute.page),
    AutoRoute(
      page: NestedNavMainRoute.page,
      children: [
        AutoRoute(page: NestedNav1Route.page, initial: true),
        AutoRoute(page: NestedNav2Route.page, path: "NestedNav2Route"),
        AutoRoute(page: NestedNav3Route.page, path: "NestedNav3Route"),
      ]
    ),

    AutoRoute(
      page: TabMainRoute.page,
      children:[
        AutoRoute(
          page: EmptyShellRoute("tab1").page,
          initial: true,
          children: [
            AutoRoute(page: Tab1Route.page, path: ''),
            AutoRoute(page: TabInfoRoute.page, path: "TabInfoRoute"),
          ],
        ),
        AutoRoute(page: Tab2Route.page, path: "Tab2Route"),
        AutoRoute(page: Tab3Route.page, path: "Tab3Route"),
      ]
    ),


    //Auth Flow
    AutoRoute(
      page: AuthFlowShell.page,
      path: "/auth",
      children: [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: OtpVerifyRoute.page, path: "otp"),
        AutoRoute(page: SignUpRoute.page, path: "signup"),
      ]
    ),

    AutoRoute(page: CheckOutRoute.page),

  ];

}