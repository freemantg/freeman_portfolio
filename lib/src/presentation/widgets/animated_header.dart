import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class AnimatedHeader extends StatelessWidget {
  const AnimatedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          "I'm Freeman.\nhere is my flutter",
          textAlign: TextAlign.center,
          style: TextStyles.h1,
        ),
        DefaultTextStyle(
          style: TextStyles.h1.copyWith(color: theme.onBackground),
          child: AnimatedTextKit(
            pause: const Duration(milliseconds: 1000),
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'journey.',
                cursor: '|',
                speed: kThemeAnimationDuration * 2,
                curve: Curves.bounceInOut,
              )
            ],
          ),
        ),
      ],
    );
  }
}
