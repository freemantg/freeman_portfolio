import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../domain/project.dart';
import '../../shared/styles.dart';
import '../shared/project_preview_dialog.dart';

class CustomAnimatedProjectTile extends HookWidget {
  const CustomAnimatedProjectTile({
    Key? key,
    required this.projectType,
    required this.onHover,
    required this.onHoverMove,
    required this.stackKey,
  }) : super(key: key);

  final ProjectType projectType;
  final Function(ProjectType?) onHover;
  final Function(Offset) onHoverMove;
  final GlobalKey stackKey;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final hoverController = useState(false);

    return isMobile
        ? GestureDetector(
            onTap: () => onHover,
            child: _buildProjectTileContents(hoverController.value),
          )
        : MouseRegion(
            onEnter: (_) {
              onHover(projectType);
              hoverController.value = true;
            },
            onExit: (_) {
              onHover(null);
              hoverController.value = false;
            },
            onHover: (event) {
              final RenderBox stackRenderBox =
                  stackKey.currentContext!.findRenderObject() as RenderBox;
              onHoverMove(stackRenderBox.globalToLocal(event.position));
            },
            child: _buildProjectTileContents(hoverController.value),
          );
  }

  Widget _buildProjectTileContents(bool isHovered) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const containerConstraints =
            BoxConstraints(minWidth: 394, maxHeight: 465);

        return Container(
          constraints: containerConstraints,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ScaledImage(
                assetPath: "assets/${projectType.assetPath}/cover.png",
                borderRadius: BorderRadius.circular(Insets.sm),
                isHovered: isHovered,
              ),
              _buildContent(context, isHovered),
            ],
          ),
        );
      },
    );
  }

  Padding _buildContent(BuildContext context, bool isHovered) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIconButton(context, isHovered),
          // const Spacer(),
          // Text(projectType.title, style: TextStyles.h3),
          // const HSpace(size: Insets.m),
          // _buildSwitcher(isHovered),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, bool isHovered) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration * 1.5,
      transitionBuilder: (child, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(opacity: animation, child: child),
      ),
      child: isHovered
          ? IconButton(
              icon: const FaIcon(FontAwesomeIcons.expand),
              color: Colors.white,
              onPressed: () => _showAnimatedDialog(context, projectType),
            )
          : null,
    );
  }

  Future<Dialog?> _showAnimatedDialog(
      BuildContext context, ProjectType projectType) {
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
        return ProjectPreviewDialog(projectType);
      },
    );
  }
}

//   Widget _buildSwitcher(bool isHovered) {
//     return AnimatedSwitcher(
//       switchInCurve: Curves.easeIn,
//       switchOutCurve: Curves.easeOut,
//       duration: kThemeAnimationDuration * 1.5,
//       transitionBuilder: ((child, animation) => SlideTransition(
//             position: Tween<Offset>(
//               begin: animation.isCompleted
//                   ? const Offset(0, -0.5)
//                   : const Offset(0, 0.5),
//               end: Offset.zero,
//             ).animate(animation),
//             child: FadeTransition(
//               opacity: animation,
//               child: Align(
//                 alignment: Alignment.bottomLeft,
//                 child: child,
//               ),
//             ),
//           )),
//       child: isHovered
//           ? ViewProjectButton(projectType)
//           : Text(
//               key: UniqueKey(),
//               projectType.shortDescription,
//               maxLines: 1,
//               style: TextStyles.body1.copyWith(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w100,
//               ),
//             ),
//     );
//   }
// }

class ScaledImage extends HookWidget {
  final String assetPath;
  final BorderRadius borderRadius;
  final bool isHovered;

  const ScaledImage({
    super.key,
    required this.assetPath,
    required this.borderRadius,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    final scaleController =
        useAnimationController(duration: kThemeAnimationDuration * 1.5);
    final scale =
        useAnimation(Tween(begin: 1.0, end: 1.1).animate(scaleController));

    useEffect(() {
      if (isHovered) {
        scaleController.forward();
      } else {
        scaleController.reverse();
      }
      return null;
    }, [isHovered]);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Transform.scale(
        scale: scale,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetPath),
              fit: BoxFit.cover,
            ),
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}

// class ViewProjectButton extends HookWidget {
//   final ProjectType projectType;

//   const ViewProjectButton(
//     this.projectType, {
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     var hoverController = useState(false);

//     return MouseRegion(
//       onEnter: (_) => hoverController.value = true,
//       onExit: (_) => hoverController.value = false,
//       child: GestureDetector(
//         onTap: () => AutoRouter.of(context).push(
//           PortfolioLayoutPageRoute(centerView: ProjectView(projectType)),
//         ),
//         child: Text(
//           key: UniqueKey(),
//           'View Project___',
//           style: TextStyles.body1.copyWith(
//             color: hoverController.value
//                 ? theme.colorScheme.secondary
//                 : Colors.white,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
