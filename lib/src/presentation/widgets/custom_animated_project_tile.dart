import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/widgets/fade_through_transition_switcher.dart';

import '../../shared/styles.dart';

class CustomAnimatedProjectTile extends HookWidget {
  const CustomAnimatedProjectTile({Key? key}) : super(key: key);

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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.sm),
                color: Colors.green,
              ),
              width: 394,
              height: 465,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeThroughTransitionSwitcher(
                      child: hoverController.value
                          ? const FaIcon(
                              FontAwesomeIcons.expand,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const Spacer(),
                    Text('Indigo', style: TextStyles.h2),
                    const HSpace(size: Insets.m),
                    FadeThroughTransitionSwitcher(
                      child: hoverController.value
                          ? Text(
                              'View Project _____',
                              style: TextStyles.body1
                                  .copyWith(color: Colors.white),
                            )
                          : Text(
                              'Description',
                              style: TextStyles.body1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
