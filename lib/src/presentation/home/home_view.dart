import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/domain/project.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/styles.dart';
import 'custom_animated_project_tile.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          const _AnimatedHeader(),
          const SizedBox(height: 100),
          (constraints.isDesktop)
              ? _buildDesktopLayout(constraints)
              : _buildTabletLayout(constraints),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 100,
              child: CustomAnimatedProjectTile(
                constraints: constraints,
                projectType: ProjectType.inky,
              ),
            ),
            const VSpace(size: 40),
            Flexible(
              flex: 47,
              child: CustomAnimatedProjectTile(
                constraints: constraints,
                projectType: ProjectType.githubOAuth,
              ),
            ),
          ],
        ),
        const HSpace(size: 40),
        Row(
          children: [
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
                projectType: ProjectType.crackd,
              ),
            ),
            const VSpace(size: 40),
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
                projectType: ProjectType.crackd,
              ),
            ),
            const VSpace(size: 40),
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
                projectType: ProjectType.crackd,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTabletLayout(BoxConstraints constraints) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: Insets.l),
      shrinkWrap: true,
      itemCount: ProjectType.values.length,
      itemBuilder: (context, index) => CustomAnimatedProjectTile(
        constraints: constraints,
        projectType: ProjectType.values[index],
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
