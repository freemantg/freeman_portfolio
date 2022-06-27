import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  const CenteredView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1260),
        child: child,
      ),
    );
  }
}
