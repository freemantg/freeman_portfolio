import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/widgets/centered_view.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';

import '../shared/styles.dart';
import 'widgets/animated_header.dart';
import 'widgets/custom_animated_project_tile.dart';
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
                              (constraints.isDesktop)
                                  ? _buildDesktopLayout(constraints)
                                  : _buildTabletLayout(constraints),
                              const HSpace(size: 120),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Flexible(
                                    child: InformationTile(
                                      header: 'Location',
                                      title:
                                          'I work remotely,\nbased in London',
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

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 100,
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
            const VSpace(size: 40),
            Flexible(
              flex: 47,
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
          ],
        ),
        const HSpace(size: 40),
        Row(
          children: [
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
            const VSpace(size: 40),
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
            const VSpace(size: 40),
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
          ],
        )
      ],
    );
  }

  _buildTabletLayout(BoxConstraints constraints) {
    return Column(
      children: [
        ...List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: CustomAnimatedProjectTile(constraints: constraints),
          ),
        )
      ],
    );
  }
}

class InformationTile extends StatelessWidget {
  const InformationTile({
    Key? key,
    required this.header,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  final String header;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyles.title1,
        ),
        const HSpace(size: Insets.m),
        Text(
          title,
          style: TextStyles.body1.copyWith(height: 1.5),
        ),
        if (subtitle != null)
          SelectableText(
            subtitle!,
            style: TextStyles.body1
                .copyWith(fontWeight: FontWeight.w400, height: 1.5),
          ),
      ],
    );
  }
}
