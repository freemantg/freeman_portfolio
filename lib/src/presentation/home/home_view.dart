import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/domain/project.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers.dart';
import '../../shared/styles.dart';
import '../shared/styled_circle_progress_indicator.dart';
import 'custom_animated_project_tile.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          const _AnimatedHeader(),
          const SizedBox(height: 100),
          Consumer(
            builder: (context, ref, child) {
              final projectState = ref.watch(projectsProvider);
              return projectState.maybeWhen(
                loadSuccess: (projects) {
                  return (constraints.isDesktop)
                      ? _buildDesktopLayout(context, projects)
                      : _buildTabletLayout(projects);
                },
                orElse: () => const StyledCircleProgressIndicator(),
              );
            },
          ),
        ],
      );
    });
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    Map<ProjectType, Project> projects,
  ) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 100,
                  child: CustomAnimatedProjectTile(
                    project: projects[ProjectType.ricedrop] ?? Project.empty(),
                  ),
                ),
                const VSpace(size: 40),
                Flexible(
                  flex: 47,
                  child: CustomAnimatedProjectTile(
                    project: projects[ProjectType.glum] ?? Project.empty(),
                  ),
                ),
              ],
            ),
            const HSpace(size: 40),
            Row(
              children: [
                Flexible(
                  flex: 100,
                  child: CustomAnimatedProjectTile(
                    project: projects[ProjectType.inky] ?? Project.empty(),
                  ),
                ),
                const VSpace(size: 40),
                Flexible(
                  flex: 47,
                  child: CustomAnimatedProjectTile(
                    project:
                        projects[ProjectType.githubOAuth] ?? Project.empty(),
                  ),
                ),
              ],
            ),
            const HSpace(size: 40),
            Row(
              children: [
                Expanded(
                  child: CustomAnimatedProjectTile(
                    project: projects[ProjectType.inky] ?? Project.empty(),
                  ),
                ),
                const VSpace(size: 40),
                Expanded(
                  child: CustomAnimatedProjectTile(
                    project: projects[ProjectType.glum] ?? Project.empty(),
                  ),
                ),
                const VSpace(size: 40),
                Expanded(
                  child: CustomAnimatedProjectTile(
                    project: projects[ProjectType.crackd] ?? Project.empty(),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

// Widget _buildFloatingProjectDescription(
//   BuildContext context,
//   ProjectType projectType,
//   ValueNotifier<Offset> mouseRegionPos,
// ) {
//   return Positioned(
//     left: mouseRegionPos.value.dx - 25,
//     top: mouseRegionPos.value.dy + 25,
//     child: Container(
//       padding: const EdgeInsets.all(10.0),
//       color: Colors.black.withOpacity(0.5),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             projectType.title,
//             style: TextStyles.h3.copyWith(color: Colors.white),
//           ),
//           Text(
//             projectType.shortDescription,
//             style: TextStyles.title1.copyWith(color: Colors.white),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget _buildTabletLayout(Map<ProjectType, Project> projects) {
  return ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    separatorBuilder: (_, __) => const SizedBox(height: Insets.l),
    shrinkWrap: true,
    itemCount: ProjectType.values.length,
    itemBuilder: (context, index) => CustomAnimatedProjectTile(
      project: projects[ProjectType.values[index]] ?? Project.empty(),
    ),
  );
}

class _AnimatedHeader extends HookWidget {
  const _AnimatedHeader();

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

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
