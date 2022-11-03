import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/shared/animated_color_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaBar extends StatelessWidget {
  static const String _gitHubUrl = 'https://github.com/freemantg';
  static const String _linkedInUrl = '';
  static const String _instagramUrl = 'https://www.instagram.com/freeman_tg/';

  const SocialMediaBar({
    Key? key,
  }) : super(key: key);

  Widget _buildSocialMediaIcon({
    required IconData iconData,
    required String url,
  }) {
    return AnimatedColorIconButton(
      onPressed: () async => await _launchSocialUrl(url),
      iconData: iconData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialMediaIcon(
          iconData: FontAwesomeIcons.github,
          url: _gitHubUrl,
        ),
        _buildSocialMediaIcon(
          iconData: FontAwesomeIcons.linkedin,
          url: _linkedInUrl,
        ),
        _buildSocialMediaIcon(
          iconData: FontAwesomeIcons.instagram,
          url: _instagramUrl,
        )
      ],
    );
  }

  Future<void> _launchSocialUrl(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw 'Could not launch $uri';
    }
  }
}
