import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/widgets/fade_through_transition_switcher.dart';

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
