import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/presentation/about/about_view.dart';
import 'package:freeman_portfolio/src/presentation/contact/contact_view.dart';
import 'package:freeman_portfolio/src/presentation/home/custom_animated_opacity.dart';
import 'package:freeman_portfolio/src/presentation/project/projects_view.dart';
import 'package:freeman_portfolio/src/presentation/shared/logo.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styled_divider.dart';
import '../../shared/styles.dart';
import '../home/home_view.dart';

class NavigationMenuBar extends StatelessWidget {
  const NavigationMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double maxWidthPercentage = 0.8;
    double screenWidth = MediaQuery.sizeOf(context).width;
    double maxWidth = screenWidth * maxWidthPercentage;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: const Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAnimatedOpacity(child: Logo()),
              StyledDivider(
                padding: EdgeInsets.symmetric(vertical: Insets.l),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: NavigationWebMenu(
                    menuItems: [
                      NavigationBarItem(
                        'HOME',
                        centerView: HomeView(),
                      ),
                      NavigationBarItem(
                        'PROJECTS',
                        centerView: ProjectsView(),
                      ),
                      NavigationBarItem(
                        'CONTACT',
                        centerView: ContactView(),
                      ),
                      NavigationBarItem(
                        'ABOUT',
                        centerView: AboutView(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationWebMenu extends HookWidget {
  const NavigationWebMenu({
    Key? key,
    required this.menuItems,
  }) : super(key: key);

  final List<NavigationBarItem> menuItems;

  @override
  Widget build(BuildContext context) {
    var hoverController = useState(false);

    return MouseRegion(
      onEnter: (_) => hoverController.value = true,
      onExit: (_) => hoverController.value = false,
      child: Row(
        children: [
          ...menuItems
              .map(
                (menuItem) => NavigationBarItem(
                  menuItem.title,
                  centerView: menuItem.centerView,
                  isHovered: hoverController.value,
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class NavigationBarItem extends ConsumerWidget {
  const NavigationBarItem(
    this.title, {
    super.key,
    required this.centerView,
    this.isHovered = false,
  });

  final String title;
  final Widget centerView;
  final bool isHovered;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

    return TextButton(
      style: ButtonStyle(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return theme.secondary;
            }
            return isHovered
                ? theme.secondary.withOpacity(0.5)
                : theme.secondary;
          },
        ),
      ),
      onPressed: () => ref.read(appRouterProvider).pushAndPopUntil(
            PortfolioLayoutRoute(centerView: centerView),
            predicate: (_) => false,
          ),
      child: Text(title, style: TextStyles.title1),
    );
  }
}
