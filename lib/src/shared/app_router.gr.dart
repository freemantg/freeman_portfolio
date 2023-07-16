// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:freeman_portfolio/src/presentation/portfolio_layout_page.dart'
    as _i1;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    PortfolioLayoutRoute.name: (routeData) {
      final args = routeData.argsAs<PortfolioLayoutRouteArgs>(
          orElse: () => const PortfolioLayoutRouteArgs());
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.PortfolioLayoutPage(
          key: args.key,
          centerView: args.centerView,
        ),
      );
    },
    HomeLayoutRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeLayoutPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.PortfolioLayoutPage]
class PortfolioLayoutRoute extends _i2.PageRouteInfo<PortfolioLayoutRouteArgs> {
  PortfolioLayoutRoute({
    _i3.Key? key,
    _i3.Widget? centerView,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          PortfolioLayoutRoute.name,
          args: PortfolioLayoutRouteArgs(
            key: key,
            centerView: centerView,
          ),
          initialChildren: children,
        );

  static const String name = 'PortfolioLayoutRoute';

  static const _i2.PageInfo<PortfolioLayoutRouteArgs> page =
      _i2.PageInfo<PortfolioLayoutRouteArgs>(name);
}

class PortfolioLayoutRouteArgs {
  const PortfolioLayoutRouteArgs({
    this.key,
    this.centerView,
  });

  final _i3.Key? key;

  final _i3.Widget? centerView;

  @override
  String toString() {
    return 'PortfolioLayoutRouteArgs{key: $key, centerView: $centerView}';
  }
}

/// generated route for
/// [_i1.HomeLayoutPage]
class HomeLayoutRoute extends _i2.PageRouteInfo<void> {
  const HomeLayoutRoute({List<_i2.PageRouteInfo>? children})
      : super(
          HomeLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeLayoutRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
