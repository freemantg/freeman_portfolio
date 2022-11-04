// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../domain/project.dart' as _i5;
import '../presentation/portfolio_layout_page.dart' as _i1;
import '../presentation/project/project_view.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    PortfolioLayoutPageRoute.name: (routeData) {
      final args = routeData.argsAs<PortfolioLayoutPageRouteArgs>(
          orElse: () => const PortfolioLayoutPageRouteArgs());
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.PortfolioLayoutPage(
          key: args.key,
          centerView: args.centerView,
        ),
        transitionsBuilder: _i3.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProjectViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectViewRouteArgs>();
      return _i3.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.ProjectView(
          args.projectType,
          key: args.key,
        ),
        transitionsBuilder: _i3.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          PortfolioLayoutPageRoute.name,
          path: '/home',
        ),
        _i3.RouteConfig(
          ProjectViewRoute.name,
          path: '/project',
        ),
      ];
}

/// generated route for
/// [_i1.PortfolioLayoutPage]
class PortfolioLayoutPageRoute
    extends _i3.PageRouteInfo<PortfolioLayoutPageRouteArgs> {
  PortfolioLayoutPageRoute({
    _i4.Key? key,
    _i4.Widget? centerView,
  }) : super(
          PortfolioLayoutPageRoute.name,
          path: '/home',
          args: PortfolioLayoutPageRouteArgs(
            key: key,
            centerView: centerView,
          ),
        );

  static const String name = 'PortfolioLayoutPageRoute';
}

class PortfolioLayoutPageRouteArgs {
  const PortfolioLayoutPageRouteArgs({
    this.key,
    this.centerView,
  });

  final _i4.Key? key;

  final _i4.Widget? centerView;

  @override
  String toString() {
    return 'PortfolioLayoutPageRouteArgs{key: $key, centerView: $centerView}';
  }
}

/// generated route for
/// [_i2.ProjectView]
class ProjectViewRoute extends _i3.PageRouteInfo<ProjectViewRouteArgs> {
  ProjectViewRoute({
    required _i5.ProjectType projectType,
    _i4.Key? key,
  }) : super(
          ProjectViewRoute.name,
          path: '/project',
          args: ProjectViewRouteArgs(
            projectType: projectType,
            key: key,
          ),
        );

  static const String name = 'ProjectViewRoute';
}

class ProjectViewRouteArgs {
  const ProjectViewRouteArgs({
    required this.projectType,
    this.key,
  });

  final _i5.ProjectType projectType;

  final _i4.Key? key;

  @override
  String toString() {
    return 'ProjectViewRouteArgs{projectType: $projectType, key: $key}';
  }
}
