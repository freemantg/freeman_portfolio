import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/presentation/about/about_view.dart';
import 'package:freeman_portfolio/src/presentation/contact/contact_view.dart';
import 'package:freeman_portfolio/src/presentation/home/home_view.dart';
import 'package:freeman_portfolio/src/presentation/project/projects_view.dart';
import 'package:freeman_portfolio/src/presentation/shared/light_dark_toggle_switch.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styles.dart';
import 'social_media_bar.dart';

class StyledMobileNavigationDrawer extends StatelessWidget {
  const StyledMobileNavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  Insets.l,
                  Insets.l,
                  Insets.l,
                  0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () => Scaffold.of(context).closeDrawer(),
                        icon: const Icon(Icons.close),
                      );
                    },
                  ),
                ),
              ),
              const HSpace(size: Insets.l),
              const NavigationDrawerItem(
                title: 'HOME',
                centerView: HomeView(),
              ),
              const NavigationDrawerItem(
                title: 'PROJECTS',
                centerView: ProjectsView(),
              ),
              const NavigationDrawerItem(
                title: 'CONTACT',
                centerView: ContactView(),
              ),
              const NavigationDrawerItem(
                title: 'ABOUT',
                centerView: AboutView(),
              ),
              const Spacer(),
              const Center(child: LightDarkToggleSwitch()),
              const HSpace(size: Insets.l),
            ],
          ),
        ),
        const SocialMediaBar(),
      ],
    );
  }
}

class NavigationDrawerItem extends ConsumerWidget {
  const NavigationDrawerItem({
    Key? key,
    required this.title,
    required this.centerView,
  }) : super(key: key);

  final String title;
  final Widget centerView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        title,
        style: TextStyles.title2,
      ),
      onTap: () => ref.read(appRouterProvider).pushAndPopUntil(
            PortfolioLayoutPageRoute(centerView: centerView),
            predicate: (_) => false,
          ),
    );
  }
}
