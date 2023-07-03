import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';

import '../shared/styles.dart';
import 'home/home_view.dart';
import 'shared/centered_view.dart';
import 'shared/light_dark_toggle_switch.dart';
import 'shared/navigation_drawer.dart';
import 'shared/navigation_menu_bar.dart';
import 'shared/social_media_bar.dart';
import 'shared/styled_footer.dart';

class PortfolioLayoutPage extends StatelessWidget {
  const PortfolioLayoutPage({
    Key? key,
    required this.centerView,
  }) : super(key: key);

  final Widget centerView;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.isMobile) {
          return _MobileScaffold(centerView: centerView);
        } else {
          return _DesktopScaffold(
            scrollController: scrollController,
            centerView: centerView,
          );
        }
      },
    );
  }
}

class HomeLayoutPage extends StatelessWidget {
  const HomeLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PortfolioLayoutPage(centerView: HomeView());
  }
}

class _DesktopScaffold extends StatelessWidget {
  const _DesktopScaffold({
    required this.scrollController,
    required this.centerView,
  });

  final ScrollController scrollController;
  final Widget centerView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
              child: Column(
                children: [
                  const NavigationMenuBar(),
                  CenteredView(child: centerView),
                  const StyledWebFooter()
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: Insets.xl),
              child: SocialMediaBar(),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: Insets.xl),
              child: LightDarkToggleSwitch(scrollController: scrollController),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileScaffold extends StatelessWidget {
  const _MobileScaffold({
    Key? key,
    required this.centerView,
  }) : super(key: key);

  final Widget centerView;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: const StyledMobileNavigationDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Insets.l, Insets.l, Insets.l, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: theme.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ),
                const HSpace(size: 80.0),
                centerView,
                const StyledMobileFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
