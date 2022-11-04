import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/presentation/home/custom_animated_opacity.dart';
import 'package:freeman_portfolio/src/presentation/project/project_view.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/project.dart';
import '../../shared/styles.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...ProjectType.values.map(
          (project) => AnimatedProjectTitle(projectType: project),
        ),
        const Divider(),
      ],
    );
  }
}

class AnimatedProjectTitle extends HookConsumerWidget {
  const AnimatedProjectTitle({
    Key? key,
    required this.projectType,
  }) : super(key: key);

  final ProjectType projectType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = projects[projectType];

    final theme = Theme.of(context).colorScheme;
    final hoverController = useState(false);
           
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
                  project?.title ?? '',
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
                  hoverController.value ? '/Flutter' : '0${projectType.index}',
                  key: UniqueKey(),
                  style:
                      TextStyles.title2.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
