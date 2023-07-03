import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/domain/project.dart';
import 'package:freeman_portfolio/src/presentation/home/next_page_widget.dart';
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
      return Consumer(
        builder: (context, ref, child) {
          final projectState = ref.watch(projectsProvider);
          return projectState.maybeWhen(
            loadSuccess: (projects) {
              return (constraints.isDesktop)
                  ? _buildDesktopLayout(
                      context,
                      projects,
                    )
                  : _buildTabletLayout(projects);
            },
            orElse: () => const StyledCircleProgressIndicator(),
          );
        },
      );
    });
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    Map<ProjectType, Project> projects,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: FractionallySizedBox(
        widthFactor: 0.80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSpace(size: 50.0),
            const _AnimatedHeader(),
            const HSpace(size: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAnimatedProjectTile(
                  project: projects[ProjectType.ricedrop] ?? Project.empty(),
                ),
                const VSpace(size: 24.0),
                CustomAnimatedProjectTile(
                  project: projects[ProjectType.githubOAuth] ?? Project.empty(),
                ),
                const VSpace(size: 24.0),
                CustomAnimatedProjectTile(
                  project: projects[ProjectType.inky] ?? Project.empty(),
                ),
              ],
            ),
            const HSpace(size: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAnimatedProjectTile(
                  project: projects[ProjectType.flutterweb] ?? Project.empty(),
                ),
                const VSpace(size: 24.0),
                CustomAnimatedProjectTile(
                  project: projects[ProjectType.glum] ?? Project.empty(),
                ),
                const VSpace(size: 24.0),
                CustomAnimatedProjectTile(
                  project: projects[ProjectType.crackd] ?? Project.empty(),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const NextPageWidget()
          ],
        ),
      ),
    );
  }
}

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

    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: "Transforming concepts into\ncrafted apps. ",
            style: TextStyles.h0,
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: FadeTransition(
              opacity: animationController,
              child: Text(
                "|",
                style: TextStyles.h0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
