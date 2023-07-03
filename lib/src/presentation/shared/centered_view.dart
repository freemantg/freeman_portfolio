import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  const CenteredView({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.only(
      top: 60,
      left: 70,
      right: 70,
      bottom: 28,
    ),
    this.maxWidthPercentage = 0.80,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final double maxWidthPercentage;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double maxWidth = screenWidth * maxWidthPercentage;

    return Container(
      padding: padding,
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
