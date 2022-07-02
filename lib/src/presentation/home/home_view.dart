import 'package:flutter/material.dart';
import 'package:freeman_portfolio/src/shared/extensions.dart';


import '../../shared/styles.dart';
import 'animated_header.dart';
import 'custom_animated_project_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          const AnimatedHeader(),
          const SizedBox(height: 150),
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
