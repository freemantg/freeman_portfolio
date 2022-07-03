import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/shared/animated_color_icon_button.dart';
import 'package:freeman_portfolio/src/shared/constants.dart';
import 'package:freeman_portfolio/src/shared/styles.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 490,
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Meet me here :",
            style: TextStyles.h2.copyWith(color: theme.secondary),
            textAlign: TextAlign.center,
          ),
          const HSpace(size: Insets.m),
          SelectableText(
            ContactDetails.personalEmail,
            style: TextStyles.body1.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const HSpace(size: Insets.m),
          Text('and there:', style: TextStyles.body1),
          const HSpace(size: Insets.m),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedColorIconButton(
                iconData: FontAwesomeIcons.fileArrowDown,
                onPressed: () {},
              ),
              const VSpace(size: Insets.m),
              AnimatedColorIconButton(
                iconData: FontAwesomeIcons.linkedinIn,
                onPressed: () {},
              ),
              const VSpace(size: Insets.m),
              AnimatedColorIconButton(
                iconData: FontAwesomeIcons.github,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
