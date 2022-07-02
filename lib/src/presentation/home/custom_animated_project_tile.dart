import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import '../../shared/styles.dart';
import '../shared/project_preview_dialog.dart';

class CustomAnimatedProjectTile extends HookWidget {
  const CustomAnimatedProjectTile({Key? key, required this.constraints})
      : super(key: key);
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
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
                borderRadius: BorderRadius.circular(Insets.sm),
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
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
                              onPressed: () => _showAnimatedDialog(context),
                            )
                          : null,
                    ),
                    const Spacer(),
                    Text('Indigo', style: TextStyles.h3),
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
                          ? Text(
                              key: UniqueKey(),
                              'View Project___',
                              style: TextStyles.body1.copyWith(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              key: UniqueKey(),
                              'Description',
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

  Future<Dialog?> _showAnimatedDialog(BuildContext context) {
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
