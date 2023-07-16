import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeLayoutRoute.page, path: '/'),
    AutoRoute(page: PortfolioLayoutRoute.page),
  ];
}
// @MaterialAutoRouter(
//   replaceInRouteName: 'Page',
//   routes: [
//     CustomRoute(
//       page: HomeLayoutPage,
//       initial: true,
//       transitionsBuilder: TransitionsBuilders.fadeIn,
//       path: '/',
//     ),
//     CustomRoute(
//       page: PortfolioLayoutPage,
//       initial: true,
//       transitionsBuilder: TransitionsBuilders.fadeIn,
//     ),
//     CustomRoute(
//       page: ProjectView,
//       transitionsBuilder: TransitionsBuilders.fadeIn,
//     ),
//   ],
// )
// class $AppRouter {}
