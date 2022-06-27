import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../shared/styles.dart';
import 'custom_animated_opacity.dart';

class NavigationMenuBar extends StatelessWidget {
  const NavigationMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CustomAnimatedOpacity(child:FlutterLogo(size: 80)),
        const Spacer(),
        NavigationWebMenu(
          menuItems: [
            NavigationBarItem(
              'HOME',
              () {},
            ),
            NavigationBarItem(
              'ABOUT',
              () {},
            ),
            NavigationBarItem(
              'PROJECTS',
              () {},
            ),
            NavigationBarItem(
              'CONTACT',
              () {},
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
                  menuItem.onPress,
                  isHovered: hoverController.value,
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
    this.title,
    this.onPress, {
    super.key,
    this.isHovered = false,
  });

  final String title;
  final VoidCallback onPress;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
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
        onPressed: onPress,
        child: Text(title, style: TextStyles.title1),
      ),
    );
  }
}
