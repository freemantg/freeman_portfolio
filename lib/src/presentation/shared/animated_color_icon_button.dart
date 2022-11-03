import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedColorIconButton extends HookWidget {
  const AnimatedColorIconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.inverseColor = false,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  final bool inverseColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final isHovered = useState(false);

    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            color: isHovered.value
                ? theme.secondary
                : inverseColor
                    ? Colors.white
                    : theme.primary,
          ),
        ),
      ),
    );
  }
}

class AnimatedUrlIconButton extends HookWidget {
  const AnimatedUrlIconButton({
    super.key,
    required this.iconData,
    required this.url,
    this.inverseColor = false,
  });

  final IconData iconData;
  final bool inverseColor;
  final String url;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final isHovered = useState(false);

    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: IconButton(
          onPressed: () async => await _launchSocialUrl(url),
          icon: Icon(
            iconData,
            color: isHovered.value
                ? theme.secondary
                : inverseColor
                    ? Colors.white
                    : theme.primary,
          ),
        ),
      ),
    );
  }

  Future<void> _launchSocialUrl(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw 'Could not launch $uri';
    }
  }
}
