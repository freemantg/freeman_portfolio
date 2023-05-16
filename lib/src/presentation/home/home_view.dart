import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/domain/project.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styles.dart';
import 'custom_animated_project_tile.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hoverController = useState<ProjectType?>(null);
    final mouseRegionPos = useState<Offset>(Offset.zero);
    final stackKey = GlobalKey();

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          const _AnimatedHeader(),
          const SizedBox(height: 100),
          (constraints.isDesktop)
              ? _buildDesktopLayout(
                  context, hoverController, mouseRegionPos, stackKey)
              : _buildTabletLayout(hoverController, mouseRegionPos, stackKey),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    ValueNotifier<ProjectType?> hoverController,
    ValueNotifier<Offset> mouseRegionPos,
    GlobalKey stackKey,
  ) {
    return Stack(
      key: stackKey,
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 100,
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.inky,
                    onHover: (projectType) {
                      hoverController.value = projectType;
                    },
                    onHoverMove: (details) {
                      mouseRegionPos.value = details;
                    },
                    stackKey: stackKey,
                  ),
                ),
                const VSpace(size: 40),
                Flexible(
                  flex: 47,
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.githubOAuth,
                    onHover: (projectType) {
                      hoverController.value = projectType;
                    },
                    onHoverMove: (details) {
                      mouseRegionPos.value = details;
                    },
                    stackKey: stackKey,
                  ),
                ),
              ],
            ),
            const HSpace(size: 40),
            Row(
              children: [
                Expanded(
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.inky,
                    onHover: (projectType) {
                      hoverController.value = projectType;
                    },
                    onHoverMove: (details) {
                      mouseRegionPos.value = details;
                    },
                    stackKey: stackKey,
                  ),
                ),
                const VSpace(size: 40),
                Expanded(
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.glum,
                    onHover: (projectType) {
                      hoverController.value = projectType;
                    },
                    onHoverMove: (details) {
                      mouseRegionPos.value = details;
                    },
                    stackKey: stackKey,
                  ),
                ),
                const VSpace(size: 40),
                Expanded(
                  child: CustomAnimatedProjectTile(
                    projectType: ProjectType.crackd,
                    onHover: (projectType) {
                      hoverController.value = projectType;
                    },
                    onHoverMove: (details) {
                      mouseRegionPos.value = details;
                    },
                    stackKey: stackKey,
                  ),
                ),
              ],
            )
          ],
        ),
        if (hoverController.value != null)
          _buildFloatingProjectDescription(
            context,
            hoverController.value!,
            mouseRegionPos,
          ),
      ],
    );
  }

  Widget _buildFloatingProjectDescription(
    BuildContext context,
    ProjectType projectType,
    ValueNotifier<Offset> mouseRegionPos,
  ) {
    return Positioned(
      left: mouseRegionPos.value.dx,
      top: mouseRegionPos.value.dy,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              projectType.title,
              style: TextStyles.h3.copyWith(color: Colors.white),
            ),
            Text(
              projectType.shortDescription,
              style: TextStyles.title1.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(
    ValueNotifier<ProjectType?> hoverController,
    ValueNotifier<Offset> mouseRegionPos,
    GlobalKey stackKey,
  ) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: Insets.l),
      shrinkWrap: true,
      itemCount: ProjectType.values.length,
      itemBuilder: (context, index) => CustomAnimatedProjectTile(
        stackKey: stackKey,
        projectType: ProjectType.values[index],
        onHover: (projectType) {
          hoverController.value = projectType;
        },
        onHoverMove: (details) {
          mouseRegionPos.value = details;
        },
      ),
    );
  }
}

class _AnimatedHeader extends StatelessWidget {
  const _AnimatedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Freeman.",
          textAlign: TextAlign.center,
          style: TextStyles.h1,
        ),
        Text(
          "Flutter Developer Portfolio",
          textAlign: TextAlign.center,
          style: TextStyles.title2,
        ),
      ],
    );
  }
}
