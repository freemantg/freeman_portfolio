import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/presentation/about/about_view.dart';
import 'package:freeman_portfolio/src/presentation/contact/contact_view.dart';
import 'package:freeman_portfolio/src/presentation/home/home_view.dart';
import 'package:freeman_portfolio/src/presentation/project/projects_view.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styles.dart';

class StyledMobileNavigationDrawer extends StatelessWidget {
  const StyledMobileNavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: width,
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Insets.l,
                Insets.l,
                Insets.l,
                0,
              ),
              child: Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () => Scaffold.of(context).closeDrawer(),
                    icon: const Icon(Icons.close),
                  );
                },
              ),
            ),
            const Row(
              children: [
                Spacer(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavigationDrawerItem(
                        title: 'Home',
                        centerView: HomeView(),
                      ),
                      NavigationDrawerItem(
                        title: 'Projects',
                        centerView: ProjectsView(),
                      ),
                      NavigationDrawerItem(
                        title: 'Contact',
                        centerView: ContactView(),
                      ),
                      NavigationDrawerItem(
                        title: 'About',
                        centerView: AboutView(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
        style: TextStyles.title1Mobile,
      ),
      onTap: () => ref.read(appRouterProvider).pushAndPopUntil(
            PortfolioLayoutRoute(centerView: centerView),
            predicate: (_) => false,
          ),
    );
  }
}
