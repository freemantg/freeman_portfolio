import 'package:auto_route/auto_route.dart';
import 'package:freeman_portfolio/src/presentation/portfolio_layout_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: [
    CustomRoute(
      page: PortfolioLayoutPage,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    )
  ],
)
class $AppRouter {}
