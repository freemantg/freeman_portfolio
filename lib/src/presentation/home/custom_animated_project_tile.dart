import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/project/project_view.dart';

import '../../domain/project.dart';
import '../../shared/app_router.gr.dart';
import '../../shared/styles.dart';
import '../shared/project_preview_dialog.dart';

class CustomAnimatedProjectTile extends HookWidget {
  const CustomAnimatedProjectTile({
    Key? key,
    required this.constraints,
    required this.projectType,
  }) : super(key: key);

  final BoxConstraints constraints;
  final ProjectType projectType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    var hoverController = useState(false);

    return MouseRegion(
      onEnter: (_) => hoverController.value = true,
      onExit: (_) => hoverController.value = false,
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: constraints.biggest.height,
              constraints: const BoxConstraints(minWidth: 394, maxHeight: 465),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${projectType.assetPath}/cover.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(Insets.sm),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedSwitcher(
                      duration: kThemeAnimationDuration * 1.5,
                      transitionBuilder: (child, animation) => SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, -1),
                          end: Offset.zero,
                        ).animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      ),
                      child: hoverController.value
                          ? IconButton(
                              icon: const FaIcon(FontAwesomeIcons.expand),
                              color: Colors.white,
                              onPressed: () => _showAnimatedDialog(
                                context,
                                projectType,
                              ),
                            )
                          : null,
                    ),
                    const Spacer(),
                    Text(projectType.title, style: TextStyles.h3),
                    const HSpace(size: Insets.m),
                    AnimatedSwitcher(
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      duration: kThemeAnimationDuration * 1.5,
                      transitionBuilder: ((child, animation) => SlideTransition(
                            position: Tween<Offset>(
                              begin: animation.isCompleted
                                  ? const Offset(0, -0.5)
                                  : const Offset(0, 0.5),
                              end: Offset.zero,
                            ).animate(animation),
                            child: FadeTransition(
                              opacity: animation,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: child,
                              ),
                            ),
                          )),
                      child: hoverController.value
                          //TODO:
                          ? const ViewProjectButton(ProjectType.crackd)
                          : Text(
                              key: UniqueKey(),
                              projectType.shortDescription,
                              maxLines: 1,
                              style: TextStyles.body1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Dialog?> _showAnimatedDialog(
    BuildContext context,
    ProjectType projectType,
  ) {
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

class ViewProjectButton extends HookWidget {
  final ProjectType projectType;

  const ViewProjectButton(this.projectType, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var hoverController = useState(false);
    return MouseRegion(
      onEnter: (_) => hoverController.value = true,
      onExit: (_) => hoverController.value = false,
      child: GestureDetector(
        onTap: () => AutoRouter.of(context).push(
          PortfolioLayoutPageRoute(centerView: ProjectView(projectType)),
        ),
        child: Text(
          key: UniqueKey(),
          'View Project___',
          style: TextStyles.body1.copyWith(
            color: (hoverController.value)
                ? theme.colorScheme.secondary
                : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
