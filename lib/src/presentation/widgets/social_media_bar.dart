import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({
    Key? key,
  }) : super(key: key);

  IconButton _buildSocialMediaIcon({
    required IconData iconData,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: FaIcon(
        iconData,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialMediaIcon(
          iconData: FontAwesomeIcons.github,
          onPressed: () {},
        ),
        _buildSocialMediaIcon(
          iconData: FontAwesomeIcons.linkedin,
          onPressed: () {},
        ),
        _buildSocialMediaIcon(
          iconData: FontAwesomeIcons.instagram,
          onPressed: () {},
        )
      ],
    );
  }
}
