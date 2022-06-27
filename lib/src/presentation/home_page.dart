import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/presentation/widgets/centered_view.dart';
import 'package:freeman_portfolio/src/presentation/widgets/custom_animated_opacity.dart';
import 'package:freeman_portfolio/src/presentation/widgets/custom_animated_project_tile.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';

import '../shared/styles.dart';
import 'widgets/animated_header.dart';
import 'widgets/light_dark_toggle_switch.dart';
import 'widgets/navigation_drawer.dart';
import 'widgets/navigation_menu_bar.dart';
import 'widgets/social_media_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final theme = Theme.of(context).colorScheme;

        if (constraints.isMobile) {
          return Scaffold(
            drawer: const NavigationDrawer(),
            body: SingleChildScrollView(
              child: Column(
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
                  )
                ],
              ),
            ),
          );
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
                              const AnimatedHeader(),
                              const SizedBox(height: 150),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 465,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const VSpace(size: 40),
                                  const CustomAnimatedProjectTile()
                                ],
                              ),
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
