import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../shared/styles.dart';

class CustomAnimatedOpacity extends HookWidget {
  const CustomAnimatedOpacity({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var hoverController = useState(false);
    return MouseRegion(
      onEnter: (_) => hoverController.value = true,
      onExit: (_) => hoverController.value = false,
      child: AnimatedOpacity(
        opacity: hoverController.value ? 0.5 : 1,
        duration: kThemeAnimationDuration,
        child: child,
      ),
    );
  }
}

class CustomAnimatedIconColor extends HookWidget {
  const CustomAnimatedIconColor({
    required this.iconData,
    Key? key,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    var hoverController = useState(false);
    return MouseRegion(
      onEnter: (_) => hoverController.value = true,
      onExit: (_) => hoverController.value = false,
      child: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: Container(
          decoration: hoverController.value
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(Insets.m),
                  color: theme.primary.withOpacity(0.1),
                )
              : null,
          child: IconButton(
            icon: Icon(iconData),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class CustomAnimationSlider extends StatelessWidget {
  const CustomAnimationSlider({
    super.key,
    required this.hoverController,
    required this.child,
  });

  final ValueNotifier<bool> hoverController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      duration: kThemeAnimationDuration,
      transitionBuilder: ((child, animation) => SlideTransition(
            position: Tween<Offset>(
              begin: animation.isCompleted
                  ? const Offset(1, 0)
                  : const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          )),
      child: child,
    );
  }
}
