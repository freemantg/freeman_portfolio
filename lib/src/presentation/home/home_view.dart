import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/domain/project.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styles.dart';
import 'custom_animated_project_tile.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          const _AnimatedHeader(),
          const SizedBox(height: 100),
          (constraints.isDesktop)
              ? _buildDesktopLayout(context)
              : _buildTabletLayout(),
        ],
      );
    });
  }

  Widget _buildDesktopLayout(
    BuildContext context,
  ) {
    return const Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 100,
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.ricedrop,
                  ),
                ),
                VSpace(size: 40),
                Flexible(
                  flex: 47,
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.glum,
                  ),
                ),
              ],
            ),
            HSpace(size: 40),
            Row(
              children: [
                Flexible(
                  flex: 100,
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.inky,
                  ),
                ),
                VSpace(size: 40),
                Flexible(
                  flex: 47,
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.githubOAuth,
                  ),
                ),
              ],
            ),
            HSpace(size: 40),
            Row(
              children: [
                Expanded(
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.inky,
                  ),
                ),
                VSpace(size: 40),
                Expanded(
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.glum,
                  ),
                ),
                VSpace(size: 40),
                Expanded(
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.crackd,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildFloatingProjectDescription(
    BuildContext context,
    ProjectType projectType,
    ValueNotifier<Offset> mouseRegionPos,
  ) {
    return Positioned(
      left: mouseRegionPos.value.dx - 25,
      top: mouseRegionPos.value.dy + 25,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              projectType.title,
              style: TextStyles.h3.copyWith(color: Colors.white),
            ),
            Text(
              projectType.shortDescription,
              style: TextStyles.title1.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: Insets.l),
      shrinkWrap: true,
      itemCount: ProjectType.values.length,
      itemBuilder: (context, index) => CustomAnimatedProjectTile(
        projectType: ProjectType.values[index],
      ),
    );
  }
}

class _AnimatedHeader extends HookWidget {
  const _AnimatedHeader();

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    useEffect(() {
      return animationController.dispose;
    }, const []);

    return FractionallySizedBox(
      widthFactor: 0.5,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: "Transforming Concepts into Crafted Apps. ",
              style: TextStyles.h2,
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: FadeTransition(
                opacity: animationController,
                child: Text(
                  "|",
                  style: TextStyles.h2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
