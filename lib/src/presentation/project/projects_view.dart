import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/presentation/home/custom_animated_opacity.dart';
import 'package:freeman_portfolio/src/presentation/project/project_view.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../shared/styles.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...ProjectType.values.map(
          (project) => AnimatedProjectTitle(projectType: project),
        ),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AnimatedProjectTitle(
          title: 'Be:Mind',
          subtitle: 'Flutter',
          projectNumber: '01',
        ),
        HSpace(size: Insets.xl),
        AnimatedProjectTitle(
          title: 'Indigo',
          subtitle: 'Flutter',
          projectNumber: '02',
        ),
        HSpace(size: Insets.xl),
        AnimatedProjectTitle(
          title: 'Pomodoro',
          subtitle: 'Flutter',
          projectNumber: '03',
        ),
        HSpace(size: Insets.xl),
        AnimatedProjectTitle(
          title: 'Github Viewer',
          subtitle: 'Flutter',
          projectNumber: '04',
        ),
        HSpace(size: Insets.xl),
        AnimatedProjectTitle(
          title: 'Squigado',
          subtitle: 'Flutter',
          projectNumber: '05',
        ),
        HSpace(size: Insets.xl),
        Divider()
      ],
    );
  }
}

class AnimatedProjectTitle extends HookWidget {
  const AnimatedProjectTitle({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.projectNumber,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String projectNumber;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final hoverController = useState(false);

    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.only(bottom: Insets.xl),
        child: MouseRegion(
          onEnter: (_) => hoverController.value = true,
          onExit: (_) => hoverController.value = false,
          child: GestureDetector(
            onTap: () => ref.read(appRouterProvider).push(
                  PortfolioLayoutPageRoute(
                    centerView: ProjectView(projectType),
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
                    project?.title ?? '',
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
                        ? '/Flutter'
                        : '0${projectType.index + 1}',
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

    return MouseRegion(
      onEnter: (_) => hoverController.value = true,
      onExit: (_) => hoverController.value = false,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: kThemeAnimationDuration,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: Text(
                title,
                key: UniqueKey(),
                style: hoverController.value
                    ? TextStyles.projectTitle.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = theme.primary,
                      )
                    : TextStyles.projectTitle,
              ),
            ),
            const VSpace(size: Insets.m),
            CustomAnimationSlider(
              hoverController: hoverController,
              child: Text(
                hoverController.value ? '/ $subtitle' : projectNumber,
                key: UniqueKey(),
                style: TextStyles.title1.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
