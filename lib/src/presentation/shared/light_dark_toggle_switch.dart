import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers.dart';
import '../../shared/styles.dart';
import 'scroll_to_top_widget.dart';

class LightDarkToggleSwitch extends StatelessWidget {
  const LightDarkToggleSwitch({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    buildToggleSwitchWidgets(BoxConstraints constraints) {
      return [
        _AnimatedSlider(constraints),
        const SizedBox(height: Insets.m),
        ScrollToTopWidget(scrollController: scrollController),
      ];
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
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
        quarterTurns: 3,
        child: GestureDetector(
          onTap: () => ref.read(themeProvider.notifier).toggleTheme(),
          child: AnimatedContainer(
            height: 24,
            width: 92,
            duration: animationDuration,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: themeState.isDark
                  ? const Color(0xFF4A4653)
                  : theme.onBackground.withOpacity(0.4),
            ),
            child: AnimatedAlign(
              duration: animationDuration,
              alignment: themeState.isDark
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                height: 25,
                width: 64,
                decoration: BoxDecoration(
                  color: themeState.isDark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(Insets.m),
                ),
                child: Center(
                  child: Text(
                    themeState.isDark ? 'Dark 🌙' : ' Light 🔅',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color:
                              themeState.isDark ? Colors.white : Colors.black,
                        ),
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
