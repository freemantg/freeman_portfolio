import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/domain/project.dart';
import 'package:freeman_portfolio/src/presentation/home/next_page_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers.dart';
import '../../shared/styles.dart';
import '../shared/styled_circle_progress_indicator.dart';
import 'custom_animated_project_tile.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Consumer(
      builder: (context, ref, child) {
        final projectState = ref.watch(projectsProvider);
        return projectState.maybeWhen(
          loadSuccess: (projects) {
            if (screenWidth < 600) {
              return _buildMobileLayout(projects);
            } else if (screenWidth >= 600 && screenWidth < 1024) {
              return _buildTabletLayout(projects);
            } else {
              return _buildDesktopLayout(context, projects);
            }
          },
          orElse: () => const StyledCircleProgressIndicator(),
        );
      },
    );
  }

  Widget _buildMobileLayout(Map<ProjectType, Project> projects) {
    const projectRows = [
      [ProjectType.ricedrop, ProjectType.githubOAuth],
      [ProjectType.inky, ProjectType.flutterweb],
      [ProjectType.glum, ProjectType.crackd]
    ];

    return Column(
      children: [
        const _AnimatedHeader(),
        const HSpace(size: 56.0),
        for (var i = 0; i < projectRows.length; i++) ...[
          ProjectsRow(
            projects: projects,
            projectsToShow: projectRows[i],
            isMobile: true,
          ),
          if (i != projectRows.length - 1) const HSpace(size: 24),
        ],
        const SizedBox(height: 50),
        const NextPageWidget()
      ],
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    Map<ProjectType, Project> projects,
  ) {
    const projectRows = [
      [ProjectType.ricedrop, ProjectType.githubOAuth, ProjectType.inky],
      [ProjectType.flutterweb, ProjectType.glum, ProjectType.crackd],
    ];

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
            for (var i = 0; i < projectRows.length; i++) ...[
              ProjectsRow(
                projects: projects,
                projectsToShow: projectRows[i],
              ),
              if (i != projectRows.length - 1) const HSpace(size: 40),
            ],
            const SizedBox(height: 50),
            const NextPageWidget()
          ],
        ),
      ),
    );
  }
}

class ProjectsRow extends StatelessWidget {
  const ProjectsRow({
    Key? key,
    required this.projects,
    required this.projectsToShow,
    this.isMobile = false,
  }) : super(key: key);

  final Map<ProjectType, Project> projects;
  final List<ProjectType> projectsToShow;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < projectsToShow.length; i++) ...[
          CustomAnimatedProjectTile(
            project: projects[projectsToShow[i]],
          ),
          if (i != projectsToShow.length - 1) VSpace(size: isMobile ? 12 : 24),
        ],
      ],
    );
  }
}

Widget _buildTabletLayout(Map<ProjectType, Project> projects) {
  const projectRows = [
    [ProjectType.ricedrop, ProjectType.githubOAuth],
    [ProjectType.inky, ProjectType.flutterweb],
    [ProjectType.glum, ProjectType.crackd]
  ];

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
          for (var i = 0; i < projectRows.length; i++) ...[
            ProjectsRow(
              projects: projects,
              projectsToShow: projectRows[i],
            ),
            if (i != projectRows.length - 1) const HSpace(size: 40),
          ],
          const SizedBox(height: 50),
          const NextPageWidget()
        ],
      ),
    ),
  );
}

class _AnimatedHeader extends StatelessWidget {
  const _AnimatedHeader();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text:
                // "Transforming concepts into${screenWidth > 600 ? "\ncrafted apps. " : " crafted apps. "}",
                "Coding it all – Flutter apps, bug fixes, and everything in between.",
            style: screenWidth > 600 ? TextStyles.h0 : TextStyles.h0Mobile,
          ),
        ],
      ),
    );
  }
}
