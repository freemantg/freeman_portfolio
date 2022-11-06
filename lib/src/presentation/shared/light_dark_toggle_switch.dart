import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers.dart';
import '../../shared/styles.dart';

class LightDarkToggleSwitch extends StatelessWidget {
  const LightDarkToggleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildToggleSwitchWidgets(BoxConstraints constraints) {
      return [
        const Opacity(
          opacity: 0.8,
          child: Icon(Icons.wb_sunny_outlined),
        ),
        _AnimatedSlider(constraints),
        const Opacity(
          opacity: 0.8,
          child: FaIcon(FontAwesomeIcons.moon),
        ),
      ];
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return (!constraints.isMobile)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: buildToggleSwitchWidgets(constraints),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: buildToggleSwitchWidgets(constraints),
              );
      },
    );
  }
}

class _AnimatedSlider extends ConsumerWidget {
  const _AnimatedSlider(this.constraints);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final themeState = ref.watch(themeProvider);

    const animationDuration = Duration(milliseconds: 300);

    return Padding(
      padding: const EdgeInsets.all(Insets.sm),
      child: RotatedBox(
        quarterTurns: !constraints.isMobile ? 3 : 0,
        child: GestureDetector(
          onTap: () => ref.read(themeProvider.notifier).toggleTheme(),
          child: AnimatedContainer(
            height: 18,
            width: 54,
            duration: animationDuration,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: themeState.isDark
                  ? theme.secondary
                  : theme.onBackground.withOpacity(0.1),
            ),
            child: AnimatedAlign(
              duration: animationDuration,
              alignment: !constraints.isMobile
                  ? themeState.isDark
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Opacity(
          opacity: 0.8,
          child: Icon(Icons.wb_sunny_outlined),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Insets.sm),
          child: RotatedBox(
            quarterTurns: 3,
            child: GestureDetector(
              onTap: () => ref.read(themeProvider.notifier).toggleTheme(),
              child: AnimatedContainer(
                height: 24,
                width: 54,
                duration: animationDuration,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: themeState.isDark
                      ? theme.secondary
                      : theme.onBackground.withOpacity(0.1),
                ),
                child: AnimatedAlign(
                  duration: animationDuration,
                  alignment: themeState.isDark
                      ? Alignment.centerLeft
                      : Alignment.centerRight
                  : themeState.isDark
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: themeState.isDark
                        ? theme.onBackground.withOpacity(0.5)
                        : theme.onBackground,
                    borderRadius: BorderRadius.circular(Insets.m),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
