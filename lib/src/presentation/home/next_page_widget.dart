import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freeman_portfolio/src/presentation/project/projects_view.dart';
import 'package:freeman_portfolio/src/shared/styles.dart';

import '../../shared/app_router.gr.dart';

class HoverColorChangeText extends HookWidget {
  final String text;
  final VoidCallback onTap;

  const HoverColorChangeText({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHovering = useState(false);
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => isHovering.value = true,
      onExit: (_) => isHovering.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyles.title1.copyWith(
            color: isHovering.value ? Colors.white : colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

class HoverColorChangeIcon extends HookWidget {
  final IconData icon;
  final VoidCallback onTap;

  const HoverColorChangeIcon({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHovering = useState(false);
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => isHovering.value = true,
      onExit: (_) => isHovering.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: isHovering.value ? Colors.white : colorScheme.secondary,
          size: 18,
        ),
      ),
    );
  }
}

class NextPageWidget extends StatelessWidget {
  const NextPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToProjectsPage() {
      context.router.pushAndPopUntil(
        PortfolioLayoutPageRoute(centerView: const ProjectsView()),
        predicate: (_) => false,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 10),
        HoverColorChangeText(text: '1', onTap: navigateToProjectsPage),
        const SizedBox(width: 24),
        HoverColorChangeText(text: '2', onTap: navigateToProjectsPage),
        const SizedBox(width: 24),
        HoverColorChangeIcon(
          icon: Icons.arrow_forward,
          onTap: navigateToProjectsPage,
        ),
      ],
    );
  }
}
