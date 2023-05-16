import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    this.centerView,
  }) : super(key: key);

  final Widget? centerView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.isMobile) {
          return _MobileScaffold(centerView: centerView);
        }
        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                  child: AdaptiveColumn(
                    children: [
                      AdaptiveContainer(
                        columnSpan: 12,
                        child: const NavigationMenuBar(),
                      ),
                      AdaptiveContainer(
                        columnSpan: 12,
                        child: CenteredView(
                          child: Column(
                            children: [
                              centerView ?? const HomeView(),
                              const StyledWebFooter()
                            ],
                          ),
                        ),
                      )
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: Insets.xl),
                  child: LightDarkToggleSwitch(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MobileScaffold extends StatelessWidget {
  const _MobileScaffold({
    Key? key,
    this.centerView,
  }) : super(key: key);

  final Widget? centerView;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: const StyledNavigationDrawer(),
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
                centerView ?? const HomeView(),
                const StyledMobileFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FollowMouseContainer extends HookWidget {
  const FollowMouseContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final mousePosition = useState<Offset>(Offset.zero);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return MouseRegion(
          onHover: (event) {
            mousePosition.value = event.localPosition;
          },
          onExit: (event) {
            mousePosition.value = Offset.zero;
          },
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              // Only apply rotation if mouse is not at default position
              ..rotateX(mousePosition.value == Offset.zero
                  ? 0
                  : (constraints.maxHeight / 2 - mousePosition.value.dy) /
                      constraints.maxHeight /
                      3)
              ..rotateY(mousePosition.value == Offset.zero
                  ? 0
                  : -(constraints.maxWidth / 2 - mousePosition.value.dx) /
                      constraints.maxWidth /
                      3),
            alignment: FractionalOffset.center,
            child: child,
          ),
        );
      },
    );
  }
}
