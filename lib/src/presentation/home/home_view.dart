import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';

import '../../shared/styles.dart';
import 'custom_animated_project_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          const _AnimatedHeader(),
          const SizedBox(height: 150),
          (constraints.isDesktop)
              ? _buildDesktopLayout(constraints)
              : _buildTabletLayout(constraints),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 100,
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
            const VSpace(size: 40),
            Flexible(
              flex: 47,
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
          ],
        ),
        const HSpace(size: 40),
        Row(
          children: [
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
            const VSpace(size: 40),
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
            const VSpace(size: 40),
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTabletLayout(BoxConstraints constraints) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: Insets.l),
      shrinkWrap: true,
      itemCount: ProjectType.values.length,
      itemBuilder: (context, index) => CustomAnimatedProjectTile(
        constraints: constraints,
        projectType: ProjectType.values[index],
      ),
    return Column(
      children: [
        ...List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: CustomAnimatedProjectTile(constraints: constraints),
          ),
        )
      ],
    );
  }
}

class _AnimatedHeader extends StatelessWidget {
  const _AnimatedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          "I'm Freeman.\nthis is my flutter",
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
                speed: kThemeAnimationDuration,
                curve: Curves.linear,
              )
            ],
          ),
        ),
      ],
    );
  }
}
