import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final String imagePath = 'assets/logo.svg';
  final double width;
  final double height;

  const Logo({super.key, this.width = 250, this.height = 150});

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
