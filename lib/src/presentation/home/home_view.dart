import 'package:flutter/material.dart';
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
              ),
            ),
            const VSpace(size: 40),
            Flexible(
              flex: 47,
              child: CustomAnimatedProjectTile(
                constraints: constraints,
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
              ),
            ),
            const VSpace(size: 40),
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
            const VSpace(size: 40),
            Expanded(
              child: CustomAnimatedProjectTile(
                constraints: constraints,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTabletLayout(BoxConstraints constraints) {
    return Column(
      children: [
        ...List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: CustomAnimatedProjectTile(constraints: constraints),
          ),
        )
      ],
    );
  }
}

class _AnimatedHeader extends StatelessWidget {
  const _AnimatedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

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
