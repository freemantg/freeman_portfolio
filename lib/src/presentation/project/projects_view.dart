import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/presentation/home/custom_animated_opacity.dart';
import 'package:freeman_portfolio/src/presentation/project/project_view.dart';
import 'package:freeman_portfolio/src/presentation/shared/styled_circle_progress_indicator.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/project.dart';
import '../../shared/styles.dart';

class ProjectsView extends ConsumerWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectsProvider);
    return projectState.maybeWhen(
      loadSuccess: (projects) {
        return ListView(
          shrinkWrap: true,
          children: ProjectType.values.map((projectType) {
            return AnimatedProjectTitle(
              project: projects[projectType] ?? Project.empty(),
              index: projectType.index,
            );
          }).toList(),
        );
      },
      orElse: () => const StyledCircleProgressIndicator(),
    );
  }
}

class AnimatedProjectTitle extends HookConsumerWidget {
  const AnimatedProjectTitle({
    Key? key,
    required this.project,
    required this.index,
  }) : super(key: key);

  final Project project;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final hoverController = useState(false);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(bottom: Insets.xl),
          child: MouseRegion(
            onEnter: (_) => hoverController.value = true,
            onExit: (_) => hoverController.value = false,
            child: GestureDetector(
              onTap: () => ref.read(appRouterProvider).push(
                    PortfolioLayoutPageRoute(
                      centerView: ProjectView(project),
                    ),
                  ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedSwitcher(
                    duration: kThemeAnimationDuration,
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: child,
                      ),
                    ),
                    child: Text(
                      project.title,
                      key: UniqueKey(),
                      style: hoverController.value
                          ? (constraints.isMobile
                                  ? TextStyles.projectTitleMobile
                                  : TextStyles.projectTitle)
                              .copyWith(
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1
                                ..color = theme.primary,
                            )
                          : constraints.isMobile
                              ? TextStyles.projectTitleMobile
                              : TextStyles.projectTitle,
                    ),
                  ),
                  CustomAnimationSlider(
                    hoverController: hoverController,
                    child: Text(
                      hoverController.value
                          ? '/${project.shortDescription}'
                          : '0${index + 1}',
                      key: UniqueKey(),
                      style: TextStyles.title2.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
