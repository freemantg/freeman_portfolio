import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/presentation/project/project_view.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/providers.dart';
import 'package:freeman_portfolio/src/shared/styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'animated_color_icon_button.dart';
import 'view_project_button.dart';

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
              children: const [
                ProjectImageCarousel(),
              ],
            ),
          ),
          const Flexible(
            flex: 3,
            child: ProjectPreviewDetails(),
          ),
        ],
      ),
    );
  }
}

class ProjectPreviewDetails extends ConsumerWidget {
  const ProjectPreviewDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
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
                    style: TextStyles.body1.copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                        text: ' •',
                        style: TextStyles.body1.copyWith(color: Colors.red),
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
              ViewProjectButton(
                inverseColor: true,
                title: 'View Project',
                onPressed: () {
                  ref.read(appRouterProvider).popAndPush(
                        PortfolioLayoutPageRoute(
                          centerView: const ProjectView(),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectImageCarousel extends HookWidget {
  const ProjectImageCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return Stack(
      children: [
        ListView.builder(
          controller: scrollController,
          itemCount: 5,
          itemBuilder: (context, index) => Image(
            image: AssetImage('projects/inky/inky_$index.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 42.0,
            horizontal: 50.0,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedColorIconButton(
                  key: UniqueKey(),
                  inverseColor: true,
                  onPressed: () => scrollController.animateTo(
                    scrollController.position.pixels -
                        scrollController.position.maxScrollExtent / 4,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
                  iconData: Icons.arrow_upward,
                ),
                const Spacer(),
                AnimatedColorIconButton(
                  
                  key: UniqueKey(),
                  inverseColor: true,
                  onPressed: () => scrollController.animateTo(
                    scrollController.position.pixels +
                        scrollController.position.maxScrollExtent / 4,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
                  iconData: Icons.arrow_downward,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
