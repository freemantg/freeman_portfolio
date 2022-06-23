import 'package:auto_route/annotations.dart';
import 'package:freeman_portfolio/src/presentation/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: [AutoRoute(page: HomePage, initial: true)],
)
class $AppRouter {}
