import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';

import '../shared/styles.dart';
import 'shared/information_tile.dart';
import 'shared/centered_view.dart';
import 'shared/light_dark_toggle_switch.dart';
import 'shared/navigation_drawer.dart';
import 'shared/navigation_menu_bar.dart';
import 'shared/social_media_bar.dart';
import 'widgets/home/home_view.dart';

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
          return const _MobileScaffold();
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
                              _buildFooter(),
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

  Widget _buildFooter() {
    return Column(
      children: [
        const HSpace(size: 120),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Flexible(
              child: InformationTile(
                header: 'Location',
                title: 'I work remotely,\nbased in London',
              ),
            ),
            Spacer(),
            Flexible(
              child: InformationTile(
                header: 'Contact',
                title: 'Let\'s get in touch',
                subtitle: 'freeman.khe.tang@gmail.com',
              ),
            ),
            Spacer(),
          ],
        ),
        const HSpace(size: 80),
        const Divider(),
        const HSpace(size: Insets.l),
        Row(
          children: [
            Flexible(
              child: Text(
                "© 2022, FREEMAN. This portfolio is made from Flutter . ",
                style: TextStyles.body1,
              ),
            ),
            const Icon(FontAwesomeIcons.githubAlt),
            const Spacer(),
            Text(
              'All rights reserved.',
              style: TextStyles.body1,
            )
          ],
        ),
      ],
    );
  }
}

class _MobileScaffold extends StatelessWidget {
  const _MobileScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

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
}
