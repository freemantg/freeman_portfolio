import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styles.dart';
import '../home/custom_animated_opacity.dart';
import '../home/home_view.dart';


class NavigationMenuBar extends StatelessWidget {
  const NavigationMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CustomAnimatedOpacity(child: FlutterLogo(size: 80)),
        Spacer(),
        NavigationWebMenu(
          menuItems: [
            NavigationBarItem(
              'HOME',
              centerView: HomeView(),
            ),
            NavigationBarItem(
              'ABOUT',
              centerView: Text('About'),
            ),
            NavigationBarItem(
              'PROJECTS',
              centerView: Text('Projects'),
            ),
            NavigationBarItem(
              'CONTACT',
              centerView: Text('Contact'),
            ),
          ],
        )
      ],
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

    return Padding(
      padding: const EdgeInsets.only(left: Insets.xl),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return theme.secondary;
              }
              return isHovered ? theme.primary.withOpacity(0.5) : theme.primary;
            },
          ),
        ),
        onPressed: () => ref.read(appRouterProvider).pushAndPopUntil(
              PortfolioLayoutPageRoute(centerView: centerView),
              predicate: (_) => false,
            ),
        child: Text(title, style: TextStyles.title1),
      ),
    );
  }
}
