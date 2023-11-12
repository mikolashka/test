
import 'package:auto_route/auto_route.dart';

import '../../presentation/auth/screens/auth_screen.dart';
import '../../presentation/auth/screens/register_screen.dart';
import '../../presentation/initial/initial_screen.dart';
import '../../presentation/main/main_screen.dart';

part 'router.gr.dart';

class RouteNames {
  static const initial = 'InitialRoute';
  static const auth = 'AuthRoute';
  static const main = 'MainRoute';
  static const register = 'RegisterRoute';
}

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes =>
      [
        AutoRoute(page: InitialRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page, initial: false),
        AutoRoute(page: MainRoute.page, initial: false),
        AutoRoute(page: RegisterRoute.page, initial: false),
      ];
}