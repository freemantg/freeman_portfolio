import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeman_portfolio/src/shared/app_router.gr.dart';

class Logo extends StatelessWidget {
  final String imagePath = 'assets/logo.svg';
  final double width;
  final double height;

  const Logo({super.key, this.width = 250, this.height = 150});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(PortfolioLayoutPageRoute()),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          maxHeight: height,
        ),
        child: SvgPicture.asset(
          imagePath,
          width: width,
        ),
      ),
    );
  }
}

class LogoFooter extends StatelessWidget {
  final String imagePath = 'assets/logoFooter.svg';
  final double width;
  final double height;

  const LogoFooter({super.key, this.width = 250, this.height = 150});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width,
        maxHeight: height,
      ),
      child: SvgPicture.asset(
        imagePath,
        width: width,
      ),
    );
  }
}
