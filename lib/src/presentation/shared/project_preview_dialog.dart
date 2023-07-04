import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeman_portfolio/src/domain/project.dart';
import 'package:freeman_portfolio/src/presentation/project/project_view.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:freeman_portfolio/src/shared/styles.dart';

import 'animated_color_icon_button.dart';
import 'view_project_button.dart';

class ProjectPreviewDialog extends StatelessWidget {
  final Project project;

  const ProjectPreviewDialog(
    this.project, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: EdgeInsets.zero,
      child: LayoutBuilder(builder: (context, constraints) {
        return Flex(
          direction: constraints.isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            Expanded(
              flex: 5,
              child: ProjectImageCarousel(project),
            ),
            Expanded(
              flex: 3,
              child: ProjectPreviewDetails(
                project,
                constraints: constraints,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ProjectPreviewDetails extends StatelessWidget {
  const ProjectPreviewDetails(
    this.project, {
    required this.constraints,
    Key? key,
  }) : super(key: key);

  final Project project;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: constraints.isMobile ? Insets.l : 93.0,
        vertical: 32.0,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Flutter',
                        style: TextStyles.body1White,
                        children: [
                          TextSpan(
                            text: ' •',
                            style: TextStyles.body1.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ]),
                  ),
                  const HSpace(size: Insets.m),
                  Text(
                    project.title,
                    style: TextStyles.h2White,
                  ),
                  const HSpace(size: Insets.l),
                  Text(
                    project.description,
                    style: TextStyles.body1White,
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const HSpace(size: Insets.xl),
                  const FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Divider(color: Colors.white, thickness: 0.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Framework & Architecture',
                      style: TextStyles.title1White,
                    ),
                  ),
                  Text(
                    project.shortTechnicalDescription,
                    style: TextStyles.body1.copyWith(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  const HSpace(size: Insets.xl),
                  ViewProjectButton(
                    inverseColor: true,
                    title: 'View Project',
                    onPressed: () {
                      context.router.popAndPush(
                        PortfolioLayoutPageRoute(
                          centerView: ProjectView(project),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                FontAwesomeIcons.xmark,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectImageCarousel extends HookWidget {
  const ProjectImageCarousel(
    this.project, {
    Key? key,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Stack(
      children: [
        ListView.builder(
          controller: scrollController,
          itemCount: project.assetLength,
          itemBuilder: (context, index) {
            return Image(
              image: AssetImage(
                'projects/${project.folderName}/${project.folderName}_$index.png',
              ),
            );
          },
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
