import 'package:auto_route/auto_route.dart';
import 'package:freeman_portfolio/src/presentation/portfolio_layout_page.dart';
import 'package:freeman_portfolio/src/presentation/project/project_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: [
    CustomRoute(
      page: HomeLayoutPage,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      path: '/home',
    ),
    CustomRoute(
      page: PortfolioLayoutPage,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      path: '/portfolio',
    ),
    CustomRoute(
      page: ProjectView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      path: '/project',
    ),
  ],
)
class $AppRouter {}
