import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/shared/styles.dart';

import '../../domain/project.dart';
import '../shared/project_preview_dialog.dart';

class CustomAnimatedProjectTile extends HookWidget {
  const CustomAnimatedProjectTile({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: GestureDetector(
          onTap: () => _showAnimatedDialog(context, project),
          child: _buildProjectTileContents(
            isHovered.value,
            project,
            colorScheme,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectTileContents(
    bool isHovered,
    Project project,
    ColorScheme colorScheme,
  ) {
    const aspectRatio = 340.8 / 530.25;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width / aspectRatio;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: isHovered ? project.hoverColor : Colors.transparent,
                image: isHovered
                    ? null
                    : DecorationImage(
                        image: AssetImage(project.basePath),
                        fit: BoxFit.cover,
                      ),
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                opacity: isHovered ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.all(Insets.l),
                  child: Text(
                    project.technicalDescription,
                    style: TextStyles.projectDescription,
                  ),
                ),
              ),
            ),
            const HSpace(size: Insets.l),
            ProjectTileTitle(
              project: project,
              isHovered: isHovered,
              colorScheme: colorScheme,
            ),
          ],
        );
      },
    );
  }
}

class ProjectTileTitle extends StatelessWidget {
  final Project project;
  final bool isHovered;
  final ColorScheme colorScheme;

  const ProjectTileTitle({
    super.key,
    required this.project,
    required this.isHovered,
    required this.colorScheme,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => _showAnimatedDialog(context, project),
      child: Row(
        children: [
          Text(
            project.title,
            style: TextStyles.title1.copyWith(
              fontSize: 21,
              decoration: TextDecoration.underline,
              color: isHovered ? colorScheme.secondary : colorScheme.primary,
            ),
          ),
          const VSpace(size: Insets.sm),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            opacity: isHovered ? 1 : 0,
            child: Center(
              child: Icon(
                Icons.arrow_forward,
                color: colorScheme.secondary,
                size: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<Dialog?> _showAnimatedDialog(BuildContext context, Project project) {
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
      return ProjectPreviewDialog(project);
    },
  );
}
