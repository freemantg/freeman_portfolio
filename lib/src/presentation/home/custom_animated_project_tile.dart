import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/project.dart';
import '../../shared/styles.dart';
import '../shared/project_preview_dialog.dart';

class CustomAnimatedProjectTile extends HookConsumerWidget {
  const CustomAnimatedProjectTile({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isHovered = useState(false);

    return isMobile
        ? GestureDetector(
            onTap: () {},
            child: _buildProjectTileContents(isHovered.value, project),
          )
        : MouseRegion(
            onEnter: (_) {
              isHovered.value = true;
            },
            onExit: (_) {
              isHovered.value = false;
            },
            onHover: (event) {},
            child: _buildProjectTileContents(isHovered.value, project),
          );
  }

  Widget _buildProjectTileContents(bool isHovered, Project project) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            const containerConstraints =
                BoxConstraints(maxWidth: 826, maxHeight: 394);

            return Container(
              constraints: containerConstraints,
              child: Stack(
                children: [
                  ScaledImage(
                    basePath: project.basePath,
                    borderRadius: BorderRadius.circular(Insets.m),
                    isHovered: isHovered,
                  ),
                  _buildContent(context, isHovered, project),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

Widget _buildContent(BuildContext context, bool isHovered, Project project) {
  if (isHovered) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          key: const ValueKey(
            'hoveredIcon',
          ), // Added key for AnimatedSwitcher
          icon: const FaIcon(FontAwesomeIcons.expand),
          color: Colors.white,
          onPressed: () => _showAnimatedDialog(context, project),
        ),
      ),
    );
  } else {
    return const SizedBox.shrink();
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

class ScaledImage extends StatelessWidget {
  final String basePath;
  final BorderRadius borderRadius;
  final bool isHovered;

  const ScaledImage({
    Key? key,
    required this.basePath,
    required this.borderRadius,
    required this.isHovered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: kThemeAnimationDuration,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: AssetImage(basePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
