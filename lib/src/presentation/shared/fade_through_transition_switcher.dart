import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeThroughTransitionSwitcher extends StatelessWidget {
  const FadeThroughTransitionSwitcher({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: ((child, primaryAnimation, secondaryAnimation) {
        return SharedAxisTransition(
          transitionType: SharedAxisTransitionType.vertical,
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      }),
      child: child,
    );
  }
}
