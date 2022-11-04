// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../presentation/portfolio_layout_page.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    PortfolioLayoutPageRoute.name: (routeData) {
      final args = routeData.argsAs<PortfolioLayoutPageRouteArgs>(
          orElse: () => const PortfolioLayoutPageRouteArgs());
      return _i2.CustomPage<dynamic>(
          routeData: routeData,
          child: _i1.PortfolioLayoutPage(
              key: args.key, centerView: args.centerView),
          transitionsBuilder: _i2.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i2.RouteConfig> get routes =>
      [_i2.RouteConfig(PortfolioLayoutPageRoute.name, path: '/')];
}

/// generated route for
/// [_i1.PortfolioLayoutPage]
class PortfolioLayoutPageRoute
    extends _i2.PageRouteInfo<PortfolioLayoutPageRouteArgs> {
  PortfolioLayoutPageRoute({_i3.Key? key, _i3.Widget? centerView})
      : super(PortfolioLayoutPageRoute.name,
            path: '/',
            args:
                PortfolioLayoutPageRouteArgs(key: key, centerView: centerView));

  static const String name = 'PortfolioLayoutPageRoute';
}

class PortfolioLayoutPageRouteArgs {
  const PortfolioLayoutPageRouteArgs({this.key, this.centerView});

  final _i3.Key? key;

  final _i3.Widget? centerView;

  @override
  String toString() {
    return 'PortfolioLayoutPageRouteArgs{key: $key, centerView: $centerView}';
  }
}
