import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/presentation/home/custom_animated_opacity.dart';

import '../../shared/styles.dart';
import '../shared/project_preview_dialog.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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

    return MouseRegion(
      onEnter: (_) => hoverController.value = true,
      onExit: (_) => hoverController.value = false,
      child: GestureDetector(
        onTap: () => _showAnimatedProjectDialog(context),
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

  Future<Dialog?> _showAnimatedProjectDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      transitionDuration: kThemeAnimationDuration * 2,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const ProjectPreviewDialog();
      },
    );
  }
}
