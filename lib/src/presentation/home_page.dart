import 'package:adaptive_components/adaptive_components.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/presentation/widgets/light_dark_toggle_switch.dart';
import 'package:freeman_portfolio/src/presentation/widgets/navigation_menu_bar.dart';
import 'package:freeman_portfolio/src/presentation/widgets/social_media_bar.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';

import '../shared/styles.dart';
import 'widgets/navigation_drawer.dart';

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
                        child: Column(
                          children: [
                            const AnimatedHeader(),
                            Container(
                              width: 1340,
                              height: 250,
                              color: Colors.red,
                            ),
                          ],
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

class AnimatedHeader extends StatelessWidget {
  const AnimatedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          "I'm Freeman.\nflutter developer",
          textAlign: TextAlign.center,
          style: TextStyles.h1,
        ),
        DefaultTextStyle(
          style: TextStyles.h1.copyWith(color: theme.onBackground),
          child: AnimatedTextKit(
            pause: const Duration(seconds: 3),
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'portfolio',
                speed: kThemeAnimationDuration,
              )
            ],
          ),
        ),
      ],
    );
  }
}
