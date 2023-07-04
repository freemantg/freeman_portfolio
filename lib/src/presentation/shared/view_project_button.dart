import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/styles.dart';
import '../home/custom_animated_opacity.dart';

class ViewProjectButton extends HookWidget {
  const ViewProjectButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.inverseColor = false,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final bool inverseColor;

  @override
  Widget build(BuildContext context) {
    final hoverController = useState(false);

    return TextButton(
      onHover: (_) => hoverController.value = !hoverController.value,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyles.title1.copyWith(
              color: inverseColor ? Colors.white : null,
            ),
          ),
          const VSpace(size: Insets.m),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomAnimationSlider(
              hoverController: hoverController,
              child: FaIcon(
                key: UniqueKey(),
                FontAwesomeIcons.arrowRight,
                size: 18,
                color: inverseColor ? Colors.white : null,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
