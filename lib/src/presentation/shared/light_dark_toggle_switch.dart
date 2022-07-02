import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers.dart';
import '../../shared/styles.dart';

class LightDarkToggleSwitch extends HookConsumerWidget {
  const LightDarkToggleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;

    var isEnabled = useState(true);
    const animationDuration = Duration(milliseconds: 300);
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
              onTap: () {
                isEnabled.value = !isEnabled.value;
                ref.read(themeProvider.notifier).toggleTheme();
              },
              child: AnimatedContainer(
                height: 24,
                width: 54,
                duration: animationDuration,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isEnabled.value
                      ? theme.onBackground.withOpacity(0.1)
                      : theme.secondary,
                ),
                child: AnimatedAlign(
                  duration: animationDuration,
                  alignment: isEnabled.value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: isEnabled.value
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
        ),
        const Opacity(
          opacity: 0.8,
          child: FaIcon(FontAwesomeIcons.moon),
        ),
      ],
    );
  }
}
