import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/shared/animated_color_icon_button.dart';

const String gitHubUrl = 'https://github.com/freemantg';
const String linkedInUrl = '';
const String instagramUrl = 'https://www.instagram.com/freeman_tg/';

class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        AnimatedUrlIconButton(
          iconData: FontAwesomeIcons.github,
          url: gitHubUrl,
        ),
        AnimatedUrlIconButton(
          iconData: FontAwesomeIcons.linkedin,
          url: linkedInUrl,
        ),
        AnimatedUrlIconButton(
          iconData: FontAwesomeIcons.instagram,
          url: instagramUrl,
        )
      ],
    );
  }
}
