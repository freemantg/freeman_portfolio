import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/shared/styles.dart';

import '../home/custom_animated_opacity.dart';

class ProjectPreviewDialog extends StatelessWidget {
  const ProjectPreviewDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0.0),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 42.0,
                    horizontal: 50.0,
                  ),
                  color: Colors.blue,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomAnimatedIconColor(
                          iconData: Icons.arrow_back,
                          key: UniqueKey(),
                        ),
                        const VSpace(size: Insets.m),
                        CustomAnimatedIconColor(
                          iconData: Icons.arrow_forward,
                          key: UniqueKey(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        FontAwesomeIcons.xmark,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 93.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Flutter',
                            style:
                                TextStyles.body1.copyWith(color: Colors.white),
                            children: [
                              TextSpan(
                                text: ' •',
                                style: TextStyles.body1
                                    .copyWith(color: Colors.red),
                              ),
                            ]),
                      ),
                      const HSpace(size: Insets.m),
                      Text(
                        'Project Name',
                        style: TextStyles.h2,
                      ),
                      const HSpace(size: Insets.l),
                      Text(
                        'Águias Cookie é uma marca de cookies brasileira, de São Paulo. A empresa pretende investir na extroversão e na criatividade para atrair clientes das mais diversas...',
                        style: TextStyles.body1.copyWith(color: Colors.white),
                        softWrap: true,
                      ),
                      const HSpace(size: Insets.xl),
                      const ViewProjectButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ViewProjectButton extends HookWidget {
  const ViewProjectButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hoverController = useState(false);

    return TextButton(
      onHover: (_) => hoverController.value = !hoverController.value,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'View Project',
            style: TextStyles.title1.copyWith(color: Colors.white),
          ),
          const VSpace(size: Insets.m),
          CustomAnimationSlider(
            hoverController: hoverController,
            child: FaIcon(
              key: UniqueKey(),
              FontAwesomeIcons.arrowRight,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
